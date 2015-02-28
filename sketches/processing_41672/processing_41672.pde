
int numParticles = 200;

GenParticle[] p = new GenParticle[numParticles];

void setup() {
  background(0,0,0);
  colorMode(HSB, 100);
  size(300, 300);
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-5, -3);
    if (random(10) > 5) {
      p[i] = new firstParticle(width/2, 25, velX, velY, 5.0, width/2, 125);
    }
    else {
      p[i] = new secondParticle(width/2, height, velX, velY, 5.0, width/2, height);
    } //positions the origin of the particles
  }
}

void draw() {
  fill(12,30,100,50);
  ellipse(width/2, height/2, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}


class secondParticle extends GenParticle {
  float age;

  secondParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    color c = color(80, 50, 50, 50);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=0.8; 
    age++; //changes size over time
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-0.5, 0.5);
      vy = random(-7.0, -5.0);
      radius = 5.0;
      age = 0;
    }
  }
}


class firstParticle extends GenParticle {
  float age;

  firstParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }

  void update() {
    if (y >= height - radius) {
      y = height - radius;
      vy = -0.5 * vy;
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }

  void display() {
    color c = color(40, 80, 80);
    fill(c);
    ellipse(x, y, radius, radius);
    radius= radius+.1; //changes radius with age
  }

  void regenerate() {
    if (age > 300) {   
      x = originX;
      y = originY;
      vx = random(-1.5, 1.5);   
      vy = random(-1, -0.5);
      age = 0;
      radius = 5.0;
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
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}


class Particle {
  float x, y; 
  float vx, vy;
  float radius;
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
  }
}

//alteration of Nick Senske's code demo

