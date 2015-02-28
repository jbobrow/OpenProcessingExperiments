

int numParticles = 450;

GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(200, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-3, 5);
    float velY = random(-5, -3);
  //origins
    if (random(10) > 5) {
      p[i] = new SparkParticle(width/2, 25, velX*2, velY*2, 5.0, width/2, 100);
    }
    else {
      p[i] = new WaterParticle(width, height/2, velX*2, velY*2
        , 2.0, width/2, height);
    }
  }
}

void draw() {
  background (0);
 
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
    age = 0; // changes colour
  }

  void display() {
    color c = lerpColor(color(20, 50, 200, 50), color(150, 150, 150, 50), age * 0.0025);
    fill(c/6);
    ellipse(x, y, radius, radius);
    radius+=.75; //change in radius
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius/2) ||
      (y > height + radius) || (y < -radius/2)) {
      x = originX;
      y = originY;
      vx = random(-1 , 1);
      vy = random(-8.0, -6.0);
      radius = 10.0;
      age = 0;
    }
  }
}


class SparkParticle extends GenParticle {
  float age;

  SparkParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(50);
  }

  void update() {
    if (y >= height - radius) { // bounce
      y = height - radius;
      vy = -0.5 * vy;
      radius = radius * 0.75;  //change in radius
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }

  void display() {
    color c = lerpColor(color(150, 150, 180, 30), color(150, 100, 100,100), age * 0.003); // colour change
    fill(c/3);
    ellipse(x, y, radius/4, radius/4);
  }

  void regenerate() {
    if (age > 600) {    // death of sparks at 600
      x = originX;
      y = originY;
      vx = random(-2,2);    
      vy = random(-2, -1);
      age = -10;
      radius = 100.0;
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
  float x, y; // coordinates
  float vx, vy; // velocities
  float radius; 
  float gravity = .1;

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
    ellipse(x/2, y/2, radius*4, radius*4);
  }
}


