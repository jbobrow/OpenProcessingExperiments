
//Lab Assignment 7
//create new subclasses

int numParticles = 200;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {// red particles
    float velX = random(-1, 1);
    float velY = -i;
    p[i] = new GenParticle(width/2, height/2, velX, velY, 5, width/2, height/2);
  }
  for (int i = 0; i < p.length; i++) {// blue particles
    if (random(20) > 10) {
      float velX = random(-100, 1);
      float velY = random(-10, 3);
      p[i] = new LParticle(width/2, 0, velX, velY, 100, width/2, height/2);
    }
  }
  for (int i = 0; i < p.length; i++) { // green particles
    if (random(20) > 10) {
      float velX = random(-10, 3);
      float velY = random(-10, 3);
      p[i] = new MParticle(width/2, height, velX, velY, 50, width/2, height/2);
    }
  }
  
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  fill(255, 60);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}


class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.05;
  float speed = 1;
  float friction = 1;

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
    speed = speed + gravity; // makes the particles bounce and then stick to the bottom of the screen
    speed = speed * friction;
    y = y + speed;
    if (y > (height - radius)) {
    y = height - radius;
    speed = -speed;
    }
  }

  void display() {
    noStroke();
    fill(255,0,0,100);
    ellipse(x, y, radius*2, radius*2);
  }
}


class GenParticle extends Particle { //the particles will be in a line and on the bottom of the three lines
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > 345) || (x < 55) ||
        (y > height + radius) || (y < -radius)) {
      x = width/2;
      y = 0;
      vx = random(-2.0, 2.0);
      vy = random(-4.0, -2.0);
    }
  }
}

class LParticle extends GenParticle { // the particles will be in a line and on the top of the three lines
 
  LParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  void regenerate() {
    if ((x > 340) || (x < 60) ||
      (y > height) || (y < -height)) {
      x = width/2;
      y = 0;
      vx = random(-2, 2);
      vy = random(-4.0, 2.0);
    }
  }
  void display() {
    noStroke();
    fill(0,0,255,100);
    ellipse(x, y, 20, 20);
    stroke(255,0,0);    
    line(50,0,50,height); // two lines to restrickthe balls
    line(350,0,350,height);
    stroke(0,255,0);// green line to catch the green balls
    line(50,357.5,350,357.5);
    stroke(255,0,0);// red line to catch the red balls
    line(50,height-1,350,height-1);
    stroke(0,0,255);// blue line to catch the blue balls
    line(50,310,350,310);
  }
  
}

class MParticle extends GenParticle { // the parricles will be in a line in the middle of the blue and red ones
 
  MParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  void regenerate() {
    if ((x >345) || (x < 55) ||
      (y > height) || (y < -height)) {
      x = width/2;
      y = 0;
      vx = random(-2, 2);
      vy = random(-4.0, 2.0);
    }
  }
  void display() {
    noStroke();
    fill(0,255,0,100);
    ellipse(x, y, 15, 15);
  }
}

