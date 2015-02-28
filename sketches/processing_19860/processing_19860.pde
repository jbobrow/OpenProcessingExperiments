
// Random Walker (No Vectors)
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

// A random walker class!

class WalkerClass {
  PVector loc;
  PVector vel = new PVector(0,0);
  int noiseCnt = 0;
  float noisiness = 0;
  float quickness = 0;
  
  WalkerClass() {
    noisiness = random(5);
    loc = new PVector(random(width),random(height));
    quickness = random(100)+300;
  }

  void render() {
    noStroke();
   // stroke(0);
    fill(255);
   // rectMode(CENTER);
    recta(loc.x,loc.y,PVector.angleBetween(loc,vel)-PI/2*noise(noiseCnt*noisiness));
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    PVector mouse = new PVector(mouseX,mouseY);
    
    
    // Look!  We're using the static reference to sub() because 
    // we want a new PVector pointing from one point to another.
    PVector dir = PVector.sub(mouse,loc);
    dir.normalize();
    noiseCnt += 1;
    dir.mult(noisiness*noise(noiseCnt));
     vel.mult(mouse.dist(loc)/quickness);
    vel.add(dir);
   
   // vel.div(dir);
    loc.add(vel);
    
    // Stay on the screen
    loc.x = constrain(loc.x,0,width-1);
    loc.y = constrain(loc.y,0,height-1);
    
    
  }
  
  void recta(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  rect(0, 0, 10, 20);
  popMatrix();
}
  
}


