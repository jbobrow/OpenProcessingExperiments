
Button b1, b2, b3;
void setup() {
  size(600, 600);
  b1 = new Button("B1", 100, 100, 50, color(100), color(200), color(255, 0, 0));
  b2 = new Button("B2", 100, 200, 50, color(100), color(200), color(255, 0, 0));
  b3 = new Button("B3", 100, 300, 50, color(100), color(200), color(255, 0, 0));
}
void draw() {
  background(255);
  if (b2.isPressed()) background(255, 0, 0);
  b1.display();
  b2.display();
  b3.display();
}
void mousePressed() {
  b1.press();
  b2.press();
  b3.press();
}
void mouseReleased() {
  b1.release();
  b2.release();
  b3.release();
}
void mouseMoved() {
  b1.over();
  b2.over();
  b3.over();
}

class Button {
  String name;
  int x, y;
  int size;
  color baseCol;
  color overCol;
  color pressCol;
  boolean over = false;
  boolean pressed = false;
  boolean isPressed() {
    return pressed;
  }
  Button(String s, int xp, int yp, int sz, color b, color o, color p) {
    name = s;
    x=xp;
    y=yp;
    size = sz;
    baseCol = b;
    overCol = o;
    pressCol = p;
  }
  void over() {
    if ((mouseX >=x ) && (mouseX <= x+size) &&
      (mouseY >= y) && (mouseY <= y+size)) {
      over = true;
    } else {
      over = false;
    }
  }
  void press() {
    if (over) {
      pressed = true;
      println(name + " button clicked");
    }
  }
  void release() {
    pressed = false;
  }
  void display() {
    if (pressed) {
      fill(pressCol);
    } else if (over) {
      fill(overCol);
    } else {
      fill(baseCol);
    }
    stroke(255);
    rect(x, y, size, size);
    textSize(60);
    text(name, x+size+10, y+size);
  }
}

