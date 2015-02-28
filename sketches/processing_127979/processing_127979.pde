
/* This program draws a logo for the company Atrium
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

  //set stroke size
  strokeWeight(60);
  //set the color
  stroke(0);
  //the big triangle
  triangle(61, 496, 291, 97, 521, 496);

  //set stroke size for three horizontal lines
  strokeWeight(21);
  //set stroke color to white
  stroke(255);
  //draw three horizontal white lines
  line(207, 168, 390, 168);
  line(135, 300, 468, 300);
  line(43, 456, 557, 456);

  //set stroke size for one vertical line
  strokeWeight(60);
  //draw one vertical white line
  line(290, 470, 290, 530);
}
