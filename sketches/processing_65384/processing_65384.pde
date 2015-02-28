
Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;

float gravity = 0.05;

void setup(){
size(900,400);
ball1 = new Ball(0,200,10);
ball2 = new Ball(-150,100,10);
ball3 = new Ball(-300,150,10);
ball4 = new Ball(-600,180,10);
}

void draw(){
background(255);
ball1.display();
ball1.move();
ball2.display();
ball2.move();
ball3.display();
ball3.move();
ball4.display();
ball4.move();
}

class Ball{
  
float x;
float y;
float speed;
float w;
float c;

Ball(float tempX,float tempY,float tempW){
x=tempX;
y=tempY;
w=tempW;
speed = 0;
}

void display(){
  noFill();
  float c= x/4;
  stroke(c);
  strokeWeight(0.9);
  smooth();
  for(float w= 1;w<130;w+=6){
  ellipse(x,y,w,w);
  }
  }

void move(){
  x=x+speed;
  speed = speed +gravity;
  if(x>width){
  speed = speed*-0.95;
}
}
}
