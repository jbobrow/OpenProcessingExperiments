
/**
From tutorial
http://www.youtube.com/watch?v=PP4_96YzBnM
*/

//DECLARATION
/*
Ball myBall;
Ball myBall2;
Ball myBall3;
*/

int balls = 100;

Ball [] ballCollection = new Ball[balls];

void setup() {
  size(600,600);
  //size(displayWidth, displayHeight-48);
  
  //INITIALIZE
  //myBall = new Ball(width/4,height/2);
  //myBall2 = new Ball(width/3,height/3);
  //myBall3 = new Ball(width/2,height/4);
  for(int i=0; i < ballCollection.length;i++){
    ballCollection[i] = new Ball(random(10,width-10),random(10,height-10));
  }
}

void draw(){
  background(0);
  
  //CALL FUNCTIONALITY
  //myBall.run();
  //myBall2.run();
  //myBall3.run();
  for(int i=0; i < ballCollection.length; i++){
    ballCollection[i].run();
  }
}


class Ball{
 //VARIABLES
 float x = 0;
 float y = 0;
 float speedX = random(-2,2);
 float speedY = random(-2,2);
 
 //CONSTRUCTOR
 Ball(float _x, float _y){
  x = _x;
  y = _y; 
 }
 
 //FUNCTIONS
 void run(){
   display();
   move();
   bounce();
   gravity();
   verifyGravity(); 
 }
 
  void display(){
    if(speedX > 0){
      fill(255,0,0);
    }
    else if(speedY > 0){
      fill(0,255,0);
    }
    else{
      fill(0,0,255); 
    }    
    ellipse( x, y, 20, 20); 
 }
 
 void move(){
  x += speedX;
  y += speedY;
 }

 void bounce(){
   if(x > (width-10)){
     speedX *= -1;

   }
   if(x < 10){
     speedX *= -1;

   }
   if(y > (height-10)){
     speedY *= -1;

   }
   if(y < 10){
     speedY *= -1;

   }   
 }
 
  void gravity(){
    speedY += 0.2;
  }
  
  void verifyGravity(){
    if(y > height-10){
     y = height-10;
    }
  }
}
