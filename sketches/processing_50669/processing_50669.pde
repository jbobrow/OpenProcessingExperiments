
//Homework3
//Vishal Agrawal
//vishala@andrew.cmu.edu
//copyright (C) 2012

void setup()
{
  size(500, 500);
  smooth();
  background(0,0,0);
  frameRate(25);
}
void draw()
{
  noStroke();
  fill(random(0,255), random(0,255), random(0,255),50);
  ellipse(mouseX,mouseY,width/5,height/5);
}

void keyPressed()
{
  if(key == ENTER)
  {
      background(0,0,0);
  }
}               
