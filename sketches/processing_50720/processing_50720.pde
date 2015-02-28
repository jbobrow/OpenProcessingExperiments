
// Code Written By: Chukwudi T. Unonu
// Date: 01/31/2012
// ARTT489i - Advanced Digital Imaging
// Instructor: Prof. Brandon Morse
// University of Maryland, College Park, MD
//
// Made With: Apple MAC OSX 10.5.8
// Processor 3.06 GHz Intel Core Duo
// Memory 4 GB 1067 MHZ DDR3
//

void setup()
{
  size(800,600);
  // color range is "0" to "255" (Red, Green, Blue)
  background(0,0,255);
  // The Above Is "Blue"
  
  }

void draw()
{
fill(80,255,255);
beginShape();

  vertex(500,800);
  vertex(210,120);
  vertex(900,900);
  vertex(240,240);
  vertex(1983,1983);
  
endShape(CLOSE);

  //Curve example from Processing.org
  // Syntax  	curve(x1, y1, x2, y2, x3, y3, x4, y4);
  //            curve(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4);


noFill();
stroke(255,0,0);
curve(500, 26, 500, 26, 730, 240, 730, 610);
stroke(0); 
curve(5, 26, 73, 24, 73, 61, 15, 65); 
stroke(255,0,0);
curve(730, 24, 730, 61, 150, 65, 150, 65);


// Quick Mouse Stuff 
}

