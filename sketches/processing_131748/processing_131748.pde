
/* @pjs preload="bg.jpg"; 
 */

PImage img;

void setup() {
  size(400, 400);
  img = loadImage("bg.jpg");
  tint(100, 150);
  image(img, 0, 0);
  //wings
  noStroke();
  fill(242);
  triangle(40, 350, 183, 230, 147, 200);
  triangle(359, 350, 216, 230, 252, 200);
  //stabilizer
  noStroke();
  fill(100, 149, 237); 
  triangle(153, 200, 193, 200, 173, 350);
  triangle(206, 200, 246, 200, 226, 350);
  //core
  fill(212, 200);
  noStroke();
  triangle(170, 150, 228, 150, 199, 250);
  //forward
  stroke(0, 0, 0);
  fill(242);
  triangle(147, 200, 197, 150, 197, 5);
  triangle(251, 200, 201, 150, 201, 5);
}


