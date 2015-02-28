
int numParticles = 200;
GenParticle[] a = new GenParticle[numParticles];
GenParticle[] b = new GenParticle[numParticles];
GenParticle[] c = new GenParticle[numParticles];

void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < a.length; i++) {
    float velX = random(-2, 2);
    float velY = random(-3, 3);
    a[i] = new GenParticle(width/2, height, velX, velY, random(1,10), width/2, height);
    b[i] = new GenParticle(width,0, velX, velY, random(1,3), 0, height/2);
    c[i] = new GenParticle(width, height, velX, velY, random(1,3), width, height/2);
  }
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height);
  stroke(random(0,255),0,0);
  for (int i = 0; i < a.length; i++) {
    a[i].update();
    a[i].regenerate();
    a[i].display();
  }
  stroke(random(0,255));
  for (int i = 0; i < b.length; i++) {
    b[i].update();
    b[i].regenerate();
    b[i].display();
  }
  for (int i = 0; i < c.length; i++) {
    c[i].update();
    c[i].regenerate();
    c[i].display();
  }
}

class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.04;

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
      vx = random(-2.0, 2.0);
      vy = random(-4.0, -4.0);
    }
  }
}

void mousePressed(){


}

