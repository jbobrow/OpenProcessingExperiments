
/* 
   Body class
   by blindfish
   www.blindfish.co.uk
   november 2009
   
   Handles generics of bodies that might float in space - i.e. position velocity etc.
   You can set gravityAffected or frictionAffected to false if you don't want an inheriting
   class to be affected by these.
   
   Note that all bodies are registered with Space.  That way there's a central location to do 
   stuff like collision detection etc. and send messages back to the bodies.
   
   See ActionScript Animation by Keith Peters for a great reference on scripted animation and 
   the simplified physics used here.
*/


public class Body {
  float x;
  float y;
  float vx;
  float vy;
  boolean gravityAffected;
  boolean frictionAffected;
  Space space;
   
  Body(float x, float y, Space space) {
    this.x = x;
    this.y = y;
    this.vx = 0;
    this.vy = 0;
    this.space = space;    
    this.gravityAffected = true;
    this.frictionAffected = true;
  }
  
  Body(float x, float y, float vx, float vy, Space space) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.space = space;
    this.gravityAffected = true;
    this.frictionAffected = true;
  }
  

  void move() {
    if(space.playing) {
      if(gravityAffected){
        vy += space.gravity;
      }
      if(frictionAffected){
        vx *= space.friction;
        vy *= space.friction;
      }
      
      x += vx;
      y += vy;
      
      checkConstraints();
    }
  }
  
  void checkConstraints() {
    //constraints
      if(x<0) {
        x = width;
      }
      else if(x>width) {
        x = 0;
      }
      if(y<0){
        y=height;
      }
      else if (y>height) {
        y=0;
      }
  }  
  
}

