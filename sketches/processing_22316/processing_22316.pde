
int numParticles = 400;
 
// !--------------------------------------------------------------!
// IceParticles and BubbleParticles are subclasses of GenParticles,
// so they can be stored in a Gen Particle array!
GenParticle[] p = new GenParticle[numParticles];
 
void setup() {
frameRate(15);
background(20);
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    if(random(10) > 5){
      float velX = random(-3, 3);    // set the initial velocities to throw particles from all sides of the origin
      float velY = random(-3, 3);
   p[i] = new SmokeParticle(width/2, height/2, velX, width/2, 5.0, width/2, height/2);
    }
    else{
      float velX = random(-1, 1);  // the ice cubes have a smaller initial velocity than bubbles, which are lighter
      float velY = random(-1, 1);
    
      p[i] = new FireworkParticle(width/2, 0,velX, width/2, 5.0, width/2, height/2); 
    }
  }
}
 
void draw() {
  fill(0, 36);
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
  float direction = random(-1,1);
 
  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = 2.5;
  }
 
  void update() {
    vy = vy + direction;
    y += radius * vy;
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
 
class SmokeParticle extends GenParticle {
  float age;
    SmokeParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-3.0, 3.0);    // bubbles are thrown in all directions, left, right, up, down
      vy = random(-3.0, 3.0);
    }
  }
  void display() {
    colorMode(RGB);
      pushMatrix();
  fill(30,90);
   //translate(x,y);
      //rotate(degrees(45));
    noStroke();
    popMatrix();
   rect(x, y, 6, 8);
  }
}
 
class FireworkParticle extends GenParticle {
 
 FireworkParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    direction = -0.5;  // increase the gravity, so the smoke cubes seem heavier
  }
 
  void regenerate() {
   
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);      // changed the velocities here to small amounts, so they don't start with much energy
      vy = random(-2.0, 2.0);
      
    }
  }
 
  void update() {
    float age;
    if(y + radius > height) vy = -0.5 * vy; // added some slight bounce here
    vy = vy + direction;
    y += vy;
    x += vx;
    age = random(100);
 
age++;
  }
 
    
  void display() {    // to make ice cubes, I rotate a rectangle 45 degrees
    pushMatrix();
    translate(x,y);
  
    rectMode(CENTER);
 noStroke();
  fill(random(50,255),33,random(1,8),20);
    
    rect(0, 0, radius*5, radius*10);
    popMatrix();
    
 
    
  }
}


