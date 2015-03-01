
Slider b1, b2, b3;
void setup() {
  size(600, 600);
  b1 = new Slider("B1", 100, 100, 300, 30, 0, 255, color(200), color(255, 0, 0));
  b2 = new Slider("B2", 100, 200, 300, 30, 0, 255, color(200), color(0, 255, 0));
  b3 = new Slider("B3", 100, 300, 300, 30, 0, 255, color(200), color(0, 0, 255));
}
void draw() {
  background(b1.pos(), b2.pos(), b3.pos());

  b1.display();
  b2.display();
  b3.display();
}
void mouseDragged() {
  b1.slide();
  b2.slide();
  b3.slide();
}

class Slider {
  String name;
  int x, y; // position
  int w, h; // width and height
  float min, max;
  float pos; // current value
  color baseCol;
  color highlightCol;
  float pos() {
    return pos;
  }
  Slider(String s, int xp, int yp, int sw, int sh, float mi, float ma, color bc, color hc) {
    name = s; // name
    x=xp; // x position
    y=yp; // y position
    w = sw; // slide width
    h = sh; // slide height
    min = mi; // min
    max = ma; // max
    baseCol = bc; // base color
    highlightCol = hc; // highlight color
    pos = (min+max)/2; // default position
  }
  void slide() {
    if ((mouseX >=x ) && (mouseX <= x+w) &&
      (mouseY >= y) && (mouseY <= y+h) ) {
      pos = map(mouseX, x, x+w, min, max);
    }
  }
  void display() {
    fill(baseCol);
    stroke(0);
    rect(x, y, w, h);
    fill(highlightCol);
    rect(x, y, map(pos, min, max, 0, w), h);

    textSize(15);
    fill(0);
    text(name, x-30, y+h/2);
    text(nf(min, 0, 0), x-10, y+h+20);
    text(nf(max, 0, 0), x+w-10, y+h+20);
    text(nf(pos, 0, 0), map(pos, min, max, x, x+w), y-5);
  }
}

