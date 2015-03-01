
void setup() {
  size(600, 600);
  background(255, 227, 85);
}

void draw() {
  noStroke();
  fill(255, 227, 85);
  rect(0, 0, 600, 600);

  //color Rect 
  //Pink
  fill(254, 159, 139);
  rect(130, 205, 180, 155);

  //Mint Rect
  fill(192, 220, 139);
  rect(278, 142, 20, 20);

  //in Pink Rect
  rect(235, 221, 7, 7);
  fill(253, 233, 205);
  rect(250, 270, 7, 12);
  fill(237, 254, 213);
  rect(149, 243, 12, 12);

  //Yellow Rect
  fill(232, 187, 62);
  rect(430, 300, 28, 47);

  //right stripe
  fill(0);
  rect(530, 16, 47, 8);
  rect(530, 34, 47, 4);
  rect(530, 56, 47, 8);
  rect(530, 86, 47, 4);
  rect(530, 110, 47, 2);
  rect(530, 136, 47, 4);

  rect(550, 320, 3, 80);
  rect(535, 320, 2, 85);

  //right triangle
  triangle(582, 280, 592, 280, 587, 295);
  triangle(587, 295, 582, 310, 592, 310);

  //on Pink Rect stripe
  rect(255, 185, 3, 53);
  rect(265, 185, 3, 53);

  //black Rect
  fill(0);
  rect(95, 215, 6, 170);
  rect(330, 355, 150, 13);

  //two line, black & purple triangle Set
  rect(400, 435, 50, 2);
  rect(395, 445, 60, 2);
  triangle(375, 462, 425, 478, 475, 462);
  fill(173, 155, 185);
  triangle(408, 478, 425, 520, 434, 478);

  //purple & black triangle Set
  fill(0);
  rect(265, 395, 45, 3);  
  fill(47, 25, 64);
  triangle(240, 405, 275, 470, 275, 405);
  fill(0);
  triangle(275, 405, 275, 470, 310, 405);
  fill(164, 185, 205);
  triangle(275, 470, 310, 470, 298, 483);

  //left top triangles
  fill(253, 232, 189);
  triangle(95, 50, 65, 110, 125, 110);
  fill(0);
  triangle(95, 50, 83, 74, 107, 74);
  triangle(95, 50, 105, 50, 100, 36);
  triangle(114, 79, 121, 74, 107, 74);
  triangle(83, 74, 70, 60, 86, 60);
  rect(60, 103, 70, 7);

  //left two blue ellipses
  fill(191, 219, 238, 100);
  ellipse(60, 160, 60, 60);
  fill(191, 219, 238);
  ellipse(60, 220, 27, 27);

  //right blue triangle
  fill(139, 180, 208);
  triangle(435, 126, 435, 90, 460, 107);

  //left two triangle
  fill(0);
  triangle(50, 320, 30, 340, 70, 340);
  triangle(50, 320, 60, 310, 70, 325);

  //on the pink rect Set
  triangle(202, 119, 187, 140, 217, 140);
  triangle(202, 131, 202, 340, 248, 316);
  triangle(202, 340, 242, 360, 202, 380);
  triangle(282, 340, 242, 360, 282, 380);
  triangle(202, 380, 202, 550, 242, 550);
  triangle(202, 550, 190, 565, 214, 565);
  fill(95, 76, 121);
  triangle(202, 340, 242, 360, 282, 340);
  fill(149, 134, 188);
  triangle(202, 380, 242, 360, 282, 380);

  //left bottom three triangles
  triangle(62, 491, 142, 491, 102, 523);
  triangle(102, 537, 92, 523, 112, 523);
  triangle(99, 537, 105, 537, 102, 545);

  //rightside Pink Set 1
  fill(87, 59, 106);
  triangle(350, 260, 329, 294, 362, 294);
  fill(154, 149, 134);
  triangle(350, 260, 362, 294, 416, 260);
  fill(10);
  triangle(416, 260, 362, 294, 423, 294);
  fill(0);
  triangle(334, 294, 329, 334, 339, 334);
  triangle(398, 294, 393, 334, 403, 334);
  triangle(376, 220, 362, 254, 390, 254);
  triangle(376, 220, 416, 200, 396, 228);
  fill(136, 111, 135);
  triangle(416, 200, 416, 175, 424, 199);

  //rightside Pink Set 2
  fill(0);
  stroke(1);
  strokeWeight(1);
  line(477, 215, 477, 305);
  line(450, 235, 504, 235);
  line(460, 240, 494, 240);
  line(477, 268, 470, 302);
  line(477, 268, 484, 302);
  noStroke();
  triangle(477, 200, 467, 215, 487, 215);
  quad(457, 260, 497, 260, 494, 268, 460, 268);

  //rightside Pink Set 3
  fill(95, 76, 121);
  triangle(592, 221, 505, 221, 563, 179);
  fill(0);
  triangle(557, 155, 589, 179, 549, 179);
  rect(544, 269, 28, 6);
  fill(199, 176, 209);
  triangle(537, 278, 574, 278, 564, 328);
  stroke(1);
  strokeWeight(1);
  line(560, 221, 549, 269);
  line(560, 221, 555, 269);
  line(560, 221, 561, 269);
  line(560, 221, 567, 269);

  noFill();

  stroke(0);
  strokeWeight(10);
  arc(435, 190, 120, 120, PI, TWO_PI);

  strokeWeight(8);
  arc(110, 445, 60, 60, 0, PI);

  strokeWeight(2);

  arc(529, 445, 30, 30, 0, PI);
  arc(298, 531, 20, 20, 0, PI);

  strokeWeight(3);
  arc(568, 521, 20, 20, 0, PI);

  strokeWeight(4);
  arc(481, 399, 40, 40, PI, TWO_PI );
  arc(509, 430, 50, 50, PI, TWO_PI );

  noStroke();
  fill(0, 25);
  ellipse(130, 340, 50, 50);

  fill(250);
  ellipse(345, 402, 24, 24);

  fill(0);
  stroke(0);
  strokeWeight(2);
  line(40, 250, 78, 250);
  strokeWeight(1);
  line(240, 100, 240, 140);
}

