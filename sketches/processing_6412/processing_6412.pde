
/* 
   Body class
   by blindfish
   www.blindfish.co.uk
   december 2009
   
   Handles generics of bodies that might float in space - i.e. position velocity etc.
   You can set gravityAffected or frictionAffected to false if you don't want an inheriting
   class to be affected by these.
   
   Note that all bodies are registered with Space.  That way there's a central location to do 
   stuff like collision detection etc. and send messages back to the bodies.
   
   See ActionScript Animation by Keith Peters for a great reference on scripted animation and 
   the simplified physics used here.
*/


abstract public class Body {
  float x;
  float y;
  float vx;
  float vy;
  float mass;
  float radius;               // required by Space.bounce method
  boolean gravityAffected;    // defaults to true (see constructors below), but may want o switch off in special cases
  boolean frictionAffected;   // as above 
  boolean alive;
  Space space;                // the instance of Space the Body belongs to.
   
  Body(float x, float y, Space space) {
    this.x = x;
    this.y = y;
    this.vx = 0;
    this.vy = 0;
    this.mass = 1; // arbitrary default.  Adjust as appropriate if using Space.bounce()
    this.space = space;    
    this.gravityAffected = true;
    this.frictionAffected = true;
    this.alive = true;
  }
  
  Body(float x, float y, float vx, float vy, Space space) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.mass = 1;
    this.space = space;
    this.gravityAffected = true;
    this.frictionAffected = true;
    this.alive = true;
  }
  
  void move() {
    if(space.playing) {
      if(alive) {
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
      else {
        remove();
      }
    }

  }
  
  void checkConstraints() {
    //constraints
      if(x<-space.deadZone) {
        x = width+space.deadZone;
      }
      else if(x>width+space.deadZone) {
        x = -space.deadZone;
      }
      if(y<-space.deadZone){
        y=height+space.deadZone;
      }
      else if (y>height+space.deadZone) {
        y=-space.deadZone;
      }
  }
  
  // more than likely this will involve unregisterDraw() as well 
  // as removal from container in Space
  abstract void remove();
  
  
  
}

