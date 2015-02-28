
class Sun {//class for the sun itself

  int x;
  int y;
  int diameter;
  color center;
  color rings;
  int speedx;
  int speedy;

  Sun(int _x, int _y) {
    x=_x;
    y=_y;
    diameter = 50;
    center = color(255,255,0);
    rings = color(255,127,0);
    speedx = int(random(3));
    speedy = int(random(3));
  } 

  void renderSun() {
    noStroke();
    fill(center);
    ellipse(x,y,diameter,diameter);
    noFill();
    stroke(rings);
    strokeWeight(1);
    for (int i = 0; i < 4; i++) {
      ellipse(x,y,diameter + 8 + i*12, diameter + 8 + i*12);
    }
  }

  void moveSun() {
    x = x + speedx;
    y = y + speedy;
    if (x < 0 || x > width) speedx=-speedx;
    if (y < 0 || y > height) speedy = -speedy;
  }

  boolean inSun(int _x, int _y) {
    if (dist(_x, _y, x,y) < diameter/2) return true;
    else return false;
  }
}


