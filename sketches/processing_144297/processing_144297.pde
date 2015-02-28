
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Song Young Jun
// ID: 201420083

float x = width/2;
float y = height/2;
float xSpeed = 5;
float ySpeed = 3;
float r=180;
float angle;
float c1 = 0;      
float c2 = 255;   
float c1dir = 1; 
float c2dir = 1; 

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  noStroke();

  //hour
  fill(#aacdd3);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);

  //second
  fill(#659099);
  ellipse(width/2, height/2, second()*6, second()*6);
  fill(#4a484d);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(6*second()-138));
  ellipse(180, 180, 50, 50);
  popMatrix();
  fill(#20324a);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(222-(6*second())));
  ellipse(150, 150, 50, 50);
  popMatrix();
  fill(0);

  //minute
  pushMatrix();
  translate(x, y);
  rotate(angle);
  fill(#659099);
  ellipse(0, 0, minute()*5, minute()*5);
  fill(0);
  popMatrix();

  x=x+xSpeed;
  y=y+ySpeed;

  c1 = c1 + c1dir;
  c2 = c2 + c2dir;

  angle+=0.01;

  if ((x<0) || (x>width)) {
    xSpeed = xSpeed * -1;
  }
  if ((y<0) || (y>height)) {
    ySpeed = ySpeed * -1;
  }

  if (c1 < 0 || c1 > 255) {
    c1dir *= -1;
  }

  if (c2 < 0 || c2 > 255) {
    c2dir *= -1;
  }
  time(width/2, height-15);
}

void time(float x, float y)
{
  noStroke();
  fill(#aacdd3);
  rectMode(CENTER);
  rect(width/2, height-20, 150, 60);

  fill(255-(hour()*10.625));
  textAlign(CENTER);
  textSize(20);
  text(hour(), x-40, y);
  text(minute(), x, y);
  text(second(), x+40, y);
}

