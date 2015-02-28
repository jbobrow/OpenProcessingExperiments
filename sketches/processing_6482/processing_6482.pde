
/* 
   Body class
   by blindfish
   www.blindfish.co.uk
   december 2009
   
   Handles generics of bodies that might float in space - i.e. position velocity etc.

   See ActionScript Animation by Keith Peters for a great reference on scripted animation and 
   the simplified physics used here.
*/


abstract public class Body {
  float x;
  float y;
  float vx;
  float vy;
  float mass;
  float radius;
  boolean gravityAffected;
  boolean frictionAffected;
  boolean alive;
  float deadZone = 20;
   
  Body(float x, float y) {
    this.x = x;
    this.y = y;
    this.vx = 0;
    this.vy = 0;
    this.mass = 1;
    this.gravityAffected = true;
    this.frictionAffected = true;
    this.alive = true;
  }
  
  Body(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.mass = 1;
    this.gravityAffected = true;
    this.frictionAffected = true;
    this.alive = true;
  }
  
  void move() {

      if(alive) {
        if(gravityAffected){
          vy += gravity;
        }
        if(frictionAffected){
          vx *= friction;
          vy *= friction;
        }
        
        x += vx;
        y += vy;
        
        checkConstraints();
      }
      else {
        remove();
      }

  }
  
  void checkConstraints() {
    //constraints
      if(x<-deadZone) {
        x = width+deadZone;
      }
      else if(x>width+deadZone) {
        x = -deadZone;
      }
      if(y<-deadZone){
        y=height+deadZone;
      }
      else if (y>height+deadZone) {
        y=-deadZone;
      }
  }
  
  // more than likely this will involve unregisterDraw() as well 
  // as removal from container 
  abstract void remove();
  
  
  
}

