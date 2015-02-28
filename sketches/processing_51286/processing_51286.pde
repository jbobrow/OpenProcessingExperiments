
class Mover{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover() {
   location = new PVector (width/2, height/2);
   velocity = new PVector (0,0); 
   acceleration = new PVector (random(-1,1), random(-1, 1));
   topspeed = 10;
  }
  
 void update() {
  acceleration = new PVector (random(-.1,.1), random(-.1, .1)); 
  acceleration.normalize();
  
  velocity.add(acceleration);
  velocity.limit(topspeed);
  location.add(velocity);
  
 }

 void display(){
  noStroke();
  fill(0,0,255);
  ellipse(location.x, location.y, 10, 10);
 } 
  
  void checkEdges() {
    
    
    if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
      }

    if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
    }
  
  }
  
}
  

