
int numParticles = 100;
  
// !--------------------------------------------------------------!
// IceParticles and BubbleParticles are subclasses of GenParticles,
// so they can be stored in a Gen Particle array!
GenParticle[] p = new GenParticle[numParticles];
  
void setup() {
  size(500, 500);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    if(random(12) > 8){
      float velX = random(-3, 3);    // set the initial velocities to throw particles from all sides of the origin
      float velY = random(-3, 3);
      p[i] = new aParticle(width/2, height/2, velX, velY, 2.0, width/2, height/2);
    }
    else{
      if(random(12)<4){
      float velX = random(-1, 1);  // the ice cubes have a smaller initial velocity than bubbles, which are lighter
      float velY = random(-1, 1);
      p[i] = new bParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    }
    else{
       float velX = random(-1, 1);  // the ice cubes have a smaller initial velocity than bubbles, which are lighter
      float velY = random(-1, 1);
      p[i] = new cParticle(width/2, height/2, velX, velY, 2.0, width/2, height/2);
    }
  }
  }
}
void draw() {
  fill(0,20);
  rectMode(CORNER);
  rect(0, 0, width, height);
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
  float gravity = 0.08;
  
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
      vy = random(-4.0, -2.0);
    }
  }
}
  
class aParticle extends GenParticle {
  
  aParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x =width/2;
      y = height;
      vx = random(-10.0, 10.0);
      vy = random(-4.0, 8.0);
    }
  }
  void display() {
    noStroke();
    fill(random(100,150),random(0,200),random(10,50),40);
    ellipse(x, y,radius*random(3,6), radius*random(3,6));
  }
}
  
class bParticle extends GenParticle {
  
  bParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX+10;
      y = height;
      vx = random(-8.0, 15.0);   
      vy = random(-4.0, -20.0);
      radius=random(2,5);
    }
  }
  void display() {
    noFill();
    strokeWeight(random(1,4));
    stroke(random(100,200),random(100,250),random(0,50),50);
    line(x, y,  x+radius*random(-3,3), y+radius*random(-3,3));
  }
}
 
class cParticle extends GenParticle {
  
  cParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = width/2;
      y = height;
      vx = random(-5, 12.0);    
      vy = random(-16.0, 20.0);
    }
  }
   void display() {
    noStroke();
    fill(random(40,100),random(180,230),random(200,250),40);
    rect(x, y, radius*random(3,10), radius*random(3,10));
  }
}


