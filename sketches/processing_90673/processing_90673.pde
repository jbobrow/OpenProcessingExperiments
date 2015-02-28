
class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.1;

Particle(int xpos, int ypos, float velx, float vely, float r) {
  x = xpos;
  y = ypos;
  vx = velx;
  vy = vely;
  radius = r;
}

void update() {
  vy = vy + gravity;
  y += vy;
  x += vx;
}

void display() {
  ellipse(x, y, radius*2, radius*2);
}
}

class stickParticle extends Particle {
  float angle = 0.0;
  float shaftLength = 20.0;
  stickParticle(int ix, int iy, float ivx, float ivy, float ir) {
  super(ix, iy, ivx, ivy, ir);
}

void update() {
  super.update();
  angle = atan2(vy, vx);
}

void display() {
  stroke(255);
  pushMatrix();
  translate(x, y);
  rotate(angle);
  scale(shaftLength);
  stroke(random(255));
  strokeWeight (random(5.0 / shaftLength));
  line(0, 0, random(-7,7), random(-7,7));
  popMatrix();
}
}

int num = 500;
  stickParticle[] p = new stickParticle[num];
  float radius = 1.2;
  void setup() {
  size(600, 200);
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(1, 8);
    float velY = random(-5, -1);
    // Parameters: x, y, x-velocity, y-velocity, radius
    p[i] = new stickParticle(0, height/2, velX, velY, random(5.2));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].display();
  }
}


