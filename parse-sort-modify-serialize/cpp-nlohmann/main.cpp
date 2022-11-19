#include "json.hpp"
#include <iostream>
#include <algorithm>
#include <fstream>

using json = nlohmann::json;

bool sortFunction(json& a, json& b) {
    return a["age"] < b["age"];
}

void task(int i) {
    std::ifstream f("../data.json");
    json parsed = json::parse(f);
    f.close();
    std::sort(parsed.begin(), parsed.end(), sortFunction);
    for (auto& [key, value] : parsed.items()) {
        value["full_name"] = value["first_name"].get<std::string>() + " " + value["last_name"].get<std::string>();
        value["can_drink"] = value["age"] > 18;
    }
    std::string serialized = parsed.dump();
    std::ofstream wf("results/result-" + std::to_string(i) + ".json");
    wf.write(serialized.c_str(), serialized.size());
    wf.close();
}

int main() {
    for (int i = 0; i < 1000; i++) {
        task(i);
    }
}