
Ball myBall;                     
Ball myBall2;             
Ball myBall3;             
 
void setup(){
  size(600,600);
  smooth();
   
  myBall = new Ball(600,600);    
  myBall2 = new Ball(50,50);   
  myBall3 = new Ball(10,200);   
}
 
void draw(){
  background(0);
  myBall.run();                
  myBall2.run();
  myBall3.run();
}
 
class Ball{
  // GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = 20;
  float speedY = 0.75;
   
  // CONSTRUCTOR
  Ball(float _x, float _y){ 
    x = _x;
    y = _y;
  }
   
  // FUNCTIONS
  void run(){
    display();
    move();
    bounce();
    gravity();
  }
 
  void gravity(){
    speedY += 0.1;
  }
   
  void bounce(){
    if(x > width){
      speedX = speedX * -1;
    }
    if(x < 0 ){
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
    ellipse(x,y,85,85);
  }
} 

