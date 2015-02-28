
int numParticles = 200;
GenParticle[] p = new GenParticle[numParticles];
float x1, x2, y1, y2;
color c1, c2;

void setup() {
  size(200, 200);
  background(201, 224, 221);
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;

    x1 = random(50, 150);
    y1 = random(50, 150);
    x2 = random(50, 150);
    y2 = random(50, 150);
    c1 = color(66, 97, 122, 30);
    c2 = color(173, 139, 138, 30);
    p[i] = new GenParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
  }
}

void draw() {


  for (int i = 0; i < p.length; i++) {
    p[i].regenerate();
    p[i].display();
  }
} 

class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius

    void display() {
    x1 = x1 + random(-3, 3);
    y1 = y1 + random(-3, 3);
    x2 = x2 + random(-3, 3);
    y2 = y2 + random(-3, 3);
    strokeWeight(5);
    stroke(c1);
    point(x1, y1);
    stroke(c2);
    point(x2, y2);
  }
}

class GenParticle extends Particle {
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    // super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-2.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}


