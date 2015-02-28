
/*
 Konkuk University
 SOS iDesign
 
 Name: Hong Jiyae
 ID: 201420117
 
 */

PImage img;

void setup() {
  size (600, 600);
  background(#F2E5BA);
  // noLoop();
  smooth();
  colorMode (RGB, 600);
}
void draw() {
  println(mouseX + " : " + mouseY);

  stroke(0);
  strokeWeight(1);
  line(102, 133, 468, 378);
  line(112, 227, 468, 378);
  line(27, 517, -1, 510);
  line(16, 527, -1, 530);
  line(325, 464, 136, 553);
  line(363, 457, 136, 565);
  line(537, 397, 334, 600);
  strokeWeight(3);
  stroke(random(600), random(600), random(600), 250);
  line(540, 490, 389, 600);
  line(483, 256, 544, 253);
  line(149, 600, 305, 30);
  line(305, 30, 479, 600);
  line(505, 0, 507, 280);
  line(512, 280, 515, 0);
  line(479, 59, 547, 56);
  strokeWeight(8);
  stroke(#4EAF87);
  line(176, 600, 296, 460);
  line(296, 460, 547, 600);
  stroke(0);
  line(295, 451, 176, 600);
  line(295, 451, 547, 600);

  strokeWeight(3);
  stroke(#791B1B);
  line(480, 428, 149, 600);
  line(556, 404, 347, 600);
  point(203, 301);
  point(316, 424);

  stroke(#FCFC08);
  line(544, 500, 393, 600);

  stroke(0);
  fill(random(600), random(600), random(600), 300);
  ellipse(86, 301, 35, 35);

  noFill();
  ellipse(443, 217, 69, 69);

  strokeWeight(1);
  fill(600);
  ellipse(89, 460, 144, 144);
  strokeWeight(13);
  noFill();
  ellipse(89, 460, 90, 90);
  strokeWeight(1);
  ellipse(300, 376, 54, 54);

  noStroke();
  fill(#8CA4AF);
  ellipse(201, 134, 55, 55);
  fill(#2959B7);
  ellipse(443, 217, 46, 46);

  fill(mouseX, 100, mouseY, 100);
  rect(515, 337, 85, 90);
  triangle(374, 116, 321, 192, 411, 196);
  stroke(0);
  line(588, 531, 600, 548);
  triangle(605, 522, 583, 535, 605, 565);

  stroke(0);
  strokeWeight(4);
  fill(#FA4B28);
  quad(587, 353, 561, 372, 578, 400, 603, 387);
  line(578, 400, 600, 440);
  line(587, 353, 600, 343);

  fill(0);
  quad(117, 530, 94, 553, 110, 570, 129, 544);
  quad(91, 593, 74, 575, 51, 600, 89, 600);
  quad(578, 552, 545, 600, 560, 600, 586, 566);
  fill(600);
  quad(94, 553, 110, 570, 91, 593, 74, 575);

  noFill();
  strokeWeight(3);
  bezier(164, 86, 98, 124, 43, 175, 0, 226);
  bezier(116, 213, 68, 237, 25, 267, -1, 297);
  bezier(535, 89, 488, 87, 490, 153, 536, 154);
  bezier(600, 291, 595, 280, 593, 335, 600, 346);
  stroke(mouseX, 100, mouseY, 100);
  bezier(425, 547, 400, 511, 476, 443, 501, 480);
  bezier(501, 480, 489, 459, 532, 425, 544, 443);
  stroke(0);
  strokeWeight(5);
  bezier(340, 600, 313, 561, 397, 513, 425, 547);
}

