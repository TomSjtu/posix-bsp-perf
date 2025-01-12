#ifndef __CONTAINER_HEADER_HPP__
#define __CONTAINER_HEADER_HPP__

#include <string>
#include <unordered_map>
#include <vector>

namespace bsp_container
{
struct StreamCodecParams
{
    std::string codec_type{};
    int64_t bit_rate;
    /// video specific params
    float sample_aspect_ratio;
    float frame_rate;
    int width;
    int height;
    /// audio specific params
};

struct StreamInfo
{
    int index;
    std::unordered_map<std::string, std::string> metadata{};
    std::vector<std::string> disposition_list{};
    int64_t start_time;
    int64_t duration;
    int64_t num_of_frames;
    StreamCodecParams codec_params{};
};

struct ContainerInfo
{
    std::string container_type{};
    std::unordered_map<std::string, std::string> metadata{};
    size_t num_of_streams{0};
    std::vector<StreamInfo> stream_info_list{};
    int64_t bit_rate{0};
    size_t packet_size{0};
};

struct StreamPacket
{
    int64_t pts;
    int64_t dts;
    int stream_index;
    std::vector<uint8_t> pkt_data{};
    size_t pkt_size{0};
    int64_t pos;
};

} // namespace bsp_container

#endif // __CONTAINER_HEADER_HPP__