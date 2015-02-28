
int numParticles = 300;
MyParticle2[] p = new MyParticle2[numParticles];
 
void setup() {
  size(500, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;
    // Inputs: x, y, x-velocity, y-velocity,
    // radius, origin x, origin y
 
    p[i] = new MyParticle2(width/2, height/2, velX, velY, 5.0, width/2, random(height/4,height/8));
  }
}
 
void draw() {
  fill(100);
  rect(0, 0, width, height);
   
  fill(0,random(150,200),random(175,255));
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].display();
    p[i].regenerate();
    p[i].bounce();
 
  }
}
 
 
//Particle class ---------------------------------------------------------------------------------
 
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
    vy = vy + gravity;  //velocity+gravity
    y += vy;  // y position is equal to the velocity (which is a function of gravity)
    x += vx; // x position is equal to the velocity (no relation to gravity)
  }
 
  void display() {
    fill(0,random(150,200),random(175,255));
    ellipse(x, y, radius*2, radius*2);
  }
}
 
 
//GenParticle subclass ---------------------------------------------------------------------------
 
class GenParticle extends Particle {
  float originX, originY; //new variable for GenParticle
 
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
 
 
//MyParticle1 subclass -------------------------------------------------------------------------------
 
class MyParticle1 extends GenParticle { //create the "waterfall" effect
 
  MyParticle1(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
 
  void display() {
    fill(0,random(150,200),random(175,255));
    ellipse(x, y,random(15,25),random(15,25));
  }
 
  void bounce() { // make the particle bounce back up after reaching bottom of sketch
    if (y >= height-10 ) {
      fill(0,random(150,200),random(175,255));
      vy = -2;
      
       
    }
  }
}
 
 
//MyParticle2 subclass ---------------------------------------------------------------------------------
 
class MyParticle2 extends GenParticle {
 
  MyParticle2(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
 
  void display() {
    ellipse(x, y, random(10,20),random(10,20));
     
  }
 
  void bounce() { // give the particle some blue coloring
    if (y >= height-10 ) {
      vy = -2*.01;
      fill(255);
       
    }
  }
}


