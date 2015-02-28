
/*****************************************
 * Assignment 01
 * Kirsten Adams
 * kmadams@brynmawr.edu
 * CS 110 - Section 01
 * 9/12/12
 * 
 * This file contains the source code for my first sketch which creates an owl on a branch.
***********************************************/

void setup() // Sets up the sketch itself; includes commands that are used throughout

{ 
  size (500,500);
  background (0,0,35); // creates the night sky
  noStroke ();
  smooth ();
  ellipseMode(CORNER);
}

void draw()

{ 
  fill (46,20,7);
  rect (0,450,450,40); // draws the branch
  
  fill (36,113,21);
  triangle (0,450, 15,420, 25,450); // draws leaves
  triangle (25,450, 45,480, 50,450);
  triangle (80,450, 90,420, 105,450);
  triangle (105,450, 125,480, 130,450);
  triangle (400,450, 410,420, 420,450);
  triangle (370,450, 380,480, 400,450); 
  
  fill (240,200,55);
  ellipse (40,40,90,90); // draws the moon
  fill (0,0,35);
  ellipse (70,30,90,90);

  fill (183,155,100);
  ellipse(200,300,120,150); // draws the owl's body
  fill(142,80,30);
  ellipse (222,370,67,67); // draws the owl's stomach furr
  
  fill (0,0,0);
  ellipse (210,320,45,45); // draws eyes
  ellipse (250,320,45,45);
  fill (183,155,100);
  ellipse (220,320,30,30);
  ellipse (260,320,30,30);
  fill (0,0,0);
  ellipse (230,320,20,20);
  ellipse (270,320,20,20);
 
  fill (183,155,100);
  triangle (223,315, 239,275, 261,315); // draws the owl's ears
  triangle (260,315, 286,275, 297,315);
}
