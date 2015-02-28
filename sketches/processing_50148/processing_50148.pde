
//homework 3
//copyright russell andrews rwandrew 2012

float a, b;
int value = 0;

void setup()
{
  size (400,400);
  smooth();
  background(255);
  a=200;
  b=200;
}

void draw()
{
  //background(255, 255, 255);
  //fill(random(255), random(255), random(255), 50);
  stroke(random(255), random(255), random(255), 150);
  strokeWeight(value);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void mousePressed()
{
  if(value == 0) {
    value = 30;
  } else {
    value = 0;
  }
}

