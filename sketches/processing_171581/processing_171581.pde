
Button button;

void setup() {
  size(100, 100);
  // Inputs: x, y, size,
  // base color, over color, press color
  button = new Button(50, 50, 50,
  color(100,200,200), color(200,100,100), color(100,100,200));
}

void draw() {
  background(60);
  stroke(200,200,100,80);
  strokeWeight(7);
  button.update();
  button.display();
}

void mousePressed() {
  button.press();
}

void mouseReleased() {
  button.release();
}
class Button {
  int x, y; // The x- and y-coordinates
  int size; // Dimension (width and height)
  color baseGray; // Default gray value
  color overGray; // Value when mouse is over the button
  color pressGray; // Value when mouse is over and pressed
  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed

  Button(int xp, int yp, int s, color b, color o, color p) {
    x = xp;
    y = yp;
    size = s;
    baseGray = b;
    overGray = o;
    pressGray = p;
  }

  // Updates the over field every frame
  void update() {
    if ((mouseX >= x-size/2) && (mouseX <= x+size/2) &&
    (mouseY >= y-size/2) && (mouseY <= y+size/2)) {
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
    pressed = false; // Set to false when the mouse is released
  }

  void display() {
    if (pressed == true) {
      fill(pressGray);
    } else if (over == true) {
      fill(overGray);
    } else {
      fill(baseGray);
    }

  ellipse(x, y, size, size);
  }
 }


