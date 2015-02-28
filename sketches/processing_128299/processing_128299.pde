
/* This program draws a picture called "Nude Triangle Descending a Staircase"
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
  //set background to black
  background(0);
  //set stroke color to white and alpha 30
  stroke(255, 30);

  //this part of code draws triangles, where every 
  //triangle becomes brighter and less transparent
  fill(15, 5);
  triangle(169, 184, 272, 3, 376, 183);
  fill(30, 10);
  triangle(169, 184, 297, 20, 375, 213);
  fill(45, 15);
  triangle(169, 184, 316, 37, 369, 238);
  fill(60, 20);
  triangle(169, 184, 340, 66, 356, 273);
  fill(75, 25);
  triangle(169, 184, 360, 102, 336, 308);
  fill(90, 30);
  triangle(169, 184, 373, 138, 312, 336);
  fill(105, 35);
  triangle(169, 184, 376, 170, 285, 357);
  //fill this triangle to red and alpha 40
  fill(255, 0, 0, 40);
  triangle(169, 184, 376, 183, 273, 363);
  fill(135, 45);
  triangle(167, 194, 375, 195, 271, 375);
  fill(150, 50);
  triangle(165, 207, 372, 218, 259, 392);
  fill(165, 55);
  triangle(169, 227, 374, 269, 243, 421);
  fill(180, 60);
  triangle(179, 247, 376, 313, 221, 451);
  fill(195, 65);
  triangle(192, 268, 376, 364, 201, 476);
  fill(210, 70);
  triangle(205, 289, 373, 412, 183, 496);
  fill(225, 75);
  triangle(231, 319, 374, 469, 172, 518);
  fill(240, 80);
  triangle(245, 373, 375, 535, 169, 567);
  fill(255, 90);
  triangle(252, 402, 356, 582, 148, 582);
}

