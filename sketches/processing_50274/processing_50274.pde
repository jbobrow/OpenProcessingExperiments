
class Planet {
  float x, y;
  float ang;
  float amove;
  float r;
  color c;

  Planet(float nx, float ny, float nang, float nr) {
    x = nx;
    y = ny;
    ang = 0.0;
    amove = nang;
    r = nr; 
    c = color(random(100, 255), random(100, 255), random(150, 255));
  }

  void move() {
    x = cos(ang) * r + width/2;
    y = sin(ang) * r + height/2;
    ang += amove;
  }

  void display() {
    fill(c);
    stroke(0);
    ellipse(x, y, 30, 30);
  }
}


