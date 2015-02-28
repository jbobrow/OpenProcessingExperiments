

int numParticles = 400;

GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-5, -3);
    // note the different origin locations, here
    // sparks are made near the top of the sketch, water comes up from the bottom
    if (random(10) > 5) {
      p[i] = new SparkParticle(width/2, 10, velX, velY, 2.0, width/2, 10);
    }
    else {
      p[i] = new WaterParticle(width, random(height), velX, velY, 2.0, width/2, height);
    }
  }
}

void draw() {
  fill(50, 36);
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
    age = 0; // age is used for color; water starts off blue and gradually turns to white and very transparent (vapor)
  }

  void display() {
    color c = lerpColor(color(0, 100, 0, 100), color(0, 0, 0, 255), age * 0.005);
    fill(c);
    ellipse(x, y, radius/2, radius/4);
    radius-=0.1; // radius gradually gets bigger
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius)) {
      x = originX;
      y = originY;
      vx = random(-0.5, 0.5);
      vy = random(-3.0, -.0);
      radius = random(1, 5);
      age = 0;
    }
  }
}


class SparkParticle extends GenParticle {
  float age;

  SparkParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(200);
  }

  void update() {
    if (y >= height - radius) { // added bounce here
      y = height/radius;
      vy = -0.5 * vy;
      radius = radius/0.25;  // radius shrinks when a spark hits something
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }

  void display() {
    color c = lerpColor(color(0, 255, 0, 80), color(0, 100, 0, 80), age * 0.01); // create the changing color effect
    fill(c);
    ellipse(x, y, radius, radius);
  }

  void regenerate() {
    if (age > 300) {    // sparks die at age 300
      x = originX;
      y = originY;
      vx = random(-1.5, 1.5);    // more x velocity than y
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


