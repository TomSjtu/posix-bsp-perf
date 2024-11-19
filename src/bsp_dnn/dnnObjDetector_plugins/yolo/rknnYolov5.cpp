#include "rknnYolov5.hpp"
#include <opencv2/opencv.hpp>
#include <memory>
#include <any>
#include <iostream>

namespace bsp_dnn
{

int rknnYolov5::preProcess(const ObjDetectParams& params, ObjDetectInput& inputData, IDnnEngine::dnnInput& outputData)
{
    if (inputData.handleType.compare("opencv4") != 0)
    {
        throw std::invalid_argument("Only opencv4 is supported.");
    }

    auto orig_image_ptr = std::any_cast<std::shared_ptr<cv::Mat>>(inputData.imageHandle);
    if (orig_image_ptr == nullptr)
    {
        throw std::invalid_argument("inputData.imageHandle is nullptr.");
    }
    cv::Mat orig_image = *orig_image_ptr;
    cv::Mat rgb_image;
    cv::cvtColor(orig_image, rgb_image, cv::COLOR_BGR2RGB);
    auto img_width  = rgb_image.cols;
    auto img_height = rgb_image.rows;

    struct bboxRect<int> pads;
    memset(&pads, 0, sizeof(struct bboxRect<int>));
    cv::Size target_size(params.model_input_width, params.model_input_height);
    cv::Mat padded_image(target_size.height, target_size.width, CV_8UC3);
    float min_scale = std::min(params.scale_width, params.scale_height);
    float scale_w = min_scale;
    float scale_h = min_scale;
    cv::Mat resized_image;
    cv::resize(rgb_image, resized_image, cv::Size(), min_scale, min_scale);

    // 计算填充大小
    int pad_width = target_size.width - resized_image.cols;
    int pad_height = target_size.height - resized_image.rows;
    pads.left = pad_width / 2;
    pads.right = pad_width - pads.left;
    pads.top = pad_height / 2;
    pads.bottom = pad_height - pads.top;

    // 在图像周围添加填充
    cv::copyMakeBorder(resized_image, padded_image, pads.top, pads.bottom, pads.left, pads.right, cv::BORDER_CONSTANT, cv::Scalar(128, 128, 128));

    outputData.index = 0;
    outputData.shape.width = params.model_input_width;
    outputData.shape.height = params.model_input_height;
    outputData.shape.channel = 3;
    outputData.size = padded_image.total() * padded_image.elemSize();
    outputData.buf.reset(new uint8_t[outputData.size]);
    outputData.dataType = "UINT8";
    std::memcpy(outputData.buf.get(), padded_image.data, outputData.size);
    return 0;
}

int rknnYolov5::postProcess(const std::string& labelTextPath, const ObjDetectParams& params,
        std::vector<IDnnEngine::dnnOutput>& inputData, std::vector<ObjDetectOutputBox>& outputData)
{
    if (inputData.size() != RKNN_YOLOV5_OUTPUT_BATCH || labelTextPath.empty())
    {
        throw std::invalid_argument("The size of inputData is not equal to RKNN_YOLOV5_OUTPUT_BATCH or labelTextPath is empty.");
    }

    int ret = m_yoloPostProcess.initLabelMap(labelTextPath);
    if (ret != 0)
    {
        return ret;
    }
    return m_yoloPostProcess.runPostProcess(params, inputData, outputData);
}

}   // namespace bsp_dnn