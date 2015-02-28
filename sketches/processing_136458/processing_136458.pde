
//declare
Pong myPongA;
Pong myPongB;
Pong myPongC;
 
void setup() {
  size(720, 720);
  smooth();
   
//initialize
  myPongA = new Pong(320, 100);
  myPongB = new Pong(150, 200);
  myPongC = new Pong(275, 100);
}
 
void draw() {
  background(255, 255, 255);
   
//function
  myPongA.run();
  myPongB.run();
  myPongC.run();
}

class Pong {
  
//global variables
  float x = 0;
  float y = 0;
  float speedX = 5;
  float speedY = 0.5;
 
//constructor
  Pong(float _x, float _y) {
   
     x = _x;
     y = _y;
}

//functions
  void run() {
    display();
    move();
    bounce();
    gravity();
}
   
  void bounce() {
    if(x > width) {
      speedX = speedX *-1;
    }
    if(x < 0) {
      speedX = speedX *-1;
    }
     if(y > width) {
      speedY = speedY *-1;
    }
    if(y < 0) {
      speedY = speedY *-1;
    }
  }
  void display() {
    ellipse(x, y, 45, 45);
    fill(0);
  }
   
  void move() {
    x += speedX;
    y += speedY;
}
 
  void gravity() {
    speedY += 0.8;
  }
}



