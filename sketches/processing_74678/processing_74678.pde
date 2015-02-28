
float easing = 0.05;
float easingX = 0;
float easingY = 0;


void setup()
{
  size(680, 700);
  background(255);
  frameRate(60);
  smooth();
}

void draw()
{
  background(245, 250, 225);

  float targetX = mouseX;
  easingX += (targetX - easingX) * easing;

  float targetY = mouseY;
  easingY += (targetY - easingY) * easing;

  // Yellow Stripe
  pushMatrix();
  fill(random(212, 232), random(205, 225), random(2, 32), 120);
  noStroke();
  beginShape();
  vertex(615-(easingY/10), 0);
  vertex(680, 0);
  vertex(60, 700);
  vertex(0, 700);
  vertex(0, 510);
  endShape();
  popMatrix();

  // Blue Stripe
  pushMatrix();
  fill(random(57, 77), random(147, 167), random(118, 138), 120);
  noStroke();
  beginShape();
  vertex(130, 0);
  vertex(240+(easingX/10), 0);
  vertex(680, 400);
  vertex(680, 675);
  endShape();
  popMatrix();

  // Circle 13
  pushMatrix();
  fill(127, 185, 81, (easingX/2));
  stroke(21, 41, 10);
  strokeWeight(1);
  ellipse(330-(easingX/20), 360+(easingY/15), 210, 210);
  popMatrix();

  // Circle 12
  pushMatrix();
  fill(252, 244, 76, (easingX/2));
  noStroke();
  ellipse(267+(easingX/10), 372+(easingY/15), 163, 163);
  popMatrix();

  // Circle 11
  pushMatrix();
  fill(108, 206, 125, (easingY/2));
  noStroke();
  ellipse(466+(easingX/15), 308, 157, 157);
  popMatrix();

  // Circle 2
  pushMatrix();
  fill(183, 69, 17, (easingX/2));
  stroke(21, 41, 10);
  strokeWeight(7);
  ellipse(140, 310, 37+(easingX/20), 37+(easingX/20));
  popMatrix();

  // Circle 3
  pushMatrix();
  translate(easingX/17, easingY/8);
  fill(7, 103, 131, (easingX/4));
  stroke(21, 41, 10);
  strokeWeight(3);
  ellipse(110, 393, 16, 16);
  popMatrix();

  // Circle 4
  pushMatrix();
  fill(74, 165, 167, (easingX/2));
  stroke(21, 41, 10);
  strokeWeight(3);
  ellipse(182, 397, 49, 49);
  popMatrix();

  // Circle 5
  pushMatrix();
  fill(201, 134, 10, (easingY/2));
  stroke(21, 41, 10);
  strokeWeight(1);
  ellipse(146+(easingX/17), 490, 37, 37);
  popMatrix();

  // Circle 6
  pushMatrix();
  fill(183, 69, 17, (easingY/2));
  stroke(21, 41, 10);
  strokeWeight(2);
  ellipse(248-(easingX/20), 445+(easingY/17), 60, 60);
  popMatrix();

  // Circle 8
  pushMatrix();
  fill(183, 69, 17, (easingX/2));
  noStroke();
  ellipse(358-(easingY/7), 233-(easingY/10), 116, 116);
  popMatrix();

  // Circle 7
  pushMatrix();
  fill(234, 172, 135, (easingY/5));
  stroke(21, 41, 10);
  strokeWeight(1);
  ellipse(262, 198, 140, 140);
  popMatrix();

  // Circle 9
  pushMatrix();
  translate(easingY/40, easingX/10);
  fill(183, 69, 17, (easingX/4));
  stroke(21, 41, 10);
  strokeWeight(2);
  ellipse(315, 80, 15, 15);
  popMatrix();

  // Circle 14
  pushMatrix();
  fill(252, 244, 76, (easingY/2));
  stroke(21, 41, 10);
  strokeWeight(1);
  ellipse(440, 420, 105+(easingY/25), 105+(easingY/25));
  popMatrix();

  // Circle 18
  pushMatrix();
  fill(222, 150, 90, (easingX/2));
  stroke(21, 41, 10);
  strokeWeight(2);
  ellipse(367, 552, 37, 37);
  popMatrix();

  // Circle 19
  pushMatrix();
  fill(222, 150, 90, (easingX/2));
  stroke(21, 41, 10);
  strokeWeight(2);
  ellipse(534, 486, 27, 27);
  popMatrix();

  // Circle 20
  pushMatrix();
  translate(easingY/20, easingX/20);
  fill(191, 122, 58, (easingX/4));
  stroke(21, 41, 10);
  strokeWeight(1);
  ellipse(325, 478, 13, 13);
  popMatrix();

  // Circle 21
  pushMatrix();
  fill(252, 244, 76, (easingX/4));
  noStroke();
  ellipse(405, 505, 18, 18);
  popMatrix();

  // Circle 22
  pushMatrix();
  fill(191, 122, 58, (easingX/2));
  stroke(21, 41, 10);
  strokeWeight(1);
  ellipse(344+(easingX/17), 402-(easingY/10), 20, 20);
  popMatrix();

  // Circle 10
  pushMatrix();
  fill(103, 103, 103, (easingX/2));
  noStroke();
  ellipse(470, 177, 86, 86);
  popMatrix();

  // Circle 16
  pushMatrix();
  fill(74, 165, 167, (easingX/2));
  noStroke();
  ellipse(268, 272, 78, 78);
  popMatrix();

  // Circle 17
  pushMatrix();
  noFill();
  stroke(21, 41, 10);
  strokeWeight(2);
  ellipse(528, 321, 65, 65);
  popMatrix();

  // Circle 15
  pushMatrix();
  fill(183, 69, 17, (easingY/2));
  stroke(21, 41, 10);
  strokeWeight(4);
  ellipse(317, 310, 72, 72);
  popMatrix();

  // Point 1
  pushMatrix();
  fill(21, 41, 10);
  translate(-(mouseX/15), mouseY/15);
  stroke(21, 41, 10);
  strokeWeight(4);
  ellipse(317, 310, 13, 13);
  popMatrix();

  // Point 5
  pushMatrix();
  fill(21, 41, 10);
  translate(-(mouseX/35), -(mouseY/35));
  stroke(21, 41, 10);
  strokeWeight(4);
  ellipse(415, 210, 42, 42);
  popMatrix();

  // Point 4
  pushMatrix();
  fill(21, 41, 10);
  translate(mouseX/35, -(mouseY/35));
  stroke(21, 41, 10);
  strokeWeight(4);
  ellipse(471, 268, 28, 28);
  popMatrix();

  // Point 3
  pushMatrix();
  fill(21, 41, 10);
  translate(-(mouseX/35), mouseY/35);
  stroke(21, 41, 10);
  strokeWeight(4);
  ellipse(467, 458, 26, 26);
  popMatrix();

  // Point 2
  pushMatrix();
  fill(21, 41, 10);
  translate(-(mouseX/35), mouseY/35);
  stroke(21, 41, 10);
  strokeWeight(4);
  ellipse(280, 488, 6, 6);
  popMatrix();

  // Circle 1
  pushMatrix();
  noFill();
  stroke(21, 41, 10);
  strokeWeight(28);
  ellipse(340, 330, 590+(mouseY/20), 590+(mouseY/20));
  popMatrix();

  // Bold Line 1 
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(2);
  line(148, 175+(mouseX/18), 565, 228);
  popMatrix();

  // Bold Line 2
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(3);
  line(85, 334-(mouseY/14), 562, 435-(mouseX/20));
  popMatrix();

  // Bold Line 3
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(3);
  line(505-(mouseY/20), 496, 507, 210);
  popMatrix();

  // Bold Line 4
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(2);
  line(121, 369-(mouseX/5), 478, 558-(mouseX/25));
  popMatrix();

  // Bold Line 5
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(3);
  line(221+(mouseX/10), 555, 478-(mouseX/20), 105);
  popMatrix();

  // Bold Line 6
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(2);
  line(154+(mouseY/10), 425, 380, 137);
  popMatrix();

  // Bold Line 7  
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(2);
  //line(201, 129,560,390);
  line(201+(mouseX/10), 129, 552, 375);
  popMatrix();

  // Thin Lines 1
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(433, 575, 512, 120);
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(2);
  line(420, 560, 495, 127);
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(408, 551, 481, 128);
  popMatrix();

  // Thin Lines 2
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(193, 550, 438, 175);
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(175, 545, 438, 175);
  popMatrix();

  // Thin Lines 3
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(85, 277, 550, 412);
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(88, 265, 550, 395);
  popMatrix();

  // Thin Line 4 
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(114, 365, 323, 183);
  popMatrix();

  // Thin Line 5
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(124, 403, 542, 452);
  popMatrix();

  // Small Lines 1
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(357, 125, 388, random(160, 165));
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(345, 135, 385, 177);
  popMatrix();

  // Small Lines 2
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(2);
  line(500, 236, 527, 234);
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(2);
  line(500, 247, 538, random(244, 250));
  popMatrix();

  // Small Lines 3
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(393, 532, 464, random(493, 497));
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(397, random(540, 545), 467, 506);
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(400, random(550, 557), 470, 519);
  popMatrix();

  // Small Lines 4
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(165, 515, 295, random(480, 495));
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(194, random(477, 481), 290, 537);
  popMatrix();

  // Small Lines 5
  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(random(80, 90), 303, 120, 251);
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(98, 297, 132, 253);
  popMatrix();

  pushMatrix();
  stroke(49, 36, 4);
  strokeWeight(1);
  line(161, 321, 174, 270);
  popMatrix();
}

