
int num=500;
Particle[] parts = new Particle[num];

void setup() {
  size(500, 500);
  for (int i=0; i<num; i++) {
    parts[i] = new Particle();
  }
}

void draw() {
  background(150);
  for (int i=0; i<num; i++) {
    parts[i].run();
  }

}

class Particle {

  PVector location, velocity, acceleration;
  float sz;

  Particle() {
    location = new PVector(random(200,width-200), random(200,height-200));
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = new PVector(0,0);
    sz = random(10, 20);
  }
  
  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    checkEdges();
  }

  void display() {
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x, location.y, sz, sz);
  }

  void checkEdges() {
    float edge=sz/2+10;
    if (location.x<edge || location.x>width-edge) velocity.x *=-1;
    if (location.y<edge || location.y>height-edge) velocity.y *=-1;
  }
}

