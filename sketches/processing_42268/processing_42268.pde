
float x1=0;
float x2=100;
float x3=0;
float y1=100;
float y2=100;
float y3=200;
float x_speed1=5;
float x_speed2=6;
float x_speed3=7;
float carsize=40;
float wheelsize=carsize/4;
 
void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
  background(mouseX,0,mouseY);
  x1 = move1(x1,x_speed1);
  x2 = move1(x2,x_speed2);
  x3 = move1(x3,x_speed3);
  
 
  bounce1();
  bounce2();
  bounce3();
 
  display1(x1, y1+20, carsize+10);
  display1(x2, y2+70, carsize);
  display1(x3, y3+125, carsize+20);
}
 
float move1(float x,float s) {
  x += s;
  return x;
  
}
 

void bounce1() {
  if ((x1>=width)||(x1<=0)) {
    x_speed1=x_speed1*-1;
  }
}
 
void bounce2() {
  if ((x2>=width)||(x2<=0)) {
    x_speed2=x_speed2*-1;
  }
}
 
void bounce3() {
  if ((x3>=width)||(x3<=0)) {
    x_speed3=x_speed3*-1;
  }
}
 
 
void display1(float x1, float y1, float carsize) {
  rectMode(CENTER);
  float wheelsize=carsize/4;
 
  stroke(255);
  fill(random(255), 0, 0);
  rect(x1, y1, carsize, carsize/2);
  rect(x1-wheelsize, y1-wheelsize, wheelsize, wheelsize/2);
  rect(x1+wheelsize, y1-wheelsize, wheelsize, wheelsize/2);
  rect(x1-wheelsize, y1+wheelsize, wheelsize, wheelsize/2);
  rect(x1+wheelsize, y1+wheelsize, wheelsize, wheelsize/2);
}

