/**
 * @file helpers.cpp
 * @brief This file contains the little helper functions used elsewhere.
 */

#pragma once

#include <chrono>
#include <utility>
#include <string_view>

inline uint64_t unix_time() {
    return std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count();
}

void print_file_contents(std::string_view file_path);

void print_fill(std::pair<int, double> fill, int quantity, uint64_t start_time, uint64_t end_time);
