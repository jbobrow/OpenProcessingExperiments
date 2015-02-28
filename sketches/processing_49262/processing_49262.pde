
class Alien {
  float x;
  float y;
  float tp;
  float speed;
  float step;
  int life;
  
  Alien (int xin, int yin, int lifein) {
    x = xin;
    y = yin;
    life = lifein;
  }
  
  void xmove() {
    tp ++;
    speed = sin (radians(tp));
    x += speed;
  }
  void ymove(int step) {
    y += step;
  }
  void draw() {
    if (life !=0 ) {
      rectMode(CENTER);
      ellipseMode (CENTER);
      if (life == 2) fill (255, 250, 144);
      if (life == 1) fill (85, 255, 92);
      stroke (255, 255, 173);
      rect (x, y-12, 30, 3);
      rect (x, y, 30, 18);
      rect (x, y+10, 15, 7);
      noStroke();
      fill (242, 70, 58);
      ellipse (x+5, y, 6, 8);
      ellipse (x-5, y, 6, 8);
    }
  }
}

