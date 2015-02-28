
class Keyboard {
  boolean holdingLeft = false;
  boolean holdingRight = false;
  boolean holdingUp = false;
  boolean holdingDown = false;

  void modifyKey(int key, boolean setThatKeyTo) {
    if (key == KeyEvent.VK_LEFT) {
      holdingLeft = setThatKeyTo;
    }
    if (key == KeyEvent.VK_RIGHT) {
      holdingRight = setThatKeyTo;
    }
    if (key == KeyEvent.VK_UP) {
      holdingUp = setThatKeyTo;
    }
    if (key == KeyEvent.VK_DOWN) {
      holdingDown = setThatKeyTo;
    }
  } // end of press key
} // end of class


