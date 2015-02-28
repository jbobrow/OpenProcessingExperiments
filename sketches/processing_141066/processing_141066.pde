
/*
 Konkuk University
 SOS iDesign
 
 Name: Shim, Sang Joon
 ID: shim sang joon
 */

PImage img;

void setup() {
  size (600, 600);
  smooth();
  colorMode (RGB, 600);
  background(586.4, 565.8, 319.7);
  ;
}

void draw() {
  println(mouseX + " : " + mouseY);


  strokeWeight(4);
  stroke(0);
  triangle(193, 23, 39, 598, 360, 599);
  noFill();
  line(193, 23, 360, 599);
  strokeWeight(1);
  line(0, 192, 409, 456);
  line(0, 285, 409, 456);
  line(444, 0, 448, 332);
  line(454, 0, 458, 332);
  line(406, 58, 495, 58);
  line(407, 64, 495, 63);
  line(417, 296, 493, 294);
  line(417, 303, 493, 301);
  line(417, 310, 493, 306);

  stroke(533.6, 280.6, 368);
  strokeWeight (4);
  line(250, 598, 404, 517);
  stroke(0);
  strokeWeight(1);
  line(334, 597, 489, 471);
  line(384, 599, 512, 476);
  line(538, 477, 597, 446);
  line(562, 515, 596, 497);
  line(0, 103, 21, 94);


  strokeWeight(3);
  line(471, 599, 490, 586);
  noFill();
  strokeWeight(1);
  noStroke();
  fill(mouseX+30, mouseY+30, 210, 543);
  triangle(279, 129, 208, 227, 329, 231);
  stroke(0);
  noFill();
  strokeWeight(1);
  triangle(515, 440, 598, 579, 599, 393);
  triangle(583, 554, 599, 581, 598, 546);
  fill(600);
  ellipse(368, 255, 90, 90);
  fill(212, 319.7, 586.5);
  ellipse(64, 156, 74, 74);
  ellipse(368, 255, 64, 64);
  noFill();
  fill(586.4, 0, 0);
  quad(515, 440, 539, 477, 575, 460, 554, 421);
  fill(600);
  quad(541, 482, 563, 514, 596, 498, 575, 460);
  ellipse(191, 452, 70, 70);

  noFill();
  fill(600);
  bezier(6, 599, 30, 595, 30, 492, 1, 498);
  noFill();
  fill(586.4, 450.8, 75.9);
  strokeWeight(3);
  bezier(599, 308, 547, 308, 547, 454, 598, 452);
  noFill();
  strokeWeight(1);
  bezier(481, 176, 406, 179, 406, 100, 482, 99);

  fill(600);
  quad(564, 523, 583, 554, 597, 545, 598, 521);
  noStroke();
  fill(586.5, 243.8, 443.9);
  quad(460, 402, 460, 521, 599, 521, 599, 402);
  stroke(0);
  strokeWeight(4);
  fill(586.4, 0, 0);
  quad(515, 440, 539, 477, 575, 460, 554, 421);
  fill(600);
  quad(541, 482, 563, 514, 596, 498, 575, 460);
  fill(0);
  quad(554, 421, 575, 460, 599, 450, 597, 401);
  noFill();

  line(515, 440, 598, 580);
  line(554, 422, 599, 505);
  line(563, 515, 598, 495);

  stroke(533.6, 280.6, 368);
  strokeWeight(4);
  bezier(346, 597, 347, 579, 421, 545, 442, 574);
  bezier(444, 577, 417, 538, 472, 512, 492, 530);
  stroke(0);
  fill(340.4, 361.1, 322);
  triangle(185, 531, 134, 599, 297, 598);
  fill(292.1, 425.5, 167.9);
  triangle(183, 548, 144, 597, 273, 599);
  fill(600);
  triangle(186, 566, 165, 593, 248, 596);

  stroke(0);
  strokeWeight(2);
  line(147, 597, 259, 541);
  line(162, 598, 268, 547);
  }
