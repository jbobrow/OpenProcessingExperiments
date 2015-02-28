

class Button {

  int x, y;
  int buttonSize;

  color defaultC;
  color overC;
  color pressC;

  boolean over = false;
  boolean pressed = false;


  Button(int x_, int y_, int buttonSize_, color defaultC_, color overC_, color pressC_) {

    x = x_;
    y = y_;
    buttonSize = buttonSize_;
    defaultC = defaultC_;
    overC = overC_;
    pressC = pressC_;
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
      if (waveToggle == 1) {
        waveToggle = 0;
      } else {
        waveToggle = 1;
      }
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
      fill(defaultC);
    } else {
      noStroke();
      fill(defaultC);
    }
    rect(x, y, buttonSize, buttonSize);
  }
}


