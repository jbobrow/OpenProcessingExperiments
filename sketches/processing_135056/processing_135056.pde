
//Declare
Ball myBall;
Ball myBall2;
Ball myBall3;
 
void setup(){
  size(500,500);
  smooth();
   
//Initialize 
  myBall = new Ball(250,250);
  myBall2 = new Ball(150,400);
  myBall3 = new Ball(300,200);
}
 
void draw(){
  background(0);
   
//Call Functionality
  myBall.run();
  myBall2.run();
  myBall3.run();
}
 
class Ball{
//Global Variables
  float x = 0;
  float y = 0;
  float speedX = 4;
  float speedY = 0.5;
   
//Constructor
  Ball(float _x, float _y){
   
    x = _x;
    y = _y;
   
  }
 
 
 //Functions
  void run(){
  display();
  move();
  bounce();
  gravity();
   
  }
   
  void gravity(){
    speedY += 0.15;
  }
   
  void bounce(){
    if(x > width){
      speedX = speedX * -1;
    }
    if(x < 0){
      speedX = speedX * -1;
    }   
    if(y > height){
      speedY = speedY * -1;
    }
    if(y < 0){
      speedY = speedY * -1;
    }
     
  }
   
  void move(){
    x += speedX;
    y += speedY;
 }
   
  void display(){
    noStroke();
  ellipse(x,y,60,60);

  
 }
 
}



