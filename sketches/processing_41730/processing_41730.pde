
//Will Cordes
//Assignment 7.2, Lab 7
//Based on GenParticleDemo code, Nick Senske


int num = 200;
GenParticle[] p = new GenParticle[num];

void setup() {

  size(400, 400);
  noStroke();
  smooth();
  colorMode(RGB, width); // RGB (0 to 400)

  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-i);

    if (random(10) > 5) {
      p[i] = new pOne(width/2, height/2, velX, velY, 8, random(width), random(height));
    }
    else {
      p[i] = new pTwo(width/2, height/2, velX, velY, 8, random(width), random(height));
    }
  }
}

void draw() {
  background(mouseX); //varies, horizontal movement of mouse
  fill(random(200), random(50), 100, 100);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}



//////////////////////////////// "thrown" units, shifting width
class pTwo extends GenParticle {
  float tLimit;

  pTwo(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    tLimit = 0;
  }

  void display() {
    if (mouseX < width/2) { //stroke to coordinate with background
      stroke(255); //white...
    }
    else {
      stroke(0); //black.
    }
    strokeWeight(1);
    noFill();
    ellipse(x, y, radius + random(10), radius); //jitter in x-coordinate
    noStroke();

    radius+=0.25;
    tLimit++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-0.5, 0.5);
      vy = random(-7.0, -5.0);
      radius = 5.0;
      tLimit = 0;
    }
  }
}



////////////////////////////////   units that "bounce"
class pOne extends GenParticle {
  float tLimit;

  pOne(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    tLimit = random(100);
  }

  void update() {
    if (y >= height - radius) {
      y = height - radius;
      vy = -0.5 * vy;
      radius = radius * 0.75;
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    tLimit++;
  }

  void display() {

    if (mouseY < height/2) { // if under halfway point, embers red
      fill(255, 200); //desaturated gray...
    }
    else {
      fill(255, 0, 0); //red.
    }
    ellipse(x, y, radius, radius);
  }

  void regenerate() {
    if (tLimit > 300) {
      x = originX;
      y = originY;
      vx = random(-1.5, 1.5); 
      vy = random(-1, -0.5);
      tLimit = 0;
      radius = 5.0;
    }
  }
}



//////////////////////////////////// 
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
  float gravity = 0.05;

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
    fill(10);
    ellipse(x, y, radius/2, radius/2);
  }
}


