
//Michael Tristan Importico
//Homework 4 - User Input With Mouse
//© 2013 by Michael Tristan Importico. All rights reserved

// INSTRUCTIONS: A mouse press will reset and randomize the background color
//               A KeyPress will randomize the strokeweight from 1-15
//
void setup () {
  size(600, 600);
  background (200);
}

float rx = random(0, width);
float ry = random(0, height);
float sr= (1);
void draw() 
{

  for (int i=0; i<20; i++)  

  rx = random(0, width);
  ry = random(0, height);
  line (mouseX, mouseY, rx, ry);
  fill(mouseX*random(0.9, 1.1), mouseY*random(0.9, 1.1), random(0, 255), random(100, 200));
  ellipse (rx, ry, random(20, 60), random(20, 60));

}

void keyPressed ( ) {
  if (sr == 0) {
    sr = (random(15));
  } else {
    sr = 0;
  }
   strokeWeight(random(15));
}

void mousePressed( )
{
  background(random(255), random(255), random(255) );
}
