
// A simple Particle class

class Asteroid extends SpaceObj {
  float r;
  EffectPS sprays;
  
  // Another constructor (the one we are using here)
  Asteroid(PVector l) {    
    sprays = new EffectPS();
    
    acc = new PVector( 0,0 );
    vel = new PVector( random(-0.5,0.5),random(-0.5,0.5) );
    loc = l.get();
    r = 10.0;
    timer = 100.0;
  }
  
  void hit() {
    sprays.addParticle(loc, vel);
  }

  void run() {
    sprays.run();
    collide();
    update();
    render();
  }
  
  // Method to update location
  void update() {
    vel.add(acc);
    update1();
  }
    
  void collide() {
    int numBalls = a_ps.particles.size();
    float x = loc.x;
    float y = loc.y;
    float dx;
    float dy;
    float spring = 0.07;
    Asteroid otherObj;
    int i = 0;    
    
    float distance;
    float minDist;
    
    for (i = 0; i < numBalls-1; i++) {
      
      otherObj = (Asteroid) a_ps.particles.get(i);  
      
      dx = otherObj.loc.x - x;
      dy = otherObj.loc.y - y;
      
      distance = sqrt(dx*dx + dy*dy);
      minDist = otherObj.r + r;
      
      if (distance < minDist) {         
       
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - otherObj.loc.x) * spring;
        float ay = (targetY - otherObj.loc.y) * spring;
        vel.x -= ax;
        vel.y -= ay;
        otherObj.vel.x += ax;
        otherObj.vel.y += ay;
        
        // skal laves til en accelteration-vektor
      }
    }   
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(255,timer);
    fill(100,timer);
    float r = pow(timer,0.65);
    ellipse(loc.x,loc.y,r,r);
    //displayVector(vel,loc.x,loc.y,10);
  }
    
  void displayVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to location to render vector
    translate(x,y);
    stroke(255);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len,0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  } 
}


