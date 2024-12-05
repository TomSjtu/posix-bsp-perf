#ifndef __IENCODER_HPP__
#define __IENCODER_HPP__

#include <memory>
#include <string>
#include <any>
#include <functional>

namespace bsp_codec
{
using encodeReadyCallback = std::function<void(std::any userdata, const char* data, int size)>;
struct EncodeConfig
{
    // encoding can be "h264", "h265"
    std::string encoding{"h264"};
    int fps{0};
    std::any data{nullptr};
};

struct EncodeFrame
{
    uint8_t* data{nullptr};
    size_t frame_size{0};
    int frame_eos;
};
class IEncoder
{
public:
    /**
     * @brief Factory function to create an IEncoder instance.
     *
     * This static method creates and returns a unique pointer to an IEncoder
     * instance based on the specified codec platform.
     *
     * @param codecPlatform A string representing the codec platform for which
     * the IDecoder instance is to be created.
     * Supported values:
     * - "rkmpp" for Rockchip MPP decoder
     *
     * @throws std::invalid_argument If an invalid codec platform is specified.
     * @return std::unique_ptr<IEncoder> A unique pointer to the created IEncoder instance.
     */
    static std::unique_ptr<IEncoder> create(const std::string& codecPlatform);

    virtual int setup(EncodeConfig& cfg) = 0;
    virtual void setEncodeReadyCallback(encodeReadyCallback callback, std::any userdata) = 0;
    virtual int encode(EncodeFrame& frame_data) = 0;
    virtual int getEncoderHeader(char* enc_buf, int max_size) = 0;
    virtual int reset() = 0;

    virtual size_t getFrameSize() = 0;
    virtual ~IEncoder() = default;

protected:
    IEncoder() = default;
    IEncoder(const IEncoder&) = delete;
    IEncoder& operator=(const IEncoder&) = delete;
};

} // namespace bsp_codec

#endif // __IENCODER_HPP__