
ArrayList parts = new ArrayList();
int killTime = 3000;
void setup() {
  size(800, 400);
  smooth();
}
void draw() {
  background(50);
  for (int i=0; i<parts.size(); i++) {
    Particle p = (Particle) parts.get(i);
    p.update();
    p.display();
    if (millis() - p.time > killTime) {
      parts.remove(i);
    }
  }
}
void mouseMoved() {
  parts.add(new Particle());
}
class Particle {
  PVector pos, speed;
  float gravity = 1;
  int time;
  float percentTime = 0;
  Particle() {
    pos = new PVector( mouseX, mouseY);
    speed = new PVector(random(-1, 1), random(5, -1));
    time = millis();
  }
  void update() {
    percentTime = float((millis()-time))/3000.0;
    pos.add(speed);
    speed.y -= gravity;
    if(pos.y < 0) {
      speed.y *= -.7;
      pos.y = 1;
    }
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
  }
  void display() {
    float w = ( 1- percentTime) * 100;
    fill(255 * percentTime, 0, 0);
    ellipse(pos.x + 20 * noise(percentTime), pos.y, w, w);
  }
}
