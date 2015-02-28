
// from: http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-11.pdf
// by: Rob Saunders

class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = -0.1;

Particle(int xpos, int ypos, float velx, float vely, float r) {
  x = xpos;
  y = ypos;
  vx = velx;
  vy = vely;
  radius = r;
}

void update() {
  vy = vy - gravity;
  y += vy;
  x += vx;
}

void display() {
  ellipse(x, y, radius*2, radius*2);
  }
}

Particle p;
void setup() {
  size(450, 450);
  noStroke();
  smooth();
  p = new Particle(0, height, 2.2, -8.2, 20.0);  // initial particle
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  p.update();
  p.display();
}

