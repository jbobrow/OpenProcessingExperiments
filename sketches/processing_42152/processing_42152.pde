
//sketch adjusted from - Original GenParticle sketch from Processing textbook p. 483
 
int numParticles = 100;

GenParticle[] p = new GenParticle[numParticles];
 
void setup() {
  size(300, 300);
  background(255,50);
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-5,-3);
   //velocity of the particles
    if(random(10) > 5){
      p[i] = new SparkParticle(width/2, 25, velX, velY, 5.0, width/2, 25); 
    }
    else{
      p[i] = new WaterParticle(width/2, height, velX, velY, 5.0, width/2, height); 
    }
  }
}
 
void draw() {
  
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
    age = 0; // sets up variables
  }
 
  void display() {
   stroke(0,50);
    fill(255);
   rect(x, y, radius, radius);
    radius+=0.25; // draws large rectangles that shoot outward
    age++;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY-150;
      vx = random(-1, 1);
      vy = random(-10, 0);
      radius = 10.0;
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
    if(y >= height - radius) { // the bounce
      y = height - radius;
      vy = -0.5 * vy;
      radius = radius * 0.75;  //whenever the small white rectangles hit something they get smaller
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }
 
  void display() {
    
    fill(255);
    rect(x, y, radius, radius);
  }
 
  void regenerate() {
    if (age > 500) {    // rectangles go away when they reach age 500
      x = originX;
      y = originY;
      vx = random(-50, 50);    // this determines the directionality of the particles
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
      vx = random(-50.0, 50.0);
      vy = random(-30.0, 30.0);
    }
  }
}
 
 
class Particle {
  float x, y; 
  float vx, vy;
  float radius; 
  float gravity = .05;
 
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
    rect(x, y, radius++, radius*2);
  }
}


