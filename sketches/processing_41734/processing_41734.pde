
//Gina DeMatteo
//Niner Nation Pride
//Homework 7_2: I do not understand how to use these codes,I hope that we can possibly review this after the break...


int numParticles = 49;
GenParticle[] p = new GenParticle[numParticles];
PImage img;


void setup() {
  size(300, 300);
  smooth();
  img = loadImage("picAx.png");//background image:niner pick


  for (int i = 0; i < p.length; i++) { // the green particles
    float velX = random(-2, 2);
    float velY = -i;
    //Inputs: x, y, x-velocity, y-velocity,
    //radius, origin x, origin y
    p[i] = new GenParticle(49, 49, velX, velY, 10, 49, 49);
  }

  for (int i = 0; i < p.length; i++) {// the gold particles
    if (random(10) < 2) {
      float velX = random(-2, 2);
      float velY = -i;
      p[i] = new rParticle(251, 49, velX, velY, 10, 251, 49);
    }
  }
}

void draw() {
  background(0);
  set(0, 0, img);

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
  float gravity = 0.05; // gravity to affect how particles fall
  float speed = 1; // speed of particles
  float friction = 1; // friction to affect how the particles slow down

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

    speed = speed + gravity; // controls the bounce of the particles and the way in which they stick to the bottom of the screen
    speed = speed * friction;
    y = y + speed;
    if (y > (height - radius)) {
      y = height - radius;
      speed = -speed;
    }
  }

  void display() { //sets the color and the size of the green  particles
    fill(27, 157, 16, 60);
    stroke(255);
    rect(x, y, radius*2, radius*2);
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
      vx = random(-2, 2);
      vy = random(-4, -2);
    }
  }
}

class rParticle extends GenParticle {
  float originX, originY;
  rParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    originX = ox;
    originY = oy;
  }
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-2, 2);
      vy = random(-4.0, -2.0);
    }
  }
  void display() { //sets the color and the size of the gold particle
    fill(245, 214, 40, 60);
    stroke(255);
    rect(x, y, radius*2, radius*2);
  }
}


