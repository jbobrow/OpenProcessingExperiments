
/*-----------------------------
Project 1 

Created Feb 16, 2015
By Lauren Alman
contact alman.5@osu.edu
Modified February 18, 2015
//18x24
project URL
-----------------------------*/
int drawing = 0;
import processing.pdf.*;

void setup()
{
  //size of canvas
  size(420, 520); //4200,5200)
  //background is black
  background(255);
  //stroke color is white
  stroke(0);
  //stroke is smooth and not pixelated
  smooth();
  
  beginRecord(PDF, "P4.pdf"); 
}
 
void draw()
{
  
  BubbleDraw();
  drawing++;
  if (drawing>20)
  { 
    noLoop();
    endRecord();
  }
}

void BubbleDraw()
{
  //displacing the circles in a group around the middle
  translate(width/2, height/2);
  for (int i = 0; i < 15; i++)
  {
    for (int j = 0; j < 15; j++)
    {
      //circles have no fill (press picture before page turns white)
      noFill();
      //the angles in which the circles rotate are from -90 to 90
      float angle = random (-90, 90);
      //changes degrees to radians
      rotate (radians (angle));
      //circles made at 0,0 progressively get larger
      rect(0, 0, i+j, i+j);
      //moves the circles individually 
      translate(0, 25);
    }  
  }
}

void mousePressed() 
{
  redraw();
  // Holding down the mouse starts the loop
}

void mouseReleased() 
{
  noLoop();  
  // Releasing the mouse stops looping draw()
}

