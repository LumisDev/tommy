#include <tommy_engine/engine.hpp>

void TommyEngine::loadScene(TommyScene *scene){
    resetRunningStatus(true);
    currentScene = scene;
    
}

void TommyEngine::update(){
    if(running){
        currentScene->update();
    }
}

void TommyEngine::crash(){
    resetRunningStatus(false);
}
void TommyEngine::resetRunningStatus(bool status){
    running = status;
    currentScene->running = status;
}