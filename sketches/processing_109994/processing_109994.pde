
// HW #4
// Written by Mark Choi
// Andrew ID: mschoi
// © Mark Choi September 2013 Pittsburgh, Pa 15213  All Rights reserved

// This program takes uses the speed of the mouse to determine the width and height of the rectangle
// Speed is determined by "abs(pmouseX-mouseX), abs(pmouseY-mouseY)"
// Can alter the thickness and opacity of the rectangle by key press

// input1: Mouse Movement - draws rectangles
// input2: Up, Down Arrows - control thickness
// input3: Left, Right Arrows - control opacity 
// input4: Mouse Released - draws blank canvas in shade of grey

float opacity, thick;
float rX; // X speed - determines X radius
float rY; // Y speed - determines Y radius

void setup()
{
  size( 400, 400 );
  background(255);
  frameRate(5);
  smooth();
  opacity = 0;
  thick = 0;
}

void draw() 
{
   fill(100);
   noStroke();
   textSize(14);
   text( "Control Thickness: Up, Down Arrows", 5, 20 );
   text( "Control Opacity: Left, Right Arrows", 5, 38 );
   text( "Clear: Mouse Click", 5, 57 );
   
   rX = abs(pmouseX-mouseX);
   rY = abs(pmouseY-mouseY);
   strokeWeight(thick);
   stroke(random(255), random(255), random(255), 80);
   rectMode(CENTER);
   fill(random(255), random(255), random(255), opacity*10);
   rect(mouseX, mouseY, rX*5, rY*5); // rectangle


}
 
void keyPressed() 
{
  if ( key == CODED )
  {
    if ( keyCode == UP )
     {
       thick++;
     }
     else if ( keyCode == DOWN )
     {
       thick--;
     }
     else if ( keyCode == LEFT )
     {
       opacity--;
     }
     else if ( keyCode == RIGHT )
     {
       opacity++;
     }
   }
   
   if (thick < 0)
   {
     thick = 0 ;
   }
   
   if (opacity < 0)
   {
     opacity = 0 ;
   }
}

void mouseReleased()
{
   background (random(255));
}
