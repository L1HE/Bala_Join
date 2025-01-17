#include "debug.hpp"

#include <iostream>

using std::to_string;

std::string to_string(std::string s) { return '"' + s + '"'; }
std::string to_string(const char *s) { return to_string((std::string)s); }
std::string to_string(bool b) { return (b ? "true" : "false"); }
void debug_out() { std::cerr << std::endl; }