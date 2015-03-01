
int numParticles = 200;
GenParticle[] p = new GenParticle[numParticles];
GenParticle[] p2 = new GenParticle[numParticles];
GenParticle[] p3 = new GenParticle[numParticles];

void setup() {
  size(400, 400);
  noStroke();
  background(0);

  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;
    // Inputs: x, y, x-velocity, y-velocity,
    // radius, origin x, origin y
    p[i] = new GenParticle(width/2, height, velX, velY,
    2.4, width/2, height/4);
    p2[i] = new GenParticle(width/2, height, velX, velY,
    1.0, width/4, height/1.2);
    p3[i] = new GenParticle(width/2, height, velX, velY,
    1.75, width/1.3, height/1.8);
  }
}

void draw() {
  fill(10,10,50, 36);
  rect(0, 0, width, height);
  
  for (int i = 0; i < p.length; i++) {
    fill(225,220,150, 60);
    p[i].update();
    p[i].regenerate();
    p[i].display();
    fill(150,220,250, 60);
    p2[i].update();
    p2[i].regenerate();
    p2[i].display();
    fill(150,100,80, 90);
    p3[i].update();
    p3[i].regenerate();
    p3[i].display();
  }
}
class GenParticle extends Particle {
  float originX, originY;
  
  GenParticle(int xIn, int yIn, float vxIn, float vyIn,
              float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width+radius) || (x < -radius) ||
       (y > height+radius) || (y < -radius)) {
          x = originX;
          y = originY;
          vx = random(-4.0, 4.0);
          vy = random(-6.0, 3.0);
    }
  }
}
class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.0009;

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


