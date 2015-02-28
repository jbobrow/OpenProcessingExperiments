
//This program is an attempt to simulate a thunderstorm.

int num = 250;
GenParticle[] p = new GenParticle[num];

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-i);
    if (random(10) > 5) {
      p[i] = new Rain(random(width), -height/4, velX, velY, 5, random(width), 0);
    }
    else {
      p[i] = new Hail(width/2, 0, velX, velY, 5, width/2, -height/4);
    }
  }
}

void draw() {
  if(random(100)<1){    //randomly makes the background flicker to make ligthening
    background(255,255,100);
  }
  else{
  background(0);
  }
  fill(random(200), random(55), 100, 80);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

class Rain extends GenParticle {
  float age;

  Rain(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    fill(random(100, 150), random(175, 210), 255, 85);
    rect(x, y, 1, random(50, 100));
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1, 1);
      vy = random(-10, 0);
      age = 0;
    }
  }
}


class Hail extends GenParticle {
  float age;

  Hail(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }

  void update() {
    if (y >= height - radius) { 
      y = height-radius;
      vy = -0.2 * vy;
      radius = radius * 1.005;
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }

  void display() {
    fill(200);
    ellipse(x, y, radius, radius);
  }

  void regenerate() {
    if (age > 250) {
      x = originX;
      y = originY;
      vx = random(-5, 5); 
      vy = random(-1, 1);
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


