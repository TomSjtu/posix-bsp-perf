#ifndef __VIDEO_DETECT_APP_HPP__
#define __VIDEO_DETECT_APP_HPP__

#include <framework/BasePerfCase.hpp>
#include <shared/BspLogger.hpp>
#include <shared/ArgParser.hpp>
#include <shared/BspFileUtils.hpp>
#include <bsp_dnn/dnnObjDetector.hpp>
#include <bsp_codec/IDecoder.hpp>
#include <bsp_codec/IEncoder.hpp>
#include <bsp_g2d/IGraphics2D.hpp>
#include <memory>
#include <string>
#include <iostream>
#include <vector>

namespace bsp_perf {
namespace perf_cases {
using namespace bsp_dnn;
using namespace bsp_codec;
using namespace bsp_g2d;

class VideoDetectApp : public bsp_perf::common::BasePerfCase
{
public:
    VideoDetectApp(bsp_perf::shared::ArgParser&& args):
        BasePerfCase(std::move(args)),
        m_logger{std::make_unique<bsp_perf::shared::BspLogger>("VideoDetectApp")}
    {
        m_logger->setPattern();
        auto& params = getArgs();
        std::string dnnType;
        std::string pluginPath;
        std::string labelTextPath;
        params.getOptionVal("--dnnType", dnnType);
        params.getOptionVal("--pluginPath", pluginPath);
        params.getOptionVal("--labelTextPath", labelTextPath);
        m_dnnObjDetector = std::make_unique<bsp_dnn::dnnObjDetector>(dnnType, pluginPath, labelTextPath);
    }
    VideoDetectApp(const VideoDetectApp&) = delete;
    VideoDetectApp& operator=(const VideoDetectApp&) = delete;
    VideoDetectApp(VideoDetectApp&&) = delete;
    VideoDetectApp& operator=(VideoDetectApp&&) = delete;
    ~VideoDetectApp()
    {
        ;
    }
private:

    void onInit() override
    {
        auto& params = getArgs();
        std::string inputVideoPath;
        params.getOptionVal("--inputVideoPath", inputVideoPath);
        loadVideoFile(inputVideoPath);

        std::string modelPath;
        params.getOptionVal("--modelPath", modelPath);
        m_dnnObjDetector->loadModel(modelPath);

        std::string g2dPlatform;
        params.getOptionVal("--graphics2D", g2dPlatform);
        m_g2d = IGraphics2D::create(g2dPlatform);

        std::string decType;
        params.getOptionVal("--decoderType", decType);
        setupDecoder(decType);

        params.getOptionVal("--encoderType", m_encoderType);

        std::string outputVideoPath;
        params.getOptionVal("--outputVideoPath", outputVideoPath);
        auto fp = fopen(outputVideoPath.c_str(), "wb");
        if (fp == nullptr)
        {
            m_logger->printStdoutLog(bsp_perf::shared::BspLogger::LogLevel::Error, "VideoDetectApp::onInit() Failed to open output video file: {}", outputVideoPath);
            throw std::runtime_error("Failed to open output video file.");
        }
        m_out_fp.reset(fp);
    }

    void onProcess() override
    {
        m_logger->printStdoutLog(bsp_perf::shared::BspLogger::LogLevel::Info, "read video size: {} bytes", m_videoFileContext->size);
        const int PKT_CHUNK_SIZE = 8192;
        uint8_t* pkt_data_start = m_videoFileContext->data.get();
        uint8_t* pkt_data_end = pkt_data_start + m_videoFileContext->size;

        while (m_videoFileContext->size > 0)
        {
            int pkt_eos = 0;
            int chunk_size = PKT_CHUNK_SIZE;

            if (pkt_data_start + chunk_size >= pkt_data_end)
            {
                pkt_eos = 1;
                chunk_size = pkt_data_end - pkt_data_start;
            }

            DecodePacket dec_pkt = {
                .data = pkt_data_start,
                .pkt_size = chunk_size,
                .pkt_eos = pkt_eos,
            };
            m_decoder->decode(dec_pkt);

            pkt_data_start += chunk_size;

            if (pkt_data_start >= pkt_data_end)
            {
                m_logger->printStdoutLog(bsp_perf::shared::BspLogger::LogLevel::Warn, "VideoDetectApp::onProcess() Video file read complete");
                break;
            }
        }
    }

