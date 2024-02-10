#include <tommy_engine/runtime/glfw_scene.hpp>
#include <stdexcept>
GLFWScene::GLFWScene(char* title, int width, int height, int isResized){

}
void GLFWScene::init() {
    if (!glfwInit()){
        throw std::runtime_error("Failed to initialize GLFW");
    }
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
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