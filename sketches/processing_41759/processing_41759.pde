
//Nathan Aaronson
//7.2
//Intergalactic Space Battle

int numParticles = 20;
 
GenParticle[] p = new GenParticle[numParticles];
    
void setup() {
  size(400, 400);
  noStroke();
  smooth();
   
   
  for (int b = 0; b < p.length; b++) {
    if(random(12) > 8){
      float velX = random(-3, 3);    // red bullets
      float velY = random(-3, 3);
      p[b] = new aParticle(width/2, height, velX, velY, 2.0, width/2, height);
    }
    else{
      if(random(12)<4){
      float velX = random(-1, 1);  // green bullets
      float velY = random(-1, 1);
      p[b] = new bParticle(0, 0, velX, velY, 5.0, 0, 0);
    }
    else{
       float velX = random(-1, 1);  // asteroids
      float velY = random(-1, 1);
      p[b] = new cParticle(width, height, velX, velY, 2, width, height);
    }
  }
  }
}
 
 
 
 
 
void draw() {
  background(0);
  fill(0,255,0);
  rectMode(CENTER);
  rect(width/2,0,40,40);
  fill(255,0,0);
  rect(width/2,400,40,40);
  for (int b = 0; b < p.length; b++) {
    p[b].update();
    p[b].regenerate();
    p[b].display();
  }
}
  
  
  
  
    
class Particle {  //original class
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0;
    
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
    
  
  
  
    
class GenParticle extends Particle {  //example of previous class
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
  
  
  
  
    
class aParticle extends GenParticle {  //red circles
    
  aParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
    
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x =width/2;
      y = height;
      vx = random(-10, 10);
      vy = random(-70);
      radius = 5;
    }
  }
  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y,radius, radius);
  }
}
  
  
  
  
    
class bParticle extends GenParticle {  //green lines
    
  bParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
    
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = height/2;
      y = 0;
      vx = random(-20,20); 
      vy = random(20, 50);
      radius= 5;
    }
  }
  void display() {
    noFill();
    strokeWeight(2);
    stroke(0, 255, 0);
    ellipse(x, y, 3, 3);
  }
}
  
  
  
  
  
   
class cParticle extends GenParticle {  //asteroids
    
  cParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
    
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = -20;
      y = height/2;
      vx = random(-2, 2);  
      vy = random(-2, 2);
      radius = 20;
    }
  }
   void display() {
    noStroke();
    fill(60);
    ellipse(x, y, radius, radius);
  }
}

