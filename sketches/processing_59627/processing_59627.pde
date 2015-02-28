
class Particle {
  float x, y;
  float px, py;
  float vx = 0, vy = 0;
  float accx = 0, accy = 0;
  int pHue = 0;
  int age = 1;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.px = x;
    this.py = y;
  }

  Particle(float x, float y, int pHue ) {
    this.x = x;
    this.y = y;
    this.px = x;
    this.py = y;
    this.pHue = pHue + (int) random(30);
  }

  void update() {
    px = x;
    py = y;

    x += vx;
    y += vy;

    vx = vx*0.99 + accx;
    vy = vy*0.99 + accy;

    accx = 0;
    accy = 0;

    age++;
  }

  void draw(PGraphics img) {
    //img.stroke(pHue,1-1/(float(age)/20),0.001*(vx*vx+vy*vy)+0.02);
    img.stroke(pHue % 360, 1-50/(float(age)), 0.05);

    img.strokeWeight(2);
    img.line(px, py, x, y);
  }
}


