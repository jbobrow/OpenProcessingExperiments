
/* 
 Printing Code ITP
 (Spring 2012)
 
 Assignment Week 1: create a sketch of an ice cream cone that 
 consists only of black(0) and white(255) and uses the following
 three each no more than once: rect(), triangle() and ellipse().
 */

/* created by Alexandra Coym */


void setup () {
  size(500, 620);
  background(255);
}

void draw () {
  // creating the dotted style by drawing squares with a thick stroke (3.5)
  strokeWeight(3.5); 
  //  rectMode(CENTER); 
  //  for (int x=0; x<width; x+=5) {
  //    for (int y=0; y<height; y+=5) {
  //      stroke(255);
  //      fill(0);
  //      rect(x, y, 5, 5);
  fill(0);
  rect(0, 0, 500, 265);
  //}
  //}
  // creating the ellipse and setting strokeWeight for ellipse/triangle
  strokeWeight(1);
  stroke(255);
  fill(255);
  ellipse(250, 270, 210, 210);

  // looping through triangles to create stripped visuality
  //  for (int i=100; i<260; i=i+2) {
  //    triangle(i, 250, 250, 550, 400, 250);
  for (int i=0; i<200; i=i+2) {
    stroke(0);
    triangle(i+150, 270, 250, 600, 350, 270);
  }
}



