
class Rect {
  float x, y, w, h; //rectangle's coordinate and size.
  color c; //fill color.
  float gx, gy; //The goal coordination for rect move to.
  float t; //the factor to cacaluate linear interpolation.
  
  boolean f; //flag for invert color for once and once.
  Rect(float x, float y, float w, float h) {
    this.x = gx = x;
    this.y = gy = y;
    this.w = w;
    this.h = h;
    this.t = 5;
  }

  void setGoal(float x, float y) {
    this.gx = x;
    this.gy = y;
  }

  void draw() {
    float dx = (gx - x) / t;
    float dy = (gy - y) / t;
    this.x += dx;
    this.y += dy;
    this.c = color(200 - abs(dx) * 3, 200 - abs(dx+dy) * 3, 200 - abs(dy) * 3, 50);
    fill(c);

    if (abs(gx - x) > 2 || abs(gy - y) > 2) {
      this.drawRect();
    } else {
      x = gx;
      y = gy;
    }
  }

  void drawRect() {
    rect(floor(x), floor(y), floor(h), floor(h));
  }
}


void applyMouseStates() {
  if (mousePressed && (mouseButton == LEFT)) {
    rect.setGoal(mouseX, mouseY);
  }
}

Rect rect;
void setup() {
  stroke(30, 15);
  size(500, 500);
  rect = new Rect(20, 20, 60, 60);
}

void draw() {
  applyMouseStates();
  rect.draw();
}


