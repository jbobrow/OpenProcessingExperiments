
/* This program draws an image for my own design 
 using line(); and other associated codes
 Created by Olaf Keller
 */

void setup() {
  size(700, 700);
  smooth();
}

void draw() {

  background(255);

  //lines
  strokeCap(SQUARE);
  stroke(0);

  strokeWeight(1);
  line(15, 295, 428, 9);

  strokeWeight(44);
  line(126, 455, 423, 248);

  strokeWeight(1);
  line(168, 516, 581, 229);

  strokeWeight(1);
  line(177, 529, 395, 378);

  strokeWeight(15);
  line(260, 647, 610, 404);

  strokeWeight(1);
  line(281, 679, 670, 410);

  strokeWeight(10);
  line(15, 295, 281, 679);

  strokeWeight(1);
  line(428, 9, 581, 229);

  strokeWeight(1);
  line(670, 410, 557, 246);

  strokeWeight(30);
  line(313, 89, 557, 441);

  strokeWeight(30);
  line(519, 272, 632, 436);

  strokeWeight(30);
  line(386, 365, 477, 497);

  strokeWeight(1);
  line(124, 220, 286, 453);
}

