
/*****************************************
 * Assignment 03
 * Kirsten Adams
 * kmadams@brynmawr.edu
 * CS 110 - Section 01
 * 10/3/2012
 * 
 * This file contains the source code for my third sketch which creates three objects using functions.
***********************************************/

int i = 0;

float a, c;

void setup() // creates the basics of the sketch, i.e., the size, background, and various program calls
{
  size (500,500);
  background (255,240,103);
  noStroke(); // will draw the object without an outline
  smooth();
  ellipseMode(CORNER); // the coordinates used to call the ellipse will be from its corner
  frameRate (1); // slows down the rate of the frame on the screen so that changes can be seen more clearly
  
  a = 300; // these variables are created just to make use of the skill
  c = 99;
}

void drawSnowCone() // this is the first function that I have called; it draws my first object
{
  fill (random(0,255), random(0,255), random(0,255)); // the randomness of the color allows different "flavors" to be seen
  ellipse (101,12,99,99); // draws the actual ice and flavor part of the snow cone
  fill (196,103,59);
  triangle (100,80, 200,80, 148,200); // draws the cone; I coded the triangle second so that it appears that the scoop in actually in the cone
}

void drawEatenSnowCone() // this is the second function called and it creates my second object
{
  fill (random(0,255), random(0,255), random(0,255));
  ellipse (a,12,c,c); // again, draws the rounded ice and flavoring
  fill (196,103,59);
  triangle (a,80, 400,80, 350,200); // draws the second cone
  fill (255,240,103);
  ellipse (280,15,50,50); // this ellipse creates the illusion that the cone has had a bite taken out of it
}

void drawSnowConeShop() // third function creating a third object
{
  fill (203,193,179);
  rect (150,250,175,350); // draws the door to the shop
  fill (0);
  ellipse (300,370,20,20); // door knob
  fill (46,98,26);
  ellipse (0,445,80,80); // draws the bushes lining the walk by the shop door
  ellipse (70,445,80,80);
  ellipse (325,445,80,80);
  ellipse (395,445,80,80);
}

void draw()
{
  drawSnowConeShop();
}

void mouseMoved()
{
  drawSnowCone();
}

void mouseReleased()
{
  drawEatenSnowCone();
}