    void onRender() override
    {
        bsp_dnn::ObjDetectInput objDetectInput = {
            .handleType = "opencv4",
            .imageHandle = m_orig_image_ptr,
        };
        m_dnnObjDetector->pushInputData(std::make_shared<bsp_dnn::ObjDetectInput>(objDetectInput));
        setObjDetectParams(m_objDetectParams);
        m_dnnObjDetector->runObjDetect(m_objDetectParams);
        auto& objDetectOutput = m_dnnObjDetector->popOutputData();
        std::vector<cv::Scalar> colors = {
                cv::Scalar(255, 0, 0),    // Blue
                cv::Scalar(0, 255, 0),    // Green
                cv::Scalar(0, 0, 255),    // Red
                cv::Scalar(255, 255, 0),  // Cyan
                cv::Scalar(255, 0, 255),  // Magenta
                cv::Scalar(0, 255, 255),  // Yellow
                cv::Scalar(128, 0, 0),    // Maroon
                cv::Scalar(0, 128, 0),    // Olive
                cv::Scalar(0, 0, 128),    // Navy
                cv::Scalar(128, 128, 0),  // Teal
                cv::Scalar(128, 0, 128),  // Purple
                cv::Scalar(0, 128, 128)   // Aqua
        };
        std::map<std::string, cv::Scalar> labelColorMap;
        for (size_t i = 0; i < objDetectOutput.size(); ++i)
        {
            const auto& obj = objDetectOutput[i];
            if (labelColorMap.find(obj.label) == labelColorMap.end())
            {
                labelColorMap[obj.label] = colors[i % colors.size()];
            }
        }

        for (const auto& obj : objDetectOutput)
        {
            m_logger->printStdoutLog(bsp_perf::shared::BspLogger::LogLevel::Info, "{} VideoDetectApp::onProcess() objDetectOutput: bbox: [{}, {}, {}, {}], score: {}, label: {}",
                LOG_TAG, obj.bbox.left, obj.bbox.top, obj.bbox.right, obj.bbox.bottom, obj.score, obj.label);
            cv::rectangle(*m_orig_image_ptr, cv::Point(obj.bbox.left, obj.bbox.top), cv::Point(obj.bbox.right, obj.bbox.bottom),
                    labelColorMap[obj.label], 2);
            cv::putText(*m_orig_image_ptr, obj.label, cv::Point(obj.bbox.left, obj.bbox.top + 12), cv::FONT_HERSHEY_COMPLEX, 0.4, cv::Scalar(256, 255, 255));
        }
    }

    void onRelease() override
    {
        m_logger->printStdoutLog(bsp_perf::shared::BspLogger::LogLevel::Info, "waiting finish");
        std::this_thread::sleep_for(std::chrono::seconds(1));
        fflush(m_out_fp.get());
        fclose(m_out_fp.get());
        m_dnnObjDetector.reset();
    }

private:

    void loadVideoFile(std::string& videoPath)
    {
        m_decode_format = BspFileUtils::getFileExtension(videoPath);

        if(m_decode_format.compare("h264") == 0 || m_decode_format.compare("h265") == 0)
        {
            m_logger->printStdoutLog(bsp_perf::shared::BspLogger::LogLevel::Info, "VideoDetectApp::format: {}", m_decode_format);
        }
        else
        {
            m_logger->printStdoutLog(bsp_perf::shared::BspLogger::LogLevel::Error, "VideoDetectApp::onInit() Unsupported video format: {}", m_decode_format);
            throw std::runtime_error("Unsupported video format.");
        }
        m_videoFileContext = BspFileUtils::LoadFileMmap(videoPath);
    }

