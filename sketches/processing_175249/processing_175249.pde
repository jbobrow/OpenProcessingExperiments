
ArrayList ballCollection;

void setup () {
  size(400,400);
  smooth();
  ballCollection = new ArrayList();
  for(int i=0; i<100; i++) {
  Ball myBall=new Ball(random(0,width),random(0,200));
  ballCollection.add(myBall); 
  }
}
void draw () {
  background(0);
  for(int i=0; i<100; i++) {
  Ball myBall=(Ball) ballCollection.get(i);
  myBall.run();
  }
}

class Ball {
  float x=0;
  float y=0;
  float speedX=4;
  float speedY=0.5;
  
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
