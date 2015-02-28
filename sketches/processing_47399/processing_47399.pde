
/* Example Code for Platformer
 * By Chris DeLeon
 * 
 * For more free resources about hobby videogame development, check out:
 * http://www.hobbygamedev.com/
 * 
 * Project compiles in Processing - see Processing.org for more information!
 */

class Keyboard {
  // used to track keyboard input
  Boolean holdingUp,holdingRight,holdingLeft,holdingSpace;
  
  Keyboard() {
    holdingUp=holdingRight=holdingLeft=holdingSpace=false;
  }
  
  /* The way that Processing, and many programming languages/environments, deals with keys is
   * treating them like events (something can happen the moment it goes down, or when it goes up).
   * Because we want to treat them like buttons - checking "is it held down right now?" - we need to
   * use those pressed and released events to update some true/false values that we can check elsewhere.
   */

  void pressKey(int key) {
    if(key == KeyEvent.VK_R) { // never will be held down, so no Boolean needed to track it
      if(gameWon()) { // if the game has been won...
        resetGame(); // then R key resets it
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

