

class Button {

  int x, y;
  int buttonSize;

  color defaultC;
  color overC;
  color pressC;
  color textC;

  boolean over = false;
  boolean pressed = false;

  String buttonText;
  PFont buttonFont;


  // Constructor for buttons without text
  Button(int x_, int y_, int buttonSize_, color defaultC_, color overC_, color pressC_) {

    x = x_;
    y = y_;
    buttonSize = buttonSize_;
    defaultC = defaultC_;
    overC = overC_;
    pressC = pressC_;
  }


  // Constructor for buttons with text
  Button(int x_, int y_, int buttonSize_, color defaultC_, color overC_, color pressC_, String buttonText_, color textC_) {

    x = x_;
    y = y_;
    buttonSize = buttonSize_;
    defaultC = defaultC_;
    overC = overC_;
    pressC = pressC_;
    buttonText = buttonText_;
    textC = textC_;
  }



  void prepText() {
    buttonFont = loadFont("BellGothicStd-Black-13.vlw");
  }
  
  
  void update() {
    if ((mouseX >= x) && (mouseX <= x + buttonSize) &&
        (mouseY >= y) && (mouseY <= y + buttonSize)) {
      over = true;
    } else {
      over = false;
    }
  }
  
  
  boolean press() {
    if (over == true) {
      pressed = true;
      return true;
    } else {
      return false;
    }
  }
  
  
  void release() {
    pressed = false;
  }
  
  
  void display() {
    if (pressed == true) {
      stroke(255);
      fill(pressC);
    } else if (over == true) {
      stroke(255);
      fill(overC);
    } else {
      stroke(200);
      fill(defaultC);
    }
    rect(x, y, buttonSize, buttonSize);
    fill(textC);
    textFont(buttonFont);
    text(buttonText, x - 34, y + 11);  // y location is guesswork
  }
}


