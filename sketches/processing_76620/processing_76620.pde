
/*****************************************
 * Assignment 04
 * Kirsten Adams
 * kmadams@brynmawr.edu
 * CS 110 - Section 01
 * 10/24/2012
 * 
 * This file contains the source code for my fourth sketch which is based on classes.
***********************************************/

void setup() // creates the basics of the sketch, i.e., the size, background, and program calls.
{ 
  size (500,500);
  background (37,189,229); // creates blue sky
  noStroke(); // will draw objects without an outline
  smooth();
  ellipseMode(CORNER); // will create ellipses using the coordinates given for the corner of the ellipse
}

void drawButterfly()
{
  fill (118,46,219);
  ellipse (mouseX,mouseY,50,75); // draws the butterfly's wings
  ellipse (mouseX,mouseY,50,75);
  fill (255,31,226);
  ellipse (mouseX,mouseY,18,70); // draws the body of the butterfly
 }

void draw ()
{
  fill (67,170,36);
  rect (0,350,500,500); // draws grass
  fill (255,213,59);
  ellipse(387,35,82,82); // draws the sun
  fill (255);
  ellipse (10,50,75,50); // creates the clouds
  ellipse (65,70,75,60);
  ellipse (85,50,75,50);
}

void mouseClicked() // when the sketch is clicked, a butterfly in mid-wing flap is drawn
{
  drawButterfly();
}

class Butterfly // creates the class Butterfly
{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Butterfly()
  {
    c = color(0);
    xpos = width/2;
    ypos = height/2;
    xspeed = 1;
  }
  
  void display() // draws Butterfly
  {
    drawButterfly();
  }
  
  void move() // moves the Butterfly
  {
    xpos = xpos + xspeed;
    if (xpos > width)
    {
      xpos = 0;
    }
  }
}
