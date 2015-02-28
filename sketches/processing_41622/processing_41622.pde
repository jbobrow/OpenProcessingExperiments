

int numParticles = 1000;
GenParticle[] p = new GenParticle[numParticles];
 
void setup() {
  size(200, 600);
  noStroke();
  smooth();
  frameRate(20);      //Slows the frame so the smoke is gradually rising
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-5,-3);
    
    if(random(10) > 5){
      p[i] = new FireParticle(width/2, height/2, velX, velY, 5.0, width/2, height); 
    }
    else{
      p[i] = new SmokeParticle(width/2, height, velX, velY, 2.0, width/2, height); 
    }
  }
}
 
void draw() {
  fill(0, 150);  //Creates a transparency
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}
 
 
class SmokeParticle extends GenParticle {
  float age;
 
  SmokeParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0; 
  }
 
  void display() {
    color c = lerpColor(color(150,50), color(1), age * 0.005);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=1; 
    age++;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < radius) ||
      (y > height + radius) || (y < radius)) {
      x = originX;
      y = originY;
      vx = random(-0.5, 0.5);
      vy = random(-7.0, -5.0);
      radius = 3.0;
      age = 0;
    }
  }
}
 
 
class FireParticle extends GenParticle {
  float age;
 
  FireParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }
 
  void update() {
    if(y >= height - radius) { //Not sure how to edit this out, seems to be useless code for my sketch
      y = height - radius;
      vy = -0.5 * vy;
      radius = radius * 0.75;
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }
 
  void display() {
    color c = lerpColor(color(1,1,1,80), color(225,100,0,80), age * 0.01); //  slowly changes color
    fill(c);
    ellipse(x, y, 5, 30);
  }
 
  void regenerate() {
    if (age > 100) {    // sparks die at 100
      x = originX;
      y = originY;
      vx = random(-1.5, 1.5);    
      vy = random(-2.5, -4);    // Gives the fire a slight vertical angle
      age = 0;
      radius = 1.0;
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
  float gravity = -0.0001; //reverses gravity
 
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


