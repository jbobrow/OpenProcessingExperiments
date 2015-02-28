

Ball myBall;
Ball myBall2;
Ball myBall3;

void setup() {
  size(600, 600);
  smooth();
  
  
  myBall = new Ball(200, 200);
  myBall2 = new Ball(100, 400);
  myBall3 = new Ball(400, 300);
}

void draw() {
  background(200);
  
  myBall.run();
  myBall2.run();
  myBall3.run();
}

class Ball {

 float x = 0;
 float y = 0;
 float speedX = 4;
 float speedY = 0.5;


 Ball(float _x, float _y) {
   
   x = _x;
   y = _y;
   
 }
 
 void run() {
   display();
   move();
   bounce();
   gravity();
   
 }
 
 void gravity() { 
   speedY += 0.2;
 }
 
 void bounce() {
   if(x > width) {
     speedX = speedX * -1;
   }
   if(x < 0) {
     speedX = speedX * -1;
   }
   if(y > height) {
     speedY = speedY * -1;
   }
   if(y < 0) {
     speedY = speedY * -1;
   }
     
 }
 void move() {
   x += speedX;
   y += speedY;
 }
   
 void display() {
   fill(255, 0, 0);
   smooth();
   noStroke();
   ellipse(x, y, 20, 20);
 
 } 
}


