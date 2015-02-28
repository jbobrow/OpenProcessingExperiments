
//Homework 3
//copyright Joanne Ong September 2011 Pittsburgh PA 15213


float x, y;
color col;

void setup()
{
size (400, 400);
smooth ();
background(255, 56, 0);
}


void draw()
{
  noFill();
  stroke(255, 252, 196);
  ellipse(mouseX, mouseY, 60, 60);
  if(mousePressed == true) {
    noCursor();
  } else {
    cursor(HAND);
  }
}

void mouseDragged()
{
  noStroke();
  col=color(0,147,147);
  fill(col);
  ellipse(mouseX, mouseY, 30, 30);
}



