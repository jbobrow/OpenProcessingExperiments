


int numParticles = 200;


GenParticle[] p = new GenParticle[numParticles];

PImage img;

void setup() {
  img = loadImage("dino.jpeg");  //placing dinosaur image
  size(img.width, img.height);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = 5;  //inital velocity is 0
    float velY = 0;
    if (random(10) > 5) {
      p[i] = new FireParticle(width/2, 25, velX, velY, 0, width/2-20, height/2);  //placement is at the mouth
    }
    else {
      p[i] = new TearParticle(width/2, height, velX, velY, 0, width/2-20, height/3-10);  //[placement is on the eye
    }
  }
}

void draw() {
  background(img);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}


class TearParticle extends GenParticle {


  TearParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void display() {
    fill(50,150,random(200,255),70);
    ellipse(x, y, radius, radius);
    radius+=0.1; // radius gradually gets bigger
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-0.5, 0.5);
      vy = random(1.0, 2.0);
      radius = 2.0;
    }
  }
}


class FireParticle extends GenParticle {


  FireParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void update() {
    vy = vy + gravity;
    y += vy;
    x += vx;
  }

  void display() {
    fill(random(200,255),random(50,100),50,160);
    ellipse(x, y, radius, radius);
  }

  void regenerate() {
    if (x > width+ radius) {
      x = originX;
      y = originY;
      vx = random(4, 7);  // strong horizontal movement
      vy = random(2);
      radius = 12.0;
    }
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
      vx = random(-1.0, 1.0);  //water falls out of the eye
      vy = random(-4.0, -2.0);
    }
  }
}


class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.1;

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
    ellipse(x, y, radius*2, radius*2);
  }
}


