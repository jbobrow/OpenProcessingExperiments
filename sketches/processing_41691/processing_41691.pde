
//Homework 7.2_Particles & Physics
//Created by Adrianne Blossom
//October 9, 2011


int numParticles = 300; //regulate the number of circles drawn from bottom
GenParticle[] p = new GenParticle[numParticles];


void setup() {
  size(300, 300);
  colorMode(HSB,width,50,100);
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-.75, .75);
    float velY = -i;
    // Inputs: x, y, x-velocity, y-velocity,
    // radius, origin x, origin y
    p[i] = new GenParticle(width/2, height, velX, velY, 5.0, width/2, height/2);

    p[i] = new ParticleA(width/2, height-25, velX, velY, 5.0, width, height+25);

    p[i] = new ParticleB(width/2, height, velX, velY, 7.0, width, height);
  }
}

void draw() {
  fill(0, 36);
  rect(0, 0, width, height);
  fill(255, 60);
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
  float friction = 0.5; //slows speed of particles as they move out from the center

  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }

  void update() {
    vy = vy * friction;
    y += vy;
    x += vx;
  }

  void display() {
    fill(HSB,random(width),100);
    ellipse(x, y, radius*2, radius*2);
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
      vy -= x;
      vx -= y;
    }
  }
}

class ParticleA extends GenParticle {
  float friction = 0.5;

  ParticleA(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    vy = vy * friction;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-1.0, 1.0);
    }
  }
}

class ParticleB extends GenParticle {
  float friction = 1;

  ParticleB(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    vy = vy * friction;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      vx = random(-1.0, 1.0);
      vy = random(-1.0, 1.0);
    }
  }
}

