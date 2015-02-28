
int numParticles = 500;

GenParticle[] p = new GenParticle[numParticles];
 
void setup() {
  size(500, 500);
  noStroke();
  smooth();
  frameRate(50);
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-5,-3);

    if(random(15) > 10){
      p[i] = new SparkParticle(width/2, 25, velX, velY, 10.0, width/2, 40); 
    }
    else{
      p[i] = new WaterParticle(width/2, height, velX, velY, 10.0, width/2, height); 
    }
  }
}
 
void draw() {
  fill(0, 50);
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
    color c = lerpColor(color(40,100,0,30), color(100,75,255,5), age * 0.02);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=0.4; // radius gradually gets bigger
    age++;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1, 1);
      vy = random(-4, -5.0);
      radius = 15.0;
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
      vy = -0.2 * vy;
      radius = radius * 2;  // radius shrinks when a spark hits something
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }
 
  void display() {
    color c = lerpColor(color(150,100,0,20), color(240,0,1500,80), age * 0.3); // create the changing color effect
    fill(c);
    ellipse(x, y, radius, radius);
  }
 
  void regenerate() {
    if (age > 400) {    
      x = originX;
      y = originY;
      vx = random(-2, 3);    // more x velocity than y
      vy = random(-1, -2);
      age = 0;
      radius = 10.0;
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
      vx = random(-2.0, 3.0);
      vy = random(-1.0, -2.0);
    }
  }
}
 
 
class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.2;
 
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

