
// Original GenParticle sketch from Processing textbook p. 483
//Code based off of Nick Senske's GenParticle subclass sketch

int numParticles = 1000;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(400, 600);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-10, 10);
    float velY = random(-10, -5);

    if (random(10) > 5) {
      p[i] = new SparkParticle(width/2, 100, velX, velY, 5.0, width/2, 100);
    }
    else {
      p[i] = new WaterParticle(width/2, height/2, velX, velY, 1, width/2, height/2);
    }
  }
}

void draw() {
  fill(200, 50);
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}


class WaterParticle extends GenParticle {
  float age;

  WaterParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 10;
  }

  void display() {
    color c = lerpColor(color(0, 0, 255, 50), color(0, 150, 0, 10), age * 0.005);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=1;
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-50, 50);
      vy = random(-5, 5);
      radius = 5.0;
      age = 0;
    }
  }
}


class SparkParticle extends GenParticle {
  float age;

  SparkParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }

  void update() {
    if (y >= height - radius) {
      y = height - (2*radius);
      vy = -0.5 * vy;
      radius = radius * .75;
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }

  void display() {
    color c = lerpColor(color(255, 255, 255, 80), color(225, 100, 0, 80), age * 0.01); // create the changing color effect
    fill(c);
    ellipse(x, y, radius, radius);
  }

  void regenerate() {
    if (age > 400) {
      x = originX;
      y = originY;
      vx = random(-3, 3);    // more x velocity than y
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


