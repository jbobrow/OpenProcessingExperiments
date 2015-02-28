
//Wenda Lewis Teh
//Creative Computing Assignment 4
//Feb 25 2013

int x=15;
float circleY=15;
float speed=3;
int x2=45;
float circleY2=15;
float speed2=speed/2;
float x3=15;
float circleY3=15;
float speed3=2;
float x4=15;
float circleY4=45;
float speed4=4;
int direction=1;




void setup() {  
  size(450, 450);
  background(255);
  smooth();
}

void draw() {  
  fill (random(0, 100), random(0, 255), random (180, 255));
  stroke(255);
  motionfast();
  fill (random(0, 50), random(0, 80), random (100, 200));
  motionslow();
  fill (random(40, 140), random(0, 255), random (100, 225));
  motionvertical();
  fill (random(100, 160), random(0, 105), random (130, 225));
  motionverticalsmall();
}

void motionfast() {  
  for (int x=15;x<500;x+=60) {
    ellipse(x, circleY, 30, 30);
  }
  ellipse(x, circleY, 30, 30); 
  if (circleY+15<height) {
    circleY = circleY + speed;
  } 
  else {
    speed = speed*-direction;
    circleY = circleY + speed;
  }
  if (circleY-15<0) {

    speed = speed*-direction;
    circleY = circleY + speed;
  }
}


void motionslow() {
  for (int x2=45;x2<500;x2+=60) {
    ellipse(x2, circleY2, 30, 30);
  }
  ellipse(x2, circleY2, 30, 30); 
  if (circleY2+15<height) {
    circleY2 = circleY2 + speed2;
  } 
  else {
    speed2 = speed2*-direction;
    circleY2 = circleY2 + speed2;
  }
  if (circleY2-15<0) {

    speed2 = speed2*-direction;
    circleY2 = circleY2 + speed2;
  }
}

void motionvertical() {
  for (int circleY3=15;circleY3<500;circleY3+=60) {
    ellipse(x3, circleY3, 30, 30);
  }
  ellipse(x3, circleY3, 30, 30); 
  if (x3+15<width) {
    x3 = x3 + speed3;
  } 
  else {
    speed3 = speed3*-direction;
    x3 = x3 + speed3;
  }
  if (x3-15<0) {

    speed3 = speed3*-direction;
    x3 = x3 + speed3;
  }
}

void motionverticalsmall() {
  for (int circleY4=45;circleY4<500;circleY4+=60) {
    ellipse(x4, circleY4, 14, 14);
  }
  ellipse(x4, circleY4, 14, 14); 
  if (x4+7<width) {
    x4 = x4 + speed4;
  } 
  else {
    speed4 = speed4*-direction;
    x4 = x4 + speed4;
  }
  if (x4-7<0) {

    speed4 = speed4*-direction;
    x4 = x4 + speed4;
  }
}
