
/*import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress pd;
*/

Ball[] balls;

void setup(){
  size(600,400);
  
  //oscP5 = new OscP5(this, 9001);
  //pd = new NetAddress("127.0.0.1",9000);
  balls = new Ball[15];
  for(int i = 0; i < balls.length; i++){
  balls[i] = new Ball();
  }
  
}

void draw(){
  background(245);
  fill(127);
  rect(0,(height/3)*2,width,height);

  for(Ball b : balls){
 
   
    PVector gravity = new PVector(0,0.3);
  gravity.mult(b.mass);
  b.applyForce(gravity);
  
  if(keyPressed){
    if(key == 'w' || key == 'W'){
    PVector wind = new PVector(random(-0.3,0.3),0);
    b.applyForce(wind);
  }
 }
 
 
  PVector friction = b.velocity.get();
  
  if(b.location.y == height-b.radius){
  friction.normalize();
  float c = -0.02;
  friction.mult(c);
  b.applyForce(friction);
  }
  if(b.location.y > (height/3)*2){
    
  PVector drag = b.velocity.get();
  drag.normalize();
  float d = -0.05;
  float speed = b.velocity.mag();
  drag.mult(d*speed*speed);
  b.applyForce(drag);
    }
  
  b.update();
  b.edges();
  b.display();
  }
 // b.sound();
  
}
class Ball {

PVector location;
PVector velocity;
PVector acceleration;

PVector mouse;
float diam; 
float radius;
float mass;

Ball(){ 
   mass = random(.5,4);
diam = mass*20;
radius = diam/2;
  location = new PVector(random(width), radius);
 velocity = new PVector(0,0);
 acceleration = new PVector(random(-.9,0.9),0);


}

void applyForce(PVector force){
  
  PVector f = PVector.div(force,mass);
  acceleration.add(f);
  
}
void update(){

  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);

}
void edges(){
  if (location.x > width-radius){ 
  velocity.x *=-1; 
  //acceleration.x *= -1;
  location.x = width-radius;
}
  if (location.x < radius){ 
    velocity.x *= -1;
    //acceleration.x *= -1;
    location.x = radius;
  }
  if (location.y >= height-radius) {
   velocity.y *= -1;
  // acceleration.y *= -1;
   location.y=height-radius;
  }
  if (location.y < radius){
    
    velocity.y *= -1;
    
    //acceleration.y *= -1;
    location.y=radius;
    
  }
    
} 

  void display(){
   fill(200, 100);
    ellipse(location.x,(location.y), mass*20, mass*20);
    
  }
 
}


