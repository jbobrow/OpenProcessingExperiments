
//Credit to Nick Senske for providing code via GenParticleDemo


int numParticles = 100;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(150, 600);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-10, 10);
    float velY = -i;
    p[i] = new GenParticle(random(0, 500), random(0, 500), velX, velY, random(1, 10), random(0, 500), random(0, 500));
  }
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  fill(255, 0, 0);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}


class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.01;

  Particle(float xpos, float ypos, float velx, float vely, float r) {
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
    ellipse(x, y, radius*random(1, 5), radius*random(1, 5));
    ellipse(75,600,200,200);
  }
}


class GenParticle extends Particle {
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}


