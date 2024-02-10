#include <tommy_engine/runtime/glfw_scene.hpp>
#include <stdexcept>
GLFWScene::GLFWScene(char* title, int width, int height, int isResized, int isFullscreen){
    this->title = title;
    this->width = width;
    this->height = height;
    this->isResized = isResized;
}
void GLFWScene::init() {
    if (!glfwInit()){
        throw std::runtime_error("Failed to initialize GLFW");
    }
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    glfwWindowHint(GLFW_RESIZABLE, isResized);
    glfwWindowHint(GLFW_VISIBLE, GLFW_TRUE);
    window = glfwCreateWindow(width, height, title, isFullscreen == GLFW_TRUE ? glfwGetPrimaryMonitor() : NULL, NULL);
    
}
void GLFWScene::resetRunningState(bool value){
    running = value;
}
void GLFWScene::update(){
    resetRunningState(!glfwWindowShouldClose(window));
    while (running){
        glfwPollEvents();
    }
}