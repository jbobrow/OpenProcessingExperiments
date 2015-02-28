
// Original GenParticle sketch from Processing textbook p. 483
 
int numParticles = 100;
// !--------------------------------------------------------------!
// WaterParticles and SparkParticles are subclasses of GenParticles,
// so they can be stored in a Gen Particle array!
GenParticle[] p = new GenParticle[numParticles];
 
void setup() {
  size(300, 300);
  background(255,50);
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-5,-3);
    // note the different origin locations, here
    // sparks are made near the top of the sketch, water comes up from the bottom
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
    age = 0; // age is used for color; water starts off blue and gradually turns to white and very transparent (vapor)
  }
 
  void display() {
   stroke(0,50);
    fill(255);
   rect(x, y, radius, radius);
    radius+=0.25; // radius gradually gets bigger
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
    if(y >= height - radius) { // added bounce here
      y = height - radius;
      vy = -0.5 * vy;
      radius = radius * 0.75;  // radius shrinks when a spark hits something
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
    if (age > 500) {    // sparks die at age 300
      x = originX;
      y = originY;
      vx = random(-50, 50);    // more x velocity than y
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
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
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


