
Ball ball;

void setup(){
  size(700,400);
  smooth();
  background(90);
  
 
  ball = new Ball();
}
  
  void draw(){
    fill(90);
    rect(0,0,width,height); 
    
    ball.update();
    ball.display();
  }

       class Ball {
  
 //specify what classes
 
 PVector location;
 PVector velocity;
 PVector acceleration;
 float topspeed;
 
 // apply vectors to Ball
 
 Ball(){
   location = new PVector(width/2,height/2);
   velocity = new PVector(0,0);
   acceleration = new PVector(-0.002,0.03);
   topspeed = 10;
 }
 
 void update(){
   //direction of ball
   PVector mouse = new PVector(mouseX,mouseY);
   PVector dir = PVector.sub(mouse,location);
   
   dir.normalize();
   
   dir.mult(0.5);
   
   acceleration = dir;
   
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity);
 }
  
  
  void display(){
    fill(90);
    ellipse(location.x,location.y,10,10);
 
  }


}         
                
