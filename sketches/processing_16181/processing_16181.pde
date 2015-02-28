
int fpsCount = 0;
int prevSecond = -1;
 
void HandleFPS(){
  ++fpsCount;
  if (prevSecond != second()) {
    println(fpsCount);  // Print FPS
    fpsCount = 0;
    prevSecond = second();
  }
}

