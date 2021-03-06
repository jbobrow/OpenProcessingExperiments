
/**

You are looking at a prototype, which might not do much!

This ultimately will be a simulation of a childhood game played. 

It was a two man game with a rotating starship with shields, lazers, asteriods

Can't find anything out there like it, so will make a prototype, and then a Unity3D or PlayN version

plus, every good programmer needs to make at least 1 good game in their lifetime...
*/

/*

Need a box background, where the ship re-appears
Rotate, velocity, accelleration (don't use Physics library, as need to control)
Shoot, shields, move forward
Create object with PShape


*/

Ship shipA; 

void setup(){
  size(640, 360); 
  shipA = new Ship(100, 100); 
 
  
}

void draw(){
  background(255); 
  if (frameCount%8==0) { // need a way to reset the acceleration after a timer, or reduce first
    shipA.halfAccelerate(); 
    
  }
 //shipA.setAcceleration(0.1, 0.1); 
 shipA.update(); 
 shipA.display();  
  
}

void keyReleased(){
 if (keyCode == UP){
    shipA.changeAcceleration(0.0,-0.05);
 } if (keyCode == DOWN){
    shipA.changeAcceleration(0.0,0.05);  
 } if (keyCode == LEFT){
    shipA.changeAcceleration(-.05, 0); 
 } if (keyCode == RIGHT){
    shipA.changeAcceleration(.05, 0); 
 }
  
}
class Ship {
  
  PVector position;
  PVector velocity; 
  PVector acceleration; 
  
  public Ship(int x, int y){
   position = new PVector(x, y); 
   velocity = new PVector(); 
   acceleration = new PVector();  
    
  }
  
  public void changeAcceleration(float x, float y){
   acceleration.add(x, y, 0);  
  }
  
  public void halfAccelerate(){
   if (acceleration.x != 0.0){
      acceleration.x = acceleration.x / 2; 
   } if (acceleration.y != 0.0){
      acceleration.y = acceleration.y / 2; 
   } 
    
  }
  
  public void setAcceleration(float x, float y){
   acceleration.set(x,y,0);  
  }
  
  
 void display(){
   ellipse(position.x, position.y, 5, 5);
   
 }
 
 void update(){
   velocity.add(acceleration); 
   position.add(velocity);
   
   if (position.x < 0){
      position.x = width;  
   } if (position.x > width){
      position.x = 0;  
   }if (position.y < 0){
      position.y = height;  
   } if (position.y > height){
      position.y = 0;  
   }
   
 }
  
}


