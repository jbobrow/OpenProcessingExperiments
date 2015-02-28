
// Min Kyung Kim, minkyunk@andrew.cmu.edu
// Copyright Min Kyung Kim January 2013. All rights reserved.
// Homework 3 - Computing for the Arts with Processing

// variables
float x, y, wd, ht, easingCoef;

// definitions
void setup ( )
{
  size ( 400, 400 );
  background ( 229, 255, 220 );
  frameRate (20);
  smooth ( );
  
  x = width * .5;
  y = height * .5;
  wd = width * .8;
  ht = height * .8;
  easingCoef = .5;
}

void draw ( )
{ 

  
  float distX = mouseX - x;
  float distY = mouseY - y;
  
  x = x + (distX * easingCoef);
  y = y + (distY * easingCoef);
  
  smooth ( );
  stroke ( 255, 204, 204, random (100));
  strokeWeight (4);
  line (x, y, x + 20, y - 20);
  line (x, y - 20, x + 20, y);
  line (x - 5, y - 10, x + 25, y - 10);
  line (x + 10, y + 5, x + 10, y - 25);
  
  if (mousePressed == true)  {
    stroke (255, 229, 204, random (200));
      strokeWeight (14);
    noFill ( );
  } else {
    stroke ( 255, random (100));
    noFill ( );
  }
  line (x, y, x + 40, y - 40);
  line (x, y - 40, x + 40, y );
  line (x - 10, y - 20, x + 50, y - 20);
  line (x + 20, y + 10, x + 20, y - 50);
  
  //if (mousePressed == true) {
    //saveFrame ("HOMEWORK3.jpg");
  //}
  
}



