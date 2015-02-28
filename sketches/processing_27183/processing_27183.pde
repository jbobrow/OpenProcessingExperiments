


class Keyboard {

  Boolean holdingUp,holdingRight,holdingLeft,holdingSpace;

  Keyboard() {
    holdingUp=holdingRight=holdingLeft=holdingSpace=false;
  }


  void pressKey(int key) 
  {
    if(key == KeyEvent.VK_R) 
    { 
      if(screenNumber == 3)
      {
        resetGame();
      }
    }


    if (key == KeyEvent.VK_UP) {
      holdingUp = true;
    }
    if (key == KeyEvent.VK_LEFT) {
      holdingLeft = true;
    }
    if (key == KeyEvent.VK_RIGHT) {
      holdingRight = true;
    }
    if (key == KeyEvent.VK_SPACE) {
      holdingSpace = true;
    }
  }

  void releaseKey(int key) {
    if (key == KeyEvent.VK_UP) {
      holdingUp = false;
    }
    if (key == KeyEvent.VK_LEFT) {
      holdingLeft = false;
    }
    if (key == KeyEvent.VK_RIGHT) {
      holdingRight = false;
    }
    if (key == KeyEvent.VK_SPACE) {
      holdingSpace = false;
    }
  }
}


