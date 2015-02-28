
//Assignment 7.2
//Tommy Coggin

int numParticles = 150;

GenParticle[] p = new GenParticle[numParticles];
 
 
void setup() {
  size(400, 400);
  background(255);
 
 
  
  for (int i = 0; i < p.length; i++) { 
    float velX = random(-2, 2);
    float velY = random(-5,0);
    
    if (random(8)>4){
       p[i] = new LavaParticle (width/2, height/2, velX, velY, 10, width/2, height/2);
    }
    else{
      p[i]= new SmokeParticle (width/2, height/2, velX, velY, 25, width/2, height/2);
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

class LavaParticle extends GenParticle {
  
  LavaParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  
  void display(){
    ellipse(x,y,radius,radius);
    fill(255,0,0,100);
    stroke(255,0,0);
  }
  
  void regenerate(){
    if ((x > width) || (x < -width) ||
      (y > height) || (y < -height)) {
      x = width/2;
      y = height/2;
      vx = random(-2, 2);
      vy = random(-4.0, 2.0);
    }
  }
  
  
  
}

class SmokeParticle extends GenParticle{
  
  SmokeParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  
  void update() {
    if(y >= height - radius) { 
      y = height - radius;
      vy = -0.5 * vy;
    }
    
    vy = vy + gravity;
    y += vy;
    x += vx;
  }
  
  void display(){
    ellipse(x, y, radius, radius);
    fill(0,100);
    noStroke();
  }
  
   void regenerate(){
    if ((x > width) || (x < -width) ||
      (y > height) || (y < -height)) {
      x = width/2;
      y = height/2;
      vx = random(-2, 2);
      vy = random(-4.0, 2.0);
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
      vx = random(-2.0, 2.0);
      vy = random(-4.0, -2.0);
    }
  }
}
 
class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.05; // gravity to affect how particles fall
  //float speed = 1; // speed of particles
  //float friction = 1; // friction to affect how the particles slow down
 
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



