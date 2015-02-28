
/*****************************************
 * Assignment 1
 * Name: Allison Zacarias
 * E-mail:  azacarias@brynmawr.edu
 * Course:      CS 110 - Section 02
 * Submitted:    1/26/2012
 * 
 * The main driver program for project 1.
 *
 * My sketch consists of a caterpillar flying a kite. 
 * It has arms, legs, a beard,eyes, a mouth, and a hat.
 * Its body consists of 5 ellipses and its head, another ellipse.
 * I had some difficulty getting a curve for the kite. It was a
 * little dificult getting use to guessing the points for the different
 * components.  
***********************************************/

void setup() {
  size(700, 500);
  background (255, 255, 255);
  smooth ();
  //body
  fill (0, 255,0);
  ellipse (150, 230, 115, 115);
  ellipse (175, 300, 120, 100);
  ellipse (200, 350, 120, 100);
  ellipse (240, 375, 115, 80);
  ellipse (280, 400, 110, 70);
  
  //head
  ellipse (150, 150, 115, 115);
  
  //legs
  line (185, 400, 185, 440);
  line (195, 400, 195, 440);
  
  //eyes
  fill (0);
  ellipse (120, 140, 16, 32);
  ellipse (170, 140, 16, 32);
  
  //smile
  arc (145, 175, 50, 25, 0, PI);
  
  //hands
  line (210, 230, 260, 230);
  line (60, 250, 95, 230);
  
  //beard
  curve (93, 273, 112, 171, 184, 162, 230, 46);
  
  //kite
  fill (0);
  beginShape();
  vertex(357.5, 50); 
  vertex(357.5, 15); 
  vertex(392, 50); 
  vertex(357.5, 85); 
  vertex(322, 50); 
  vertex(357.5, 15); 
  endShape();
  
  line (363, 75, 250, 230);
  
  //crown
    rectMode (CENTER);
   rect (150, 90, 100, 45);
  
 
}

  

