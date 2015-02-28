
// Title     : Bezier Curve
// Author    : Michael Hawthorne
// Synopsis  : bezier curve 
// Date      : 
// Changlog  :


void setup()
{
  //smooth(); //smooth it out a little
  size(500,500); // Setup small window.
  background(0); // Background colour == Black, default Grey
  
  
}

void draw()
{
  
  noFill(); // we dont want to fill this curve, cos it looks better
  line(100, 0, 100, 500); // Lets draw a reference line so people can see its constraints better.
  line(400, 0, 400, 500); // Another one for the sake of it.
  for(int i = 50, z = 1; i < 501; i = i + 8){
    z+=20; // Add more to see more lines
    strokeWeight(0.5);
    stroke(219,230,45); // no alpha, but if you do you get cool uncontrollable effects making you think you done better than you have
    bezier(100,i, 200, 120, 300, 320, 400, i); //bezier main
    stroke(255,240,150); // new colour
    bezier(100,0,250,z-105, 305, 275,400,0); // bezier top
  }
}

                
                                
