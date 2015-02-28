
int numParticles = 100;

GenParticle[] p = new GenParticle[numParticles];
   
void setup() {
  size(500, 500);
  noStroke();
  smooth();
  
  
  for (int i = 0; i < p.length; i++) {
    if(random(12) > 8){
      float velX = random(-3, 3);    // red circles
      float velY = random(-3, 3);
      p[i] = new aParticle(width/2, height, velX, velY, 2.0, width/2, height);
    }
    else{
      if(random(12)<4){
      float velX = random(-1, 1);  // green lines
      float velY = random(-1, 1);
      p[i] = new bParticle(0, 0, velX, velY, 5.0, 0, 0);
    }
    else{
       float velX = random(-1, 1);  // blue squares
      float velY = random(-1, 1);
      p[i] = new cParticle(width, height, velX, velY, 2, width, height);
    }
  }
  }
}





void draw() {
  background(0);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}
 
 
 
 
   
class Particle {  //original class
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
   
 
 
 
   
class GenParticle extends Particle {  //example extension of previous class
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
      vx = random(-10.0, 10.0);
      vy = random(-4.0, 8.0);
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
      x = 0;
      y = 0;
      vx = random(-8.0, 12.0);  
      vy = random(-16.0, 20.0);
      radius= 5;
    }
  }
  void display() {
    noFill();
    strokeWeight(2);
    stroke(0, 255, 0);
    line(x, y, x+radius, y+radius);
  }
}
 
 
 
 
 
  
class cParticle extends GenParticle {  //blue squares
   
  cParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
   
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = width;
      y = height;
      vx = random(-5, 12.0);   
      vy = random(-16.0, 20.0);
      radius = 20;
    }
  }
   void display() {
    noStroke();
    fill(0,0,255, 60);
    rect(x, y, radius, radius);
  }
}





void keyPressed() {
  if ((key == 's') || (key == 's')) {    //Saves screanshot image
    save("image.jpg");
    println("Image saved.");
  }
}



