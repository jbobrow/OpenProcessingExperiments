
// HW #3
// Written by Mark Choi
// Andrew ID: mschoi
// © Mark Choi September 2013 Pittsburgh, Pa 15213  All Rights reserved

// This program takes the speed of the mouse to determine the width and height of the circle/rectangle
// speed is determined by "abs(pmouseX-mouseX), abs(pmouseY-mouseY)"

// input1: mouse movement - draws circles (default)
// input2: mouse press - draws rectangles
// input3: UP key - draws blank canvas

float x, y;
float rX; // X speed - determines X radius
float rY; // Y speed - determines Y radius

void setup()
{
  size( 400, 400 );
  background(255);
  frameRate(10);
}

void draw() 
{
 rX = abs(pmouseX-mouseX);
 rY = abs(pmouseY-mouseY);
 strokeWeight(1+random(3));
 stroke(random(255), random(255), random(255), 80);
 
if (mousePressed == true) // draw rectangle if mouse pressed
{
  rectMode(CENTER);
  fill(random(255), random(255), random(255), frameCount0);
  rect(mouseX, mouseY, rX*5, rY*5);
}
else //draw circle
{
 fill(random(255), random(255), random(255), 20);
 ellipse(mouseX, mouseY, rX*6.5, rY*6.5);
}
}

void keyPressed() // blank canvas
{
  if ( key == CODED )
  {
      if (keyCode == UP)
      {
        background(255);
      }
  }
}
