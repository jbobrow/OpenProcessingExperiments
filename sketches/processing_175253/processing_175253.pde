
Ball myBall;
Ball myBall2;
Ball myBall3;

void setup () {
  size(400,400);
  smooth();
  myBall=new Ball(100,0);
  myBall2=new Ball(200,0);
  myBall3=new Ball(300,0);
}
void draw () {
  background(0);
  myBall.run();
  myBall2.run();
  myBall3.run();
}

class Ball {
  float x=0;
  float y=0;
  float speedX=5;
  float speedY=3.5;
  
  Ball (float _x, float _y) {    
  x=_x;
  y=_y;
  }
  
  void run () {
    display();
    move();
    bounce();
    gravity();
  }
  
  void gravity () {
    speedY+=1;
  }
  
  void bounce () {
    if(x>width) {
    speedX=speedX *-1;
    }
    if(x<0) {
    speedX=speedX *-1;
    }
    if(y>height) {
    speedY=speedY *-1;
    } 
    if(y<0) {
    speedY=speedY *-1;
    }
  }
  
  void move () {
    x+=speedX;
    y+=speedY;
  }
  
  void display () {
    ellipse(x,y,20,20);
  }
}
