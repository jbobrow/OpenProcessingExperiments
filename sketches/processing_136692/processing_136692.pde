
//declare
Ball myBall;
Ball myBall2;
Ball myBall3;
 
void setup() {
  size(600,600);
  smooth();
   
  //initialize
  myBall = new Ball(300,100);
  myBall2 = new Ball(200,400);
  myBall3 = new Ball(300,300);
}
 
void draw() {
  background(34, 100, 89);
   
  
  myBall.run();
  myBall2.run();
  myBall3.run();
     
}
 

 
class Ball{
  float x = 0;
  float y = 0; 
  float speedX = 5;
  float speedY = 1;
     
  
  Ball(float _x, float _y) {
   
    x = _x;
    y = _y;
  }
   

  
  void run(){
   display();
   move();
   bounce();
   gravity();
  }
  void gravity(){
    speedY+= 0.2;
  }
   
 
 
 
  void move(){
  x += speedX;
  y += speedY;
}
 
void bounce(){
  if (x > width){
    speedX = speedX * -.02;
  }
  if (x < 0 ){
    speedX = speedX * -.02;
  }
   if (y > height){
    speedY = speedY * -.02;
   }
    if (y < 0 ){
    speedY = speedY * -.02;
    }
}
  void display(){
    ellipse(x,y,20,20);
  }
   
}



   