    void setupDecoder(std::string& decType)
    {
        m_decoder = IDecoder::create(decType);
        DecodeConfig cfg = {
            .encoding = m_decode_format,
            .fps = 30,
        };
        m_decoder->setup(cfg);

        auto decoderCallback = [this](std::any userdata, std::shared_ptr<DecodeOutFrame> frame)
        {
            if (m_encoder == nullptr)
            {
                m_encoder = IEncoder::create(m_encoderType);
                EncodeConfig enc_cfg = {
                    .encodingType = "h264",
                    .frameFormat = "YUV420SP",
                    .fps = 30,
                    .width = frame.width,
                    .height = frame.height,
                    .hor_stride = frame.width_stride,
                    .ver_stride = frame.height_stride,
                };
                m_encoder->setup(enc_cfg);
            }

            // auto& objDetectOutput = dnnInference(frame);

            std::shared_ptr<EncodeInputBuffer> enc_in_buf = m_encoder->getInputBuffer();
            std::shared_ptr<IGraphics2D::G2DBuffer> g2d_dec_out_buf = m_g2d->createG2DBuffer("virtual", frame.virt_addr, frame.width * frame.height * 3 / 2, frame.width, frame.height, frame.format, frame.width_stride, frame.height_stride);
            std::shared_ptr<IGraphics2D::G2DBuffer> g2d_enc_in_buf = m_g2d->createG2DBuffer("virtual", enc_in_buf->input_buf_addr, frame.width * frame.height * 3 / 2, frame.width, frame.height, "YUV420SP", frame.width_stride, frame.height_stride);
            m_g2d->imageCopy(g2d_dec_out_buf, g2d_enc_in_buf);

            int enc_data_size;
            m_frame_index++;
            int enc_buf_size = m_encoder->getFrameSize();
            // Encode to file
            // Write header on first frame->
            if (m_frame_index == 1)
            {
                std::string enc_header;
                m_encoder->getEncoderHeader(enc_header);
                fwrite(enc_header.c_str(), 1, enc_header.size(), m_out_fp.get());
            }

            EncodePacket enc_pkt = {
                .data = nullptr,
                .pkt_len = 0,
                .max_size = enc_buf_size,
                .pkt_eos = frame.pkt_eos,
            };
            m_encoder->encode(*enc_in_buf, enc_pkt);
            fwrite(enc_pkt.data, 1, enc_pkt.pkt_len, m_out_fp.get());

        };

        m_decoder->setDecodeReadyCallback(decoderCallback, nullptr);
    }

    void setObjDetectParams(ObjDetectParams& objDetectParams)
    {
        // IDnnEngine::dnnInputShape shape;
        // m_dnnObjDetector->getInputShape(shape);
        // objDetectParams.model_input_width = shape.width;
        // objDetectParams.model_input_height = shape.height;
        // objDetectParams.conf_threshold = 0.25;
        // objDetectParams.nms_threshold = 0.45;
        // objDetectParams.scale_width = shape.width / m_orig_image_ptr->cols;
        // objDetectParams.scale_height = shape.height / m_orig_image_ptr->rows;
        // objDetectParams.pads.left = 0;
        // objDetectParams.pads.right = 0;
        // objDetectParams.pads.top = 0;
        // objDetectParams.pads.bottom = 0;
        // m_dnnObjDetector->getOutputQuantParams(objDetectParams.quantize_zero_points, objDetectParams.quantize_scales);
    }

    std::vector<ObjDetectOutputBox>& dnnInference(std::shared_ptr<DecodeOutFrame> frame)
    {
        bsp_dnn::ObjDetectInput objDetectInput = {
            .handleType = "DecodeOutFrame",
            .imageHandle = frame,
        };

        m_dnnObjDetector->pushInputData(std::make_shared<bsp_dnn::ObjDetectInput>(objDetectInput));
        setObjDetectParams(m_objDetectParams);
        m_dnnObjDetector->runObjDetect(m_objDetectParams);
        return m_dnnObjDetector->popOutputData();
    }

private:
    std::string m_name {"[VideoDetectApp]:"};
    std::unique_ptr<bsp_perf::shared::BspLogger> m_logger{nullptr};
    std::unique_ptr<bsp_dnn::dnnObjDetector> m_dnnObjDetector{nullptr};
    bsp_dnn::ObjDetectParams m_objDetectParams{};
    std::shared_ptr<BspFileUtils::FileContext> m_videoFileContext{nullptr};

    std::string m_encoderType{""};
    std::unique_ptr<IDecoder> m_decoder{nullptr};
    std::unique_ptr<IEncoder> m_encoder{nullptr};
    std::unique_ptr<IGraphics2D> m_g2d{nullptr};
    std::string m_decode_format{""};
    std::shared_ptr<FILE> m_out_fp{nullptr};
    size_t m_frame_index{0};
};


} // namespace perf_cases
} // namespace bsp_perf

#endif // __VIDEO_DETECT_APP_HPP__