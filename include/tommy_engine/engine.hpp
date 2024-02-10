#pragma once


#include <tommy_engine/scene.hpp>

class TommyEngine {
    public:
        static void loadScene(TommyScene* scene);
        static void update();
        static void crash();
    private:
        static TommyScene *currentScene;
        static bool running;
        static void resetRunningStatus(bool value);
};