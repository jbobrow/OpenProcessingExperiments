
void setup(){
  smooth();
  size (400,400);
  fill (70,100,210);
}

// Assignment 5a

int x=20;
int speed=5;
void draw(){
  background(40,40,250);
  frameRate(24);
  ellipse (x,100,20,20);
  x=x+speed;
  if ((x<20)||(x>=380)){
    speed=speed*-1;
  }
}



