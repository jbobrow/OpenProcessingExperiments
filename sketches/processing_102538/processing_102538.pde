
class Button {
  
  int x, y; // The x- and y-coordinates
  int w, h; // Dimension (width and height)
  color baseT; // Default gray value
  color overRed; // Value when mouse is over the button
  color pressBlack; // Value when mouse is over and pressed
  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed
  int gotoMode = 0;

  Button(int xp, int yp, int wp, int hp, color b, color o, color p, int go) {
    x = xp;
    y = yp;
    w = wp;
    h = hp;
    baseT = b; 
    overRed = o; 
    pressBlack = p; 
    gotoMode = go;
  }
  
  // Updates the over field every frame
  void update() {
    if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h)) {
      over = true;
    } else {
      over = false;
    }
  }

  void press() {
    if (over == true) {
      pressed = true;
    }
  }

  void release() {
    if (pressed == true) {
      scene = gotoMode;
      pressed = false; // Set to false when the mouse is released
    }
  }

  void display() {
    if (pressed == true) {
      fill(pressBlack);
    } else if (over == true) {
      fill(overRed);
    } else {
      fill(baseT);
    }
    noStroke();
    rect(x, y, w, h);
  }
  
  boolean hover() {
    if (over == true) {
      return true;
    }
    else {
      return false;
    }
  }
}


