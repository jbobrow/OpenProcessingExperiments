
class Bullet
{ 
  PVector position; 
  PVector velocity; 
  PVector acceleration;
  float mass = 0.5f;
  
  
  Bullet(PVector acceleration, PVector velocity, PVector position) 
  { 
    this.acceleration = acceleration;
    this.velocity = velocity;
    this.position = position;
  }    
  
  
 void update() 
 { 
     position.add(velocity); 
     velocity.add(acceleration);     
     acceleration = new PVector();

     velocity.normalize(); 
     velocity.mult(3.2f); 
     render();
 } 
 
  void add_force(PVector force) {
    acceleration.add(force); 
  } 
  
  boolean pop() { 
    if (((position.x > width-0) || (position.x < 0)) || ((position.y > height-0) || (position.y < 0))){ 
      return true;
    }
    else return false;   
  } 
  
 void render() 
 { 
     noStroke();
     fill(#ffffff);
 //    point(position.x,position.y,bulletRadius*2,bulletRadius*2); 
     point(position.x,position.y); 
  } 
} 


