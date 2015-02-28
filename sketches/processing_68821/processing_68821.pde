
//homework 3
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin September 2012 Pittsburgh PA 15213 All Rights Reserved

//functions
float x, y, a, r, b, wd, ht;
boolean erase;

void setup()
{
  size(600, 400);
  smooth();
  x = 300;
  y = 200;
  a = 30;
  wd = 30;
  ht = 30;
  r = random(255);
  b = random(255);
  background(41);
  erase = false;
}


void draw()
{
  frameRate (a);
  if(erase)
  {
    noStroke();
    fill(41);
  }
  else
  {
    stroke(255, 255, 255);
    fill(r, 175, b, 30);
  }
 
  //polygon
  beginShape();
  vertex(x, y);
  vertex(x, y-.5*wd);
  vertex(x+1.5*wd, y+.5*wd);
  vertex(x+1.5*wd, y+1.5*wd);
  vertex(x+wd, y+2*wd);
  vertex(x, y+2*wd);
  vertex(x-.5*wd, y+1.5*wd);
  vertex(x-.5*wd, y+.5*wd);
  endShape(CLOSE);
  y = mouseY;
  x = mouseX;
  //saveFrame("hw3.jpg");
  
}


void mouseMoved()
{
  r = random(255);
  b = random(255);
}


void mousePressed()
{
  beginShape();
  vertex(x, y);
  vertex(x, y-.5*wd);
  vertex(x+1.5*wd, y+.5*wd);
  vertex(x+1.5*wd, y+1.5*wd);
  vertex(x+wd, y+2*wd);
  vertex(x, y+2*wd);
  vertex(x-.5*wd, y+1.5*wd);
  vertex(x-.5*wd, y+.5*wd);
  endShape(CLOSE);
}

void keyPressed()
{
  erase = !erase;
}

