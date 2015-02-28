
/* This program draws a logo for the company Tricolor or Threecolor
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

  //set stroke color to white
  stroke(255);

  //set stroke size
  strokeWeight(5);

  //fill red
  fill(255, 0, 0);
  //right triangle
  triangle(300, 34, 600, 554, 299, 381);

  //fill green
  fill(0, 255, 0);
  //bottom triangle
  triangle(0, 554, 299, 381, 600, 554);

  //fill blue
  fill(0, 0, 255);
  //left triangle
  triangle(0, 554, 300, 34, 299, 381);
}

