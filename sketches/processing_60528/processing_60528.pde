
class Tree {
  float x, y;
  float h;
  float steps;

  Tree() {
    x = 0;
    y = 0;
    h = 0;
    steps = 0;
  }

  Tree(int x_, int y_, int h_, int s_) {
    x = x_;
    y = y_;
    h = map(h_, 0, height, 0, 160);
    steps = s_;
  }

  void render() {
    stroke(32);
    branch(x, y, -HALF_PI, h);
  }

  void branch(float x_, float y_, float a_, float s_) {
    strokeWeight(s_/16);
    float a = random(-PI/16, PI/16)+a_;
    float nx = cos(a)*s_+x_;
    float ny = sin(a)*s_+y_;
    stroke(32, 16*s_);
    line(x_, y_, nx, ny);
    if (s_>10) {
      branch(nx, ny, a_-random(PI/4), s_*random(0.6, 0.8));
      branch(nx, ny, a_, s_*random(0.6, 0.8));
      branch(nx, ny, a_+random(PI/4), s_*random(0.6, 0.8));
    } 
    else {
      float w = random(155);
      stroke(255, w, w, random(32, 192));
      strokeWeight(random(0, 8));
      point(nx+random(-2, 2), ny+random(-2, 2));
    }
  }
}

