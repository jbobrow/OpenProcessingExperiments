
class Keyboard {
  // used to track keyboard input
  Boolean Up, Right, Left, Down;

  Keyboard() {
    Up=Right=Left=Down=false;
  }


  void pressKey(int key) {
    if(key == KeyEvent.VK_R) { // never will be held down, so no Boolean needed to track it
      if(win()) { // if the game has been won...
        resetGame(); // then R key resets it
      }
    }

    if (key == KeyEvent.VK_UP) {
      Up = true;
    }
    if (key == KeyEvent.VK_LEFT) {
      Left = true;
    }
    if (key == KeyEvent.VK_RIGHT) {
      Right = true;
    }
    if (key == KeyEvent.VK_SPACE) {
      Down = true;
    }
  }
  void releaseKey(int key) {
    if (key == KeyEvent.VK_UP) {
      Up = false;
    }
    if (key == KeyEvent.VK_LEFT) {
      Left = false;
    }
    if (key == KeyEvent.VK_RIGHT) {

      Right = false;
    }
    if (key == KeyEvent.VK_SPACE) {
      Down = false;
    }
  }
}


