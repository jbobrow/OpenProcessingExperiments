
/*
 *  Title: P06_01_ForLoops_1
 *  By:    Barton Poulson (bartdoesart.com)
 *  Date:  02 February 2013
 *
 *  Assignment:
 *    Create a sketch using a one-dimensional for loop
 *    (that is, just a regular for loop) to create, 
 *    place, or modify a large number of objects or 
 *    attributes. The sketch may be static or dynamic.
 */

int d = 40;  // diameter of circles

size(600, 200);
smooth();
noStroke();
colorMode(HSB, 360, 100, 100);

background(0);

// This loop cycles trough the color wheel and draws
// draws one randomly placed circle for each degree
// on the circle.
for (int i = 0; i < 360; i++) {
  fill(i, 100, 100, 40);
  ellipse(random(width), random(height), d, d);
}
