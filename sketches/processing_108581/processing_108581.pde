
//Lauren Hartman
//lmhartma@andrew.cmu.edu
//© Lauren Hartman, September 2013


int num= 60;
float x, y, wd, ht;


void setup ()
{
  size (400, 400);
  smooth ();
  background (3,165,225);
  
  x = 0;
  y = 0;
  wd = 200;
  ht = 200;
  frameRate (8);
}

void draw ()
{
  smooth ();
  noStroke();
  fill ( 12, 12, 68, 100);
  rect (0, 0, width, height);
  
  int which = frameCount % num;
  stroke (255, 94, random(200));
  strokeWeight(5);
  fill(255, 90, 44, 75);
  ellipse ( mouseX, mouseY, mouseX, mouseX);
}

void mousePressed()
{
  stroke (255, 246, random(200));
  strokeWeight(16);
  fill(255, 246, 80, 80);
  ellipse ( mouseX, mouseY, mouseY, mouseY);
}
