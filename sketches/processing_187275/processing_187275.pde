
PVector center;
Offset p1, p2, p3, p4;
int directions = 3;
int lineMinLength = 20;
int age;
PGraphics pg;
void setup() {
  size(800, 800);
  pg = createGraphics(width+100, height+100);
  pg.beginDraw();
  pg.background(#F7F3E1);
  pg.noStroke();
  pg.fill(#141921);
  pg.endDraw();
}
void draw() {
  pg.beginDraw();
  pg.loadPixels();
  center = new PVector(random(pg.width), random(pg.height));
  float wi = constrain(50.0 / (1 + age * 0.5), 1, 50);
  p1 = new Offset(center, wi/3);
  p2 = new Offset(center, wi/3, p1.angle + PI);
  center.x += wi*cos(p1.angle + HALF_PI);
  center.y += wi*sin(p1.angle + HALF_PI);
  p3 = new Offset(center, wi/3, p2.angle);
  p4 = new Offset(center, wi/3, p1.angle);

  age++;
  //strokeWeight(wi);
  float d1 = dist(p1.x, p1.y, p2.x, p2.y);
  float d2 = dist(p3.x, p3.y, p4.x, p4.y);
  if(d1 > lineMinLength && abs(1 - d1/d2) < 0.08) {
    pg.beginShape();
    pg.vertex(p1.x, p1.y);
    pg.vertex(p2.x, p2.y);
    pg.vertex(p3.x, p3.y);
    pg.vertex(p4.x, p4.y);
    pg.endShape(CLOSE);
  }
  pg.endDraw();
  image(pg, -50, -50);
}
void mousePressed() {
  directions++;
  if(directions == 6) {
    directions = 7;
  }
  if(directions == 8) {
    directions = 3;
  }
  pg.beginDraw();
  pg.background(#F7F3E1);
  pg.endDraw();
  age = 0;
  loop();
}
class Offset {
  float dist, angle, overshoot;
  PVector center;
  boolean done;
  float x, y;
  Offset(PVector c, float overshoot) {
    this(c, overshoot, TWO_PI/directions * ((int)(3*directions*noise(c.x*0.008, c.y*0.008))));
  }
  Offset(PVector c, float overshoot, float angle) {
    center = c.get();
    this.overshoot = overshoot;
    dist = 0;
    this.angle = angle;
    done = false;
    inc(0);
    while(!done) {
      inc(1);
      if (outside() || used()) {
        inc(overshoot);
        done = true;
      }
    }
  }
  boolean used() {
    return brightness(pg.pixels[(int)x+pg.width*(int)y]) < 222;
  }
  void inc(float d) {
    dist += d;
    x = center.x + dist*cos(angle);
    y = center.y + dist*sin(angle);
  }
  boolean outside() {
    return x < 0 || x >= pg.width || y < 0 || y >= pg.height;
  }
}
