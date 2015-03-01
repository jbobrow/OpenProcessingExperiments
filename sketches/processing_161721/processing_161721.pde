
/* THIS HAS NEVER BEEN DONE BEFORE. (Sarcasm) every user needs there own one to show off though. */

ArrayList bubbles = new ArrayList();
boolean lines = false;
boolean clickOnce;

void setup() {
  size(640, 640);
  frameRate(32);
  noStroke();
  
  for (int i = 0; i <= 100; i++) {
    bubbles.add(new Bubble(new PVector(random(width), random(height)), random(5, 75)));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < bubbles.size(); i++) {
    Bubble b = (Bubble) bubbles.get(i);
    if (lines) {
      for (int q = 0; q < bubbles.size(); q++) {
        Bubble b2 = (Bubble) bubbles.get(q);
        float d = PVector.dist(b.loc, b2.loc);
        if (d < 100) {
          stroke(20, 200, 255);
          line(b.loc.x, b.loc.y, b2.loc.x, b2.loc.y);
        }
      }
    }
    b.draw();
    b.moveBubble();
    //b.applyForce(gravity);
    b.boundaries();
  }
  fill(0);
  text((int)frameRate, 5, 15);
}

void mousePressed() {
  if (lines && clickOnce == false) {
    lines = false;
    clickOnce = true;
  }
  else if (!lines && clickOnce == false) {
    lines = true;
    clickOnce = true;
  }
}

void mouseReleased() {
  clickOnce = false;
}

class Bubble {
  PVector loc;
  PVector acc;
  PVector vel;

  float mass = 1;
  float size;

  Bubble(PVector loc_, float size_) {
    loc = loc_;
    vel = new PVector(random(-3, 3), random(-3, 3));

    size = size_;
  }

  void draw() {
    noStroke();
    fill(0, 50);
    ellipse(loc.x, loc.y, size+20, size+20);
    fill(0);
    ellipse(loc.x, loc.y, size, size);
  }

  void moveBubble() {
    loc.add(vel);
  }
  void boundaries() {
    if (loc.y < 0)
      vel.y *= -1;
    if (loc.y > height)
      vel.y *= -1;
    if (loc.x > width)
      vel.x *= -1;
    if (loc.x < 0)
      vel.x *= -1;
  }
}



