
/* This program draws a logo for the company Third Corner
 using triangle(); and other associated codes.
 Created by Olaf Keller for the Kunstwurfelspiel Academy course:
 "Creating Geometric and Generative Art with Code: 
 An Introduction to Processing Software"
 */


void setup() {
  //set size
  size(600, 600);
  //set anti-aliasing on
  smooth();
}

void draw() {
  //set background to white
  background(255);

  //fill black
  fill(0);
  //bottom left triangle
  triangle(3, 560, 134, 329, 267, 560);

  //fill black
  fill(0);
  //top triangle
  triangle(166, 271, 299, 41, 432, 271);

  //no fill
  noFill();
  //set stroke size
  strokeWeight(3);
  //translate to the new start point
  translate(467, 465);
  //draws right bottom triangles
  for (int i=260; i>0; i=i-10) {
    pushMatrix();
    translate(0, -i/2);
    triangle(-i/2, i*cos(PI/6), 0, 0, i/2, i*cos(PI/6));
    popMatrix();
  }
}
