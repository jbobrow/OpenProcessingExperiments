
/*
 Konkuk University
 SOS iDesign
 
 Name: KIM Jieun
 ID: 201420072
 
 */

PImage img;
void setup() {
  background(528, 532, 482);
  size (600, 600);
  //noLoop();
  smooth();
  colorMode (RGB, 600);
  background(575, 554, 401);
  //img = loadImage ("wassily_kandinsky.jpg");
}

void draw() {
  colorMode(RGB, mouseX/(width/255), mouseY/(height/255), 255);
  println(mouseX + " : " + mouseY);
  //image (img, 0, 0);
  //draw a half circle
  bezier (156, 31, 300, 58, 300, 253, 154, 277);

  //draw a circle
  fill(5, 5, 5);
  ellipse(114, 155, 170, 170);
  noStroke();
  fill(470, 48, 208);
  ellipse(114, 155, 125, 125);

  //draw a line
  noStroke();
  line(156, 31, 156, 87);
  line(154, 228, 154, 277);

  //draw a quad
  fill(504, 518, 115);
  quad(112, 412, 136, 412, 129, 438, 118, 440);
  fill(31, 254, 84);
  quad(114, 513, 137, 513, 131, 537, 120, 535);
  noFill();
  strokeWeight(mouseY/10);
  bezier (255, 211, 419, 186, 465, 152, 467, 40);
  bezier (255, 211, 447, 244, 488, 194, 515, 63);
  noStroke();
  line(452, 102, 497, 126);
  noStroke();
  fill(576, 24, 254);
  triangle(269, 348, 259, 398, 315, 371);
  noStroke();
  fill(135, 114, 147);
  ellipse(265, 339, 20, 20);

  strokeWeight (5);
  stroke(0);
  line(260, 398, 317, 372);
  line(313, 441, 317, 372);
  line(260, 398, 313, 441);

  noFill();
  strokeWeight(1);
  line(204, 544, 204, 598);
  bezier (204, 544, 222, 413, 306, 594, 308, 499);
  bezier (308, 499, 293, 392, 367, 550, 370, 494);

  noFill();
  strokeWeight(1);
  bezier (252, 208, 401, 202, 449, 143, 466, 41);
  bezier (252, 208, 452, 239, 474, 209, 514, 61);
  bezier (387, 488, 544, 478, 276, 286, 452, 255);
  bezier (452, 255, 501, 473, 509, 380, 431, 567);
  line(426, 598, 431, 567);

  fill(600, 600, 600);
  bezier (232, 599, 225, 539, 268, 539, 270, 598);
  bezier (289, 598, 291, 545, 336, 542, 334, 599);
  bezier (352, 598, 370, 519, 415, 527, 397, 599);
  ellipse(426, 290, 40, 40);
  ellipse(235, 510, 20, 20);

  noStroke();
  fill(31, 254, 84);
  quad(467, 40, 490, 51, 472, 113, 451, 100);
  fill(576, 24, 254);
  quad(490, 51, 515, 62, 497, 126, 473, 113);

  fill(24, 103, 71);
  ellipse(315, 469, 50, 60);
  fill(576, 24, 254);
  ellipse(371, 477, 30, 40);
}

