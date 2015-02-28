
PVector center;

Thng hal;

void setup() {
  size(440, 440);
  smooth();
  center = new PVector(width/2, height/2);
  hal = new Thng();
  ellipseMode(CENTER);
//  hal.pos = center.get();
}


void draw() {
  background(255,0,0);
  hal.update();
  hal.draw();
  noStroke();
  fill(255,100);
  ellipse(center.x, center.y, 80, 80);
  ellipse(center.x, center.y, 200, 200);
}


class Thng {
  
  int state;
  PVector pos, vel;
  float timer;
  
  Thng() {
    state = 0;
    vel = new PVector();
    pos = new PVector(random(width),random(height));
    timer = millis();
  }
  
  void update() {
    // finite
    switch(state) {
      case 0:
        wander();
        break;
      case 1:
        flee();
        break;
    }
    pos.add(vel);
    pos.x = (pos.x + width) % width;
    pos.y = (pos.y + height) % height;
  }
  
  void draw() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, 10.0, 10.0);
    center = new PVector(mouseX, mouseY);
  }
  
  void wander() {
    if(millis() - timer > 1000) {
      vel.x = floor(random(3)) - 1;
      vel.y = floor(random(3)) - 1;
      vel.normalize();
      timer = millis();
    }
    if(pos.dist(center) < 40) state = 1;
  }
  
  void flee() {
    vel = PVector.sub(pos, center);
    if(vel.mag() > 100) state = 0;
    vel.normalize();
  }
  
};
