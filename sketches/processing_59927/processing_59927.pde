
class Damper{
  float x, y;
  float w, h;
  Damper(float w_,float h_) {
    x = width/2;
    y = height/2;
    w = w_;
    h = h_;
  }
  void movement() {
    x = lerp(x, mouseX, 0.3);
    y = lerp(y, mouseY, 0.3);
  }
  void display() {
    fill(100, 50);
    noStroke();
    rect(x, y, w, h);
  }
}


