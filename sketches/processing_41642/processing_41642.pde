
int num = 300;
GenParticle[] p = new GenParticle[num];

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-i);
    if (random(10) > 5) {
      p[i] = new ParticleOne(width/2, height/2, velX, velY, 8, random(width), random(height));
    }
    else {
      p[i] = new ParticleTwo(width/2, height/2, velX, velY, 8, random(width), random(height));
    }
  }
}

void draw() {
  background(0);
  fill(random(200), random(55), 100, 80);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}


class ParticleTwo extends GenParticle {
  float age;

  ParticleTwo(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    fill(random(100, 255), 40);
    ellipse(x, y, radius, radius);
    radius+=0.25;
    age++;
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


class ParticleOne extends GenParticle {
  float age;

  ParticleOne(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }

  void update() {
    if (y >= height - radius) { //bounces
      y = height - radius;
      vy = -0.5 * vy;
      radius = radius * 0.75;
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }

  void display() {
    fill(random(100, 200), random(50, 150), random(150, 250));
    rect(x, y, radius, radius);
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


