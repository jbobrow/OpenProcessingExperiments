
int num = 500;
Particle[] particles;
color[] palette = {
  #ECD078, #D95B43, #C02942, #542437, #53777A
};


void setup() {
  size(700, 400);
  background(20);
  strokeWeight(2);
  //frameRate(3);
  particles = new Particle[num];
  for (int i=0; i<num; i++) {
    float x = random(width);
    int c = (int) map(x,0,width,0,5);
    //int c = (int) random(5);
    particles[i] = new Particle(x, random(height), c);
  }
}

void draw() {
  background(0);
  //fill(20, 15);
  noStroke();
  //rect(0, 0, width, height);
  //stroke(255);
  for (int i=0; i<particles.length; i++) {
    particles[i].attract(mouseX, mouseY);
    particles[i].integrate();
    particles[i].display();
  }
}

class Particle {
  float x, y, oldX, oldY;
  float damping = .999;
  int c;

  Particle(float _x, float _y, int _c) {
    x = oldX = _x;
    y = oldY = _y;
    c = _c;
  }

  void integrate() {
    float velocityX = (x - oldX)*damping;
    float velocityY = (y - oldY)*damping;
    oldX = x;
    oldY = y;
    x += velocityX;
    y += velocityY;
  }

  void attract(float ax, float ay) {
    float dx = ax-x;
    float dy = ay-y;
    float distance = sqrt(sq(dx)+sq(dy));
    x += dx/distance;
    y += dy/distance;
  }

  void display() {
    //colorMode(HSB,360,100,100);
    //stroke(c,80,80,100);
    stroke(palette[c],200);
    line(oldX, oldY, x, y);
    //colorMode(RGB);
  }
}


