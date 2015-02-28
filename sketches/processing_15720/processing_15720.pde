
Particle[] particles;
int NUM_PARTICLES = 100;

void setup() {
 size(400, 400);
 stroke(0);
 strokeWeight(3);
 fill(150);
 smooth();
}

void draw() {
  background(255);
  if (particles != null) {
    for (int i = 0; i < NUM_PARTICLES; i++) {
      particles[i].exist();
    }
  }
}

void mousePressed() {
  particles = new Particle[NUM_PARTICLES];
  for (int i = 0; i < NUM_PARTICLES; i++) {
    particles[i] = new Particle();
  }
}

public class Particle {
  float x, y;
  float vx, vy;
  float ax, ay;

  public Particle() {
      x = mouseX;
      y = mouseY;
      vx = vy = 0f;
      ax = random(-0.2, 0.2);
      ay = random(-0.08, 0.05);
  }

  public void exist() {
     vx += ax;
     vy += ay;
     x += vx;
     y += vy;
     ellipse(x, y, 10, 10);
  }
}

