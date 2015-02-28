
//Iv Shqevi
//lab 7_2
// borrowed from Araceli Bollo 
int numParticles = 600;
GenParticle[] p = new GenParticle[numParticles];
 
void setup() {
  size(500, 500);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 8);
    float velY = random(-1, 4);
 
    if (random(10)> 2) {
      //Blue Particles along the bottom origin on left of the horzontal axes
      p[i] = new IvParticle( width/2, height, velX, velY, 8.0, width/8, height/1.5);
    }
    else {
      //Purple Particle from top to bottom origin at the beginning in the center of the vertical axes
      p[i] = new ShqeviParticle(width, height, velX, velY, 4.0, width/8, height/2);
    }
  }
}
void draw() {
  fill(255, 180);
  rect(0, 0, width, height);
  fill(255, 60);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}
 
class IvParticle extends GenParticle {
  float age;
 
  IvParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }
  //Blue ellipse...really bright
  void display() {
    color c = lerpColor(color(0, 100, 255), color(100, 10, 10, 0), age * 0.008);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+= 0.4;
    age++;
  }
  //Its an explosion of blue ellipses
  void regenerate() {
    if ((x > width + radius) || ( x < radius) ||
      (y > height + radius) || (y < radius)) {
      x = originX;
      y = originY;
      vx = random(-5, 8);
      vy = random(-5, 4);
      radius = 4.0;
      age = 0;
    }
  }
}
 
class ShqeviParticle extends GenParticle {
  float age;
 
  ShqeviParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super (xIn, yIn, vxIn, vyIn, r, ox, oy);
    age= random(40, 80);
  }
 
  //Purple rect...lighter
  void display() {
    color c = lerpColor(color(150, 0, 255), color(0, 10, 80, 200), age * 0.005);
    fill(c);
    rect(x, y, radius, radius);
    radius+=0.20;
    age++;
  }
  //Keeps going but its less than the blue ellipses
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-2, 4);
      vy = random(-8, -4);
      radius = 2.0;
      age = 0;
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
        vy = random(-8.0, -2.0);
      }
    }
  }

