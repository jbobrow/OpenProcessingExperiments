
//Copyright 2013 Kimberly Harvey all rights reserved Kharvey@cmu.edu
//Homework 3
//every time you click the mouse, the color of the dragged shape changes
//why are the floats put outside the setup?

float splat,wd,ht,y,xIncrement;

void setup()
{
  
size (400,400);  
  background(255);
splat = 1;
  smooth();
  strokeWeight(3); //the stroke is the size of the little square that is moving
  stroke( random( 255),random( 255),random( 255) ); //this makes the color of the stroke random, but I'm not sure because I have random listed somewhere else
   xIncrement = random( 1, 5); //this float value makes every increment a random change. 
}


void draw() 
{
rect( mouseX, mouseY, wd, ht);

}

void mousePressed( )
{
     stroke( random(255), random(255), random(255) );
     xIncrement = random( 1, 5);
}

