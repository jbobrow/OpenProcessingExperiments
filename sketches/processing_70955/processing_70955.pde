
/*****************************************
 * Assignment 02
 * Kirsten Adams
 * kmadams@brynmawr.edu
 * Course:      CS 110 - Section 01
 * Submitted:    9/19/2012
 *
 * This program attempts to create a sketch utilizing the use of variables, loops, and random().
 *
***********************************************/
  
  void setup() //sets up the sketch
  {
    size (500,500);
    background (random(0,255), random(0,255), random(0,255));
  }

  void draw() //draws the continuous stream of random colored rectangles
  {
  fill (random(0,255), random(0,255), random(0,255));
  float a = random (50,100);
  float b = random (50,100);
  rect (mouseX, mouseY, a, b);
  }

  void mousePressed() //will draw a rectangle any time the mouse is pressed
  {
    rect (mouseX, mouseY, 100,100);
  }
  
  void mouseReleased()// will draw an ellipse anytime the mouse is released
  {
    fill (0);
    stroke (255);
    ellipse (random(0,500), random(0,500), random(0,300), random(0,300));
  }


  void keyPressed() // clears the screen anytime a key is pressed
  {
    fill (255);
    rect (0,0,500,500);
  }
