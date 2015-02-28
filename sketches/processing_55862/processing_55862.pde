
class Bar {
  float x;
  float y;
  float w;
  float h;
  color c;
  float endX;
  float endY;
  float endH;
  float value;
  float damping = 0.09;
  
  Bar(float x_, float y_, float w_, float h_, color c_) {
    x = x_;
    y = y_;
    w = w_;
    c = c_;
    endH = h_;
  }
  
  void display() {
    h = h + (endH - h) * damping;
    fill(c);
    rectMode(CORNER);
    rect(x, y, w - 1, h);
  }
  
  void reset() {
    h = 0;
  }
}

