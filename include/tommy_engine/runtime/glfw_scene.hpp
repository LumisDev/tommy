#pragma once

#include <tommy_engine/scene.hpp>
#include <GLFW/glfw3.h>
#define GLFW_INCLUDE_VULKAN

class GLFWScene : public TommyScene {
    public:
        GLFWScene(char* title, int width, int height, int isResized = GLFW_TRUE, int isFullscreen = GLFW_FALSE);
        void init() override;
        void update() override;
        void crash() override;
        static bool running;
    private:
        GLFWwindow *window;
        static void resetRunningState(bool value);
        char* title;
        int width;
        int height;
        int isResized;
};