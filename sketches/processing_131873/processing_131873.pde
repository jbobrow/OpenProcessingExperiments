
/* @pjs preload= "wall.jpg"; */

size (500, 500);
  
PImage img;
img = loadImage ("wall.jpg");
image (img, 0, 0);

noStroke ();
fill (0, 0, 0, 50);
rect (92, 55, 300, 404);

fill (#FFFFFF);
 strokeWeight(10);
 stroke (0, 0, 0);
 rect (100, 50, 300, 400);
 
 fill (#FFFFFF);
 strokeWeight(10);
 stroke (0, 0, 0);
 rect (100, 50, 80, 85);
 
 fill (#FF0000);
 strokeWeight(10);
 stroke (0, 0, 0);
 rect (180, 50, 220, 290);
 
 fill (#0017FF);
 strokeWeight(10);
 stroke (0, 0, 0);
 rect (100, 340, 80, 110);
 
 fill (#FFFFFF);
 strokeWeight(10);
 stroke (0, 0, 0);
 rect (340, 340, 60, 50);
 
 fill (#FEFF00);
 strokeWeight(10);
 stroke (0, 0, 0);
 rect (340, 390, 60, 60);
