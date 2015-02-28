
int numParticles = 300;
GenParticle[] p = new GenParticle[numParticles];
 
void setup() {
  size(600, 500);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 10);
    float velY = i;
    if(random(10) > 5){
      p[i] = new SparkParticle(width/2, 25, velX, velY, 5.0, width/2, 25); 
    }
    else{
      p[i] = new WaterParticle(0, 0, velX, velY, 50.0, 0, 0); 
    }
  }
}
 
void draw() {
  fill(0, 36);
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}
 
 
class WaterParticle extends GenParticle {
 
  WaterParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
 
  void display() {
    color c = color(255,20);
    fill(c);
    ellipse(width/2, y, radius, radius);
    y++;
    radius+=0.55;
  }
 
  void regenerate() {
   if ((x > width + width) || (x < -width) ||
      (y > height + height) || (y < -height)) {
      x = width;
      y = height;
      vx = random(-0.5, 7.50);
      vy = random(-7.0, -50.0);
      radius = 50.0;
      x++;
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
    if(y >= height + radius) { 
      y = height + radius;
      vy = -0.5 * vy;
      radius = radius * 0.75;  
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }
 
  void display() {
    color c = lerpColor(color(255,255,255,80), color(225,0,0,80), age * 1.22); // create the changing color effect
    fill(c);
    rect(x, y, x, 10);
  }
 
  void regenerate() {
    if (age > 300) {  
      x = 0;
      y = originY;
      vx = random(-1.5, 1.5);  
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
    ellipse(x, y, radius, radius);
  }
}

