
class Particle {

  PVector vel = new PVector();
  float r = 3;
  float x, y; 
  float gravity = 0.5;
  float friction = 0.92;

 Particle(float xpos, float ypos, float velx, float vely) {
    x = xpos;
    y = ypos;
    vel.x = velx;
    vel.y = vely;
  }
   // Draws Rain
    void display() {
    stroke(57,180,255); 
    strokeWeight(3); 
    point(x, y);
    
    
  }
  // Calculates Gravity
    void update() {
    vel.y = vel.y + gravity;
    vel.y = vel.y * friction;
    y += vel.y;
    x += vel.x; 
  }
  
  // Recreates rain once left the screen
    void regenerate() {
   
    if ((x > width) ||
        (y > height)) {
      x = mouseX;
      y = mouseY;
      vel.x = random(-5.0, 5.0);
      vel.y = 1;
    }
  }
  
    void ground(){
      
    if ( y > 11*height/12){
    vel.y = -vel.y;
}
    }
}

class GenParticle extends Particle {

  GenParticle(float xIn, float yIn, float vxIn, float vyIn) {
    super(xIn, yIn, vxIn, vyIn);
   
  }
}


