
int numParticles = 150;
GenParticle[] p = new GenParticle[numParticles];


void setup() {
  size(600, 300);
  smooth();
  background(255);

  for (int i = 0; i < p.length; i++) { // the circle particles
    float velX = random(-2, 2);
    float velY = -i;
    //Inputs: x, y, x-velocity, y-velocity,
    //radius, origin x, origin y
    p[i] = new GenParticle(width/2, height/2, velX, velY, 8, width/2, height/2);
  }
  
  for (int i = 0; i < p.length; i++) {// rectangle particles
    if (random(10) > 8) {
      float velX = random(-100, 1);
      float velY = random(-10, 3);
      p[i] = new rParticle(width/2, 0, velX, velY, 100, width/2, height/2);
    }
  }
  for (int i = 0; i < p.length; i++) { //exploding quads at top of sketch
    if (random(10) > 8) {
      float velX = random(-10, 1);
      float velY = random(-10, 3);
      p[i] = new qParticle(width/2, height, velX, velY, 100, width/2, height/2);
    }
  }
}

void draw() {
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

    speed = speed + gravity; // makes the particles bounce and then stick to the bottom of the screen
    speed = speed * friction;
    y = y + speed;
    if (y > (height - radius)) {
      y = height - radius;
      speed = -speed;
    }
  }

  void display() { //sets the color and the size of the circle particles
    fill(255, 60, 0, 50);
    stroke(255, 200, 200);
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
      vx = random(-2.0, 2.0);
      vy = random(-4.0, -2.0);
    }
  }
}

class rParticle extends GenParticle { // these particles act similar to the circles, but have less force and come to a rest on a bar above the circles

  rParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  void regenerate() {
    if ((x > width) || (x < -width) ||
      (y > height) || (y < -height)) {
      x = width/2;
      y = height;
      vx = random(-2, 2);
      vy = random(-4.0, 2.0);
    }
  }
  void display() {
    fill(0);
    stroke(0);
    rect(x, y, random(10), random(50));
  }
}
class qParticle extends GenParticle { //acts as the exploding force to the sketch, quads explode from the center of the screen towards the top of the sketch

  qParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  void regenerate() {
    if ((x > width) || (x < -width) ||
      (y > height) || (y < -height)) {
      x = width/2;
      y = height/2;
      vx = random(-.03, .03);
      vy = random(-.03, .03);
    }
  }
  void display() {
    fill(0, 10);
    stroke(255);
    quad(width, 0, random(width), 0, 300, 150, (width/2), 0);
  }
}


