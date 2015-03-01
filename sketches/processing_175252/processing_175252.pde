
Ball myBall;

void setup () {
  size(400,400);
  smooth();
  myBall=new Ball(200,0);
}
void draw () {
  background(0);
  myBall.run();
  if (mousePressed) {
    myBall=new Ball(mouseX,mouseY);  
  }
}

class Ball {
  float x=0;
  float y=0;
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
    if(y>height) {
    speedY=speedY *-1;
    } 
  }
  
  void move () {
    y+=speedY;
  }
  
  void display () {
    ellipse(x,y,20,20);
  }
}
