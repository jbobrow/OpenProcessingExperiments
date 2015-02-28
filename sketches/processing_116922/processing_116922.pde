
/*Miro Clock
 //Part of the miros-cat-encircled-by-the-flight-of-a-bird-eve-riser-roberts
 - rotating dots' lines by second
 -circles' color changing by second
 -dots & lines will light up when it is on the second's position 
 -rotating spiral by minute
 -every minute the whole canvas will mess up
 -background color changing by hour
 -when in the night, can press mouse to light it up
 -press s to save image
 //by KokFu Lok
 */
void setup() {
  size(600, 811);
  background(206, 210, 213);
  smooth();
  strokeWeight(2);
}
float theta1=0;
float theta2=radians(6*second());
float theta3=0.1;
int constant=100;
int scalar=4;

void draw() {
  int hr=hour();
  int min=minute();
  int sec=second();

  bgClr();

  stroke(0);
  strokeWeight(2);

  lineDot();
  secRotateDot();
  secColorChangeCircle();
  doulbeTri();

  float x4 = sin(theta3*sec);
  float y4 = sin(theta3*sec);
  fill(1);
  ellipse(x4+106, y4+78, 15, 14);
  ellipse(x4+309, y4+15, 15, 14);
  ellipse(x4+277, y4+154, 13, 14);
  ellipse(x4+135, y4+347, 15, 14);
  ellipse(x4+131, y4+813, 15, 14);
  ellipse(x4+431, y4+384, 18, 18);
  ellipse(x4+516, y4+563, 12, 12);
  //spiral
  //1
  pushMatrix();//rotate minutes
  int mx4=x4+110;
  int my4=y4+79;
  translate(mx4, my4);
  rotate(radians(6*min));
  noFill();
  beginShape();
  vertex(180-mx4, 15-my4);
  bezierVertex(146-mx4, 15-my4, 90-mx4, 15-my4, 72-mx4, 44-my4);
  bezierVertex(56-mx4, 70-my4, 52-mx4, 92-my4, 72-mx4, 110-my4);
  bezierVertex(87-mx4, 128-my4, 111-mx4, 132-my4, 126-mx4, 109-my4);
  bezierVertex(135-mx4, 96-my4, 140-mx4, 83-my4, 126-mx4, 67-my4);
  bezierVertex(118-mx4, 56-my4, 96-mx4, 51-my4, 85-mx4, 59-my4);
  bezierVertex(72-mx4, 68-my4, 74-mx4, 89-my4, 82-mx4, 97-my4);
  bezierVertex(88-mx4, 104-my4, 104-mx4, 104-my4, 110-mx4, 98-my4);
  bezierVertex(115-mx4, 92-my4, 116-mx4, 85-my4, x4+110-mx4, y4+79-my4);
  endShape();
  popMatrix();
  //2
  pushMatrix();//rotate minutes
  int mx5=x4+440;
  int my5=y4+383;
  translate(mx5, my5);
  rotate(radians(6*sec));
  beginShape();
  vertex(422-mx5, 274-my5);
  bezierVertex(400-mx5, 288-my5, 360-mx5, 358-my5, 369-mx5, 391-my5);
  bezierVertex(378-mx5, 421-my5, 396-mx5, 451-my5, 422-mx5, 450-my5);
  bezierVertex(444-mx5, 448-my5, 480-mx5, 438-my5, 480-mx5, 393-my5);
  bezierVertex(481-mx5, 368-my5, 458-mx5, 347-my5, 437-mx5, 346-my5);
  bezierVertex(423-mx5, 338-my5, 400-mx5, 354-my5, 398-mx5, 378-my5);
  bezierVertex(398-mx5, 394-my5, 406-mx5, 420-my5, 435-mx5, 416-my5);
  bezierVertex(443-mx5, 415-my5, 454-mx5, 404-my5, 454-mx5, 395-my5);
  bezierVertex(454-mx5, 388-my5, 448-mx5, 383-my5, x4+440-mx5, y4+383-my5);
  endShape();
  popMatrix();
  theta3=theta3+1;//((mouseX+mouseY)/500);
  //cut arc

  if (sec<1) {

    pushMatrix();
    translate(500, 300);
    rotate(theta1);
    //1-curve
    beginShape();
    vertex(274, 0);
    bezierVertex(259, 17, 260, 28, 257, 31);
    endShape();

    fill(1);
    beginShape();
    vertex(257, 31);
    bezierVertex(254, 60, 282, 80, 304, 85);
    bezierVertex(310, 65, 302, 28, 257, 31);
    endShape();

    fill(220, 210, 51);//yellow
    noStroke();
    beginShape();
    vertex(257, 31);
    bezierVertex(242, 36, 234, 40, 225, 52);
    bezierVertex(208, 74, 210, 104, 228, 119);
    bezierVertex(248, 134, 276, 128, 294, 105);
    bezierVertex(300, 98, 303, 92, 304, 85);
    bezierVertex(282, 80, 254, 60, 257, 31);
    endShape();

    noFill();
    stroke(2);
    beginShape();
    vertex(304, 85);
    bezierVertex(314, 87, 326, 88, 342, 87);
    endShape();

    fill(142, 45, 29);//dark red
    beginShape();
    vertex(342, 87);
    bezierVertex(400, 86, 420, 64, 429, 47);
    bezierVertex(420, 45, 413, 42, 403, 42);
    bezierVertex(370, 44, 342, 62, 342, 87);
    endShape();
    //
    noFill();
    bezier(429, 47, 434, 36, 429, 10, 417, 0);
    //curves
    //1
    bezier(x4+317, y4+13, 324, 10, 323, 0, 323, 0);
    //2
    bezier(429, 47, 429, 47, 446, 52, 452, 62);
    //
    fill(29, 24, 123, mouseX);//blue
    beginShape();
    vertex(482, 0);
    bezierVertex(482, 0, 467, 39, 452, 62);
    bezierVertex(464, 72, 470, 102, 475, 106);
    bezierVertex(500, 106, 544, 77, 562, 66);
    bezierVertex(550, 40, 482, 0, 482, 0);
    endShape();

    fill(1);
    beginShape();
    vertex(452, 62);
    bezierVertex(434, 80, 433, 111, 433, 111);
    bezierVertex(433, 111, 464, 109, 475, 106);
    bezierVertex(470, 102, 464, 72, 452, 62);
    endShape();

    //3
    noFill();
    beginShape();
    vertex(475, 106);
    bezierVertex(477, 125, 477, 146, 462, 155);
    bezierVertex(448, 163, 440, 167, 435, 175);
    endShape();

    fill(220, 210, 51);//yellow
    arc(429, 187, 28, 27, radians(-65), radians(100));
    fill(29, 24, 123, mouseY);//blue
    arc(429, 187, 28, 27, radians(100), radians(295));
    //
    noFill();
    line(435, 175, 429, 187);
    line(429, 187, 426, 200);
    //4
    fill(1);
    arc(443, 260, 48, 47, radians(-120), radians(-34));
    arc(443, 260, 48, 47, radians(52), radians(147));
    noStroke();
    fill(159, random(183, 255), 62);//green
    arc(443, 260, 48, 47, radians(-35), radians(52));
    fill(220, 210, 51);//yellow
    arc(443, 260, 48, 47, radians(147), radians(240));

    stroke(2);
    noFill();
    bezier(483, 235, 468, 240, 462, 246, 462, 246);
    bezier(426, 200, 430, 214, 430, 220, 432, 240);
    line(431, 239, 443, 260);
    line(443, 260, 458, 279);

    //5
    noStroke();
    fill(220, 210, 51);//yellow
    triangle(533, 367, 500, 361, 532, 384);
    stroke(2);
    fill(29, 24, 123, mouseY);//blue
    beginShape();
    vertex(600, 386);
    vertex(533, 367);
    vertex(532, 384);
    vertex(600, 425);
    endShape();
    //
    stroke(2);
    noFill();
    bezier(458, 279, 471, 290, 502, 322, 542, 317);
    //
    bezier(542, 317, 540, 326, 534, 362, 533, 367);
    //
    bezier(533, 384, 533, 392, 528, 444, 532, 457);
    //
    line(535, 486, 538, 517);
    //
    bezier(541, 543, 551, 576, 574, 620, 600, 653);
    //
    bezier(x4+516, y4+563, 549, 566, 574, 565, 590, 548);
    //
    line(538, 517, 541, 543);
    //
    fill(1);
    arc(535, 471, 27, 29, radians(88), radians(265));
    noStroke();
    fill(159, random(183, 255), 62);//green
    arc(535, 471, 27, 29, radians(-95), radians(88));
    //
    fill(220, 210, 51);//yellow
    arc(538, 530, 27, 25, radians(80), radians(270));
    stroke(2);
    fill(29, 24, 123, mouseX);//blue
    arc(538, 530, 27, 25, radians(-90), radians(80));


    //7
    fill(142, 45, 29);//dark red
    beginShape();
    vertex(619, 277);
    bezierVertex(610, 290, 588, 316, 542, 317);
    bezierVertex(544, 310, 572, 204, 587, 175);
    bezierVertex(598, 174, 600, 177, 600, 177);
    endShape();

    line(587, 175, 589, 171);
    line(598, 153, 601, 147);

    noStroke();
    fill(178, 36, 28);// red
    beginShape();
    vertex(598, 153);
    bezierVertex(598, 153, 574, 146, 574, 141);
    bezierVertex(573, 139, 578, 126, 590, 115);
    bezierVertex(604, 106, 614, 104, 614, 104);
    bezierVertex(596, 100, 578, 104, 562, 112);
    bezierVertex(548, 122, 548, 144, 548, 147);
    bezierVertex(556, 162, 589, 171, 589, 171);
    endShape();
    //
    stroke(2);
    fill(29, 24, 123, mouseY);
    triangle(600, 561, 600, 536, 590, 548);
    fill(1);
    triangle(590, 548, 600, 536, 582, 538);
    beginShape();
    vertex(600, 569);
    vertex(579, 604);
    vertex(589, 608);
    vertex(600, 608);
    endShape();

    //
    line(342, 87, 342, 112);
    //
    noStroke();
    fill(159, random(183, 255), 62);//green
    arc(342, 127, 31, 29, radians(90), radians(270));

    stroke(2);
    fill(29, 24, 123, mouseX);//blue
    arc(342, 127, 31, 29, radians(-90), radians(90));
    //
    noFill();
    beginShape();
    vertex(342, 142);
    bezierVertex(344, 161, 346, 196, 336, 213);
    bezierVertex(324, 230, 306, 250, 297, 254);
    endShape();
    //
    fill(1);
    beginShape();
    vertex(297, 254);
    vertex(303, 215);
    bezierVertex(288, 210, 260, 218, 254, 226);
    vertex(275, 263);
    endShape();
    //
    beginShape();
    vertex(290, 287);
    vertex(332, 349);
    bezierVertex(333, 356, 276, 382, 258, 368);
    bezierVertex(258, 368, 264, 351, 270, 340);
    bezierVertex(284, 322, 290, 287, 290, 287);
    endShape();
    //
    fill(142, 45, 29);//dark red
    triangle(297, 254, 275, 263, 290, 287);
    //
    fill(29, 24, 123, mouseY);//blue
    beginShape();
    vertex(290, 287);
    vertex(275, 263);
    bezierVertex(270, 266, 254, 270, 229, 266);
    bezierVertex(206, 264, 152, 246, 152, 246);
    bezierVertex(152, 246, 190, 288, 182, 371);
    bezierVertex(218, 374, 252, 364, 268, 343);
    bezierVertex(284, 326, 290, 287, 290, 287);
    endShape();
    //

    noFill();
    bezier(182, 371, 162, 368, 143, 354, x4+134, y4+347);
    line(182, 371, 174, 449);
    //
    bezier(141, 568, 114, 619, 122, 665, 122, 673);
    //
    bezier(145, 736, 148, 750, 180, 797, 187, 811);
    //
    fill(159, random(183, 255), 62);//green
    translate(283, 520);
    rotate(radians(26));
    ellipse(0, 0, 150, 159);
    //
    rotate(radians(-26));
    translate(-283, -520);
    fill(29, 24, 123, mouseX);//blue
    beginShape();
    vertex(174, 449);
    bezierVertex(202, 448, 236, 478, 235, 514);
    bezierVertex(236, 550, 189, 584, 141, 568);
    bezierVertex(170, 518, 174, 449, 174, 449);
    endShape();
    //
    beginShape();
    arc(154, 695, 78, 82, radians(102), radians(360-145));
    vertex(122, 673);
    vertex(145, 736);
    endShape();
    //

    beginShape();
    arc(154, 695, 78, 82, radians(-145), radians(102));
    vertex(122, 673);
    vertex(145, 736);
    endShape();
    //
    fill(1);
    beginShape();
    vertex(174, 449);
    bezierVertex(164, 451, 114, 447, 103, 510);
    bezierVertex(99, 536, 116, 560, 141, 568);
    bezierVertex(170, 518, 174, 449, 174, 449);
    endShape();
    //

    //
    noStroke();
    fill(178, 36, 28);// red
    ellipse(428, 862, 223, 162);
    //-26

    fill(1);
    beginShape();
    vertex(213, 555);
    bezierVertex(200, 524, 214, 493, 220, 477);
    bezierVertex(250, 506, 238, 538, 213, 555);
    endShape();
    //
    fill(29, 24, 123, mouseY);//blue
    ellipse(353, 633, 179, 172);
    //
    fill(1);
    beginShape();
    vertex(270, 601);
    bezierVertex(284, 570, 312, 545, 352, 547);
    bezierVertex(350, 578, 302, 606, 270, 601);
    endShape();
    beginShape();
    vertex(347, 473);
    bezierVertex(356, 488, 360, 504, 358, 522);
    bezierVertex(330, 518, 332, 492, 347, 473);
    endShape();
    //
    noFill();
    stroke(2);
    bezier(347, 473, 354, 464, 364, 458, 376, 458);
    bezier(358, 522, 370, 524, 382, 523, 401, 516);
    line(382, 731, 391, 773);

    fill(1);
    arc(379, 715, 31, 33, radians(-15), radians(170));
    arc(394, 787, 31, 29, radians(-15), radians(170));
    //
    fill(29, 24, 123, mouseX);//blue
    arc(394, 787, 31, 29, radians(170), radians(360-15));
    noStroke();
    fill(220, 210, 51);//yellow
    arc(379, 715, 31, 33, radians(170), radians(360-20));

    stroke(random(255), mouseY, mouseX);
    strokeWeight(1);
    //1
    line(237, 0, 249, 14);
    line(237, 0, 237, 22);
    line(231, 0, 219, 13);
    if (mousePressed) {
      //2
      pushMatrix();
      float a=61;
      float b=340;
      translate(a, b);
      rotate(theta1);
      //center(61,340)
      scale(sin(theta1));
      line(49-a, 291-b, 72-a, 382-b);
      line(73-a, 299-b, 49-a, 382-b);
      line(31-a, 322-b, 92-a, 353-b);
      line(32-a, 351-b, 86-a, 325-b);
      theta1 +=1;
      popMatrix();

      //3(471,478)
      pushMatrix();
      float a1=471;
      float b1=478;
      translate(a1, b1);
      rotate(theta1);
      scale(tan(theta1));
      line(476-a1, 450-b1, 471-a1, 510-b1);
      line(450-a1, 457-b1, 492-a1, 499-b1);
      line(490-a1, 458-b1, 448-a1, 500-b1);
      line(442-a1, 481-b1, 498-a1, 478-b1);
      theta1 +=1;
      popMatrix();

      //4(491,633)
      pushMatrix();
      float a2=491;
      float b2=633;
      translate(a2, b2);
      rotate(theta1);
      scale(cos(theta1));
      line(488-a2, 569-b2, 494-a2, 687-b2);
      line(443-a2, 629-b2, 537-a2, 626-b2);
      line(514-a2, 601-b2, 457-a2, 657-b2);
      line(461-a2, 610-b2, 516-a2, 658-b2);
      theta1 +=1;
      popMatrix();
    }
    else {
      stroke(0);
      strokeWeight(2);
      //star lines
      //1
      line(237, 0, 249, 14);
      line(237, 0, 237, 22);
      line(231, 0, 219, 13);
      //2
      line(49, 291, 72, 382);
      line(73, 299, 49, 382);
      line(31, 322, 92, 353);
      line(32, 351, 86, 325);
      //3
      line(476, 450, 471, 510);
      line(450, 457, 492, 499);
      line(490, 458, 448, 500);
      line(442, 481, 498, 478);
      //4
      line(488, 569, 494, 687);
      line(443, 629, 537, 626);
      line(514, 601, 457, 657);
      line(461, 610, 516, 658);
    }

    theta1 +=1;
    popMatrix();
  }
  else {
    //1-curve
    beginShape();
    vertex(274, 0);
    bezierVertex(259, 17, 260, 28, 257, 31);
    endShape();

    fill(1);
    beginShape();
    vertex(257, 31);
    bezierVertex(254, 60, 282, 80, 304, 85);
    bezierVertex(310, 65, 302, 28, 257, 31);
    endShape();

    fill(220, 210, 51);//yellow
    noStroke();
    beginShape();
    vertex(257, 31);
    bezierVertex(242, 36, 234, 40, 225, 52);
    bezierVertex(208, 74, 210, 104, 228, 119);
    bezierVertex(248, 134, 276, 128, 294, 105);
    bezierVertex(300, 98, 303, 92, 304, 85);
    bezierVertex(282, 80, 254, 60, 257, 31);
    endShape();

    noFill();
    stroke(2);
    beginShape();
    vertex(304, 85);
    bezierVertex(314, 87, 326, 88, 342, 87);
    endShape();

    fill(142, 45, 29);//dark red
    beginShape();
    vertex(342, 87);
    bezierVertex(400, 86, 420, 64, 429, 47);
    bezierVertex(420, 45, 413, 42, 403, 42);
    bezierVertex(370, 44, 342, 62, 342, 87);
    endShape();
    //
    noFill();
    bezier(429, 47, 434, 36, 429, 10, 417, 0);
    //curves
    //1
    bezier(x4+317, y4+13, 324, 10, 323, 0, 323, 0);
    //2
    bezier(429, 47, 429, 47, 446, 52, 452, 62);
    //
    fill(29, 24, 123, mouseX);//blue
    beginShape();
    vertex(482, 0);
    bezierVertex(482, 0, 467, 39, 452, 62);
    bezierVertex(464, 72, 470, 102, 475, 106);
    bezierVertex(500, 106, 544, 77, 562, 66);
    bezierVertex(550, 40, 482, 0, 482, 0);
    endShape();

    fill(1);
    beginShape();
    vertex(452, 62);
    bezierVertex(434, 80, 433, 111, 433, 111);
    bezierVertex(433, 111, 464, 109, 475, 106);
    bezierVertex(470, 102, 464, 72, 452, 62);
    endShape();

    //3
    noFill();
    beginShape();
    vertex(475, 106);
    bezierVertex(477, 125, 477, 146, 462, 155);
    bezierVertex(448, 163, 440, 167, 435, 175);
    endShape();

    fill(220, 210, 51);//yellow
    arc(429, 187, 28, 27, radians(-65), radians(100));
    fill(29, 24, 123, mouseY);//blue
    arc(429, 187, 28, 27, radians(100), radians(295));
    //
    noFill();
    line(435, 175, 429, 187);
    line(429, 187, 426, 200);
    //4
    fill(1);
    arc(443, 260, 48, 47, radians(-120), radians(-34));
    arc(443, 260, 48, 47, radians(52), radians(147));
    noStroke();
    fill(159, random(183, 255), 62);//green
    arc(443, 260, 48, 47, radians(-35), radians(52));
    fill(220, 210, 51);//yellow
    arc(443, 260, 48, 47, radians(147), radians(240));

    stroke(2);
    noFill();
    bezier(483, 235, 468, 240, 462, 246, 462, 246);
    bezier(426, 200, 430, 214, 430, 220, 432, 240);
    line(431, 239, 443, 260);
    line(443, 260, 458, 279);

    //5
    noStroke();
    fill(220, 210, 51);//yellow
    triangle(533, 367, 500, 361, 532, 384);
    stroke(2);
    fill(29, 24, 123, mouseY);//blue
    beginShape();
    vertex(600, 386);
    vertex(533, 367);
    vertex(532, 384);
    vertex(600, 425);
    endShape();
    //
    stroke(2);
    noFill();
    bezier(458, 279, 471, 290, 502, 322, 542, 317);
    //
    bezier(542, 317, 540, 326, 534, 362, 533, 367);
    //
    bezier(533, 384, 533, 392, 528, 444, 532, 457);
    //
    line(535, 486, 538, 517);
    //
    bezier(541, 543, 551, 576, 574, 620, 600, 653);
    //
    bezier(x4+516, y4+563, 549, 566, 574, 565, 590, 548);
    //
    line(538, 517, 541, 543);
    //
    fill(1);
    arc(535, 471, 27, 29, radians(88), radians(265));
    noStroke();
    fill(159, random(183, 255), 62);//green
    arc(535, 471, 27, 29, radians(-95), radians(88));
    //
    fill(220, 210, 51);//yellow
    arc(538, 530, 27, 25, radians(80), radians(270));
    stroke(2);
    fill(29, 24, 123, mouseX);//blue
    arc(538, 530, 27, 25, radians(-90), radians(80));


    //7
    fill(142, 45, 29);//dark red
    beginShape();
    vertex(619, 277);
    bezierVertex(610, 290, 588, 316, 542, 317);
    bezierVertex(544, 310, 572, 204, 587, 175);
    bezierVertex(598, 174, 600, 177, 600, 177);
    endShape();

    line(587, 175, 589, 171);
    line(598, 153, 601, 147);

    noStroke();
    fill(178, 36, 28);// red
    beginShape();
    vertex(598, 153);
    bezierVertex(598, 153, 574, 146, 574, 141);
    bezierVertex(573, 139, 578, 126, 590, 115);
    bezierVertex(604, 106, 614, 104, 614, 104);
    bezierVertex(596, 100, 578, 104, 562, 112);
    bezierVertex(548, 122, 548, 144, 548, 147);
    bezierVertex(556, 162, 589, 171, 589, 171);
    endShape();
    //
    stroke(2);
    fill(29, 24, 123, mouseY);
    triangle(600, 561, 600, 536, 590, 548);
    fill(1);
    triangle(590, 548, 600, 536, 582, 538);
    beginShape();
    vertex(600, 569);
    vertex(579, 604);
    vertex(589, 608);
    vertex(600, 608);
    endShape();

    //
    line(342, 87, 342, 112);
    //
    noStroke();
    fill(159, random(183, 255), 62);//green
    arc(342, 127, 31, 29, radians(90), radians(270));

    stroke(2);
    fill(29, 24, 123, mouseX);//blue
    arc(342, 127, 31, 29, radians(-90), radians(90));
    //
    noFill();
    beginShape();
    vertex(342, 142);
    bezierVertex(344, 161, 346, 196, 336, 213);
    bezierVertex(324, 230, 306, 250, 297, 254);
    endShape();
    //
    fill(1);
    beginShape();
    vertex(297, 254);
    vertex(303, 215);
    bezierVertex(288, 210, 260, 218, 254, 226);
    vertex(275, 263);
    endShape();
    //
    beginShape();
    vertex(290, 287);
    vertex(332, 349);
    bezierVertex(333, 356, 276, 382, 258, 368);
    bezierVertex(258, 368, 264, 351, 270, 340);
    bezierVertex(284, 322, 290, 287, 290, 287);
    endShape();
    //
    fill(142, 45, 29);//dark red
    triangle(297, 254, 275, 263, 290, 287);
    //
    fill(29, 24, 123, mouseY);//blue
    beginShape();
    vertex(290, 287);
    vertex(275, 263);
    bezierVertex(270, 266, 254, 270, 229, 266);
    bezierVertex(206, 264, 152, 246, 152, 246);
    bezierVertex(152, 246, 190, 288, 182, 371);
    bezierVertex(218, 374, 252, 364, 268, 343);
    bezierVertex(284, 326, 290, 287, 290, 287);
    endShape();
    //

    noFill();
    bezier(182, 371, 162, 368, 143, 354, x4+134, y4+347);
    line(182, 371, 174, 449);
    //
    bezier(141, 568, 114, 619, 122, 665, 122, 673);
    //
    bezier(145, 736, 148, 750, 180, 797, 187, 811);
    //
    fill(159, random(183, 255), 62);//green
    translate(283, 520);
    rotate(radians(26));
    ellipse(0, 0, 150, 159);
    //
    rotate(radians(-26));
    translate(-283, -520);
    fill(29, 24, 123, mouseX);//blue
    beginShape();
    vertex(174, 449);
    bezierVertex(202, 448, 236, 478, 235, 514);
    bezierVertex(236, 550, 189, 584, 141, 568);
    bezierVertex(170, 518, 174, 449, 174, 449);
    endShape();
    //
    beginShape();
    arc(154, 695, 78, 82, radians(102), radians(360-145));
    vertex(122, 673);
    vertex(145, 736);
    endShape();
    //

    beginShape();
    arc(154, 695, 78, 82, radians(-145), radians(102));
    vertex(122, 673);
    vertex(145, 736);
    endShape();
    //
    fill(1);
    beginShape();
    vertex(174, 449);
    bezierVertex(164, 451, 114, 447, 103, 510);
    bezierVertex(99, 536, 116, 560, 141, 568);
    bezierVertex(170, 518, 174, 449, 174, 449);
    endShape();
    //

    //
    noStroke();
    fill(178, 36, 28);// red
    ellipse(428, 862, 223, 162);
    //-26

    fill(1);
    beginShape();
    vertex(213, 555);
    bezierVertex(200, 524, 214, 493, 220, 477);
    bezierVertex(250, 506, 238, 538, 213, 555);
    endShape();
    //
    fill(29, 24, 123, mouseY);//blue
    ellipse(353, 633, 179, 172);
    //
    fill(1);
    beginShape();
    vertex(270, 601);
    bezierVertex(284, 570, 312, 545, 352, 547);
    bezierVertex(350, 578, 302, 606, 270, 601);
    endShape();
    beginShape();
    vertex(347, 473);
    bezierVertex(356, 488, 360, 504, 358, 522);
    bezierVertex(330, 518, 332, 492, 347, 473);
    endShape();
    //
    noFill();
    stroke(2);
    bezier(347, 473, 354, 464, 364, 458, 376, 458);
    bezier(358, 522, 370, 524, 382, 523, 401, 516);
    line(382, 731, 391, 773);

    fill(1);
    arc(379, 715, 31, 33, radians(-15), radians(170));
    arc(394, 787, 31, 29, radians(-15), radians(170));
    //
    fill(29, 24, 123, mouseX);//blue
    arc(394, 787, 31, 29, radians(170), radians(360-15));
    noStroke();
    fill(220, 210, 51);//yellow
    arc(379, 715, 31, 33, radians(170), radians(360-20));

    stroke(random(255), mouseY, mouseX);
    strokeWeight(1);
    //1
    line(237, 0, 249, 14);
    line(237, 0, 237, 22);
    line(231, 0, 219, 13);
    if (mousePressed) {
      //2
      pushMatrix();
      float a=61;
      float b=340;
      translate(a, b);
      rotate(theta1);
      //center(61,340)
      scale(sin(theta1));
      line(49-a, 291-b, 72-a, 382-b);
      line(73-a, 299-b, 49-a, 382-b);
      line(31-a, 322-b, 92-a, 353-b);
      line(32-a, 351-b, 86-a, 325-b);
      theta1 +=1;
      popMatrix();

      //3(471,478)
      pushMatrix();
      float a1=471;
      float b1=478;
      translate(a1, b1);
      rotate(theta1);
      scale(tan(theta1));
      line(476-a1, 450-b1, 471-a1, 510-b1);
      line(450-a1, 457-b1, 492-a1, 499-b1);
      line(490-a1, 458-b1, 448-a1, 500-b1);
      line(442-a1, 481-b1, 498-a1, 478-b1);
      theta1 +=1;
      popMatrix();

      //4(491,633)
      pushMatrix();
      float a2=491;
      float b2=633;
      translate(a2, b2);
      rotate(theta1);
      scale(cos(theta1));
      line(488-a2, 569-b2, 494-a2, 687-b2);
      line(443-a2, 629-b2, 537-a2, 626-b2);
      line(514-a2, 601-b2, 457-a2, 657-b2);
      line(461-a2, 610-b2, 516-a2, 658-b2);
      theta1 +=1;
      popMatrix();
    }
    else {
      stroke(0);
      strokeWeight(2);
      //star lines
      //1
      line(237, 0, 249, 14);
      line(237, 0, 237, 22);
      line(231, 0, 219, 13);
      //2
      line(49, 291, 72, 382);
      line(73, 299, 49, 382);
      line(31, 322, 92, 353);
      line(32, 351, 86, 325);
      //3
      line(476, 450, 471, 510);
      line(450, 457, 492, 499);
      line(490, 458, 448, 500);
      line(442, 481, 498, 478);
      //4
      line(488, 569, 494, 687);
      line(443, 629, 537, 626);
      line(514, 601, 457, 657);
      line(461, 610, 516, 658);
    }
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("screen-####.png");
  }
}
void bgClr() { //changing hourly
  int hr=hour();
  if (mousePressed) { //15-20 dawn
    background(206, 210, 213);
  }
  else if (hr>=0 && hr<6) { //0-6 sunrise
    background(hr*34.33, hr*35, hr*35.5);
  }
  else if (hr>=6 && hr<15) { //6-15 light
    background(206, 210, 213);
  }
  else if (hr>=15 && hr<20) { //15-20 dawn
    background((20-hr)*41.2, (20-hr)*42, (20-hr)*42.6);
  }
  else {
    background(0);//20-0 night
  }
}

void lineDot() {
  int sec=second();
  //straight line & black dot
  if (sec>4 && sec<6) {
    stroke(255, 237, 0);
    fill(255, 237, 0);
    ellipse(177, 199, 185-168, 207-192);
    line(176, 206, 151, 245);
    stroke(0);
    fill(1);
    //2
    ellipse(127, 177, 134-120, 184-170);
    line(127, 184, 148, 241);
    //3
    ellipse(101, 202, 106-95, 218-204);
    line(101, 202, 151, 245);
    //4
    ellipse(85, 258, 92-78, 264-250);
    line(89, 255, 151, 245);
    //5
    ellipse(145, 294, 153-138, 301-288);
    line(147, 291, 151, 245);
  }
  else if (sec>33 && sec<35) {
    stroke(0);
    fill(1);
    ellipse(177, 199, 185-168, 207-192);
    line(176, 206, 151, 245);

    //2
    ellipse(127, 177, 134-120, 184-170);
    line(127, 184, 148, 241);
    //3
    ellipse(101, 202, 106-95, 218-204);
    line(101, 202, 151, 245);
    //4
    ellipse(85, 258, 92-78, 264-250);
    line(89, 255, 151, 245);
    //5
    stroke(255, 237, 0);
    fill(255, 237, 0);
    ellipse(145, 294, 153-138, 301-288);
    line(147, 291, 151, 245);
    stroke(0);
    fill(1);
  }
  else if (sec>43 && sec<45) {
    stroke(0);
    fill(1);
    ellipse(177, 199, 185-168, 207-192);
    line(176, 206, 151, 245);
    //2
    ellipse(127, 177, 134-120, 184-170);
    line(127, 184, 148, 241);
    //3
    ellipse(101, 202, 106-95, 218-204);
    line(101, 202, 151, 245);
    //4
    stroke(255, 237, 0);
    fill(255, 237, 0);
    ellipse(85, 258, 92-78, 264-250);
    line(89, 255, 151, 245);
    //5
    stroke(0);
    fill(1);
    ellipse(145, 294, 153-138, 301-288);
    line(147, 291, 151, 245);
  }
  else if (sec>50 && sec<52) {
    stroke(0);
    fill(1);
    ellipse(177, 199, 185-168, 207-192);
    line(176, 206, 151, 245);
    //2
    ellipse(127, 177, 134-120, 184-170);
    line(127, 184, 148, 241);
    //3
    stroke(255, 237, 0);
    fill(255, 237, 0);
    ellipse(101, 202, 106-95, 218-204);
    line(101, 202, 151, 245);
    //4
    stroke(0);
    fill(1);
    ellipse(85, 258, 92-78, 264-250);
    line(89, 255, 151, 245);
    //5
    ellipse(145, 294, 153-138, 301-288);
    line(147, 291, 151, 245);
  }
  else if (sec>52 && sec<54) {
    stroke(0);
    fill(1);
    ellipse(177, 199, 185-168, 207-192);
    line(176, 206, 151, 245);
    stroke(255, 237, 0);
    fill(255, 237, 0);
    //2
    ellipse(127, 177, 134-120, 184-170);
    line(127, 184, 148, 241);
    //3
    stroke(0);
    fill(1);
    ellipse(101, 202, 106-95, 218-204);
    line(101, 202, 151, 245);
    //4
    ellipse(85, 258, 92-78, 264-250);
    line(89, 255, 151, 245);
    //5
    ellipse(145, 294, 153-138, 301-288);
    line(147, 291, 151, 245);
  }

  else {
    stroke(0);
    fill(1);
    //1
    ellipse(177, 199, 185-168, 207-192);
    line(176, 206, 151, 245);
    //2
    ellipse(127, 177, 134-120, 184-170);
    line(127, 184, 148, 241);
    //3
    ellipse(101, 202, 106-95, 218-204);
    line(101, 202, 151, 245);
    //4
    ellipse(85, 258, 92-78, 264-250);
    line(89, 255, 151, 245);
    //5
    ellipse(145, 294, 153-138, 301-288);
    line(147, 291, 151, 245);
  }
}

void secRotateDot() {
  int sec=second();
  pushMatrix();
  int x1=255;
  int y1=398;
  translate(x1, y1);
  rotate(radians(6*sec));
  ellipse(255-x1, 398-y1, 262-247, 405-391);
  ellipse(210-x1, 392-y1, 217-203, 398-384);
  line(255-x1, 398-y1, 210-x1, 392-y1);
  popMatrix();
  //7
  pushMatrix();
  int x2=243;
  int y2=743;
  translate(x2, y2);
  rotate(radians(6*sec));
  ellipse(243-x2, 743-y2, 249-236, 748-737);
  ellipse(226-x2, 780-y2, 236-215, 788-769);
  //(243,743)
  line(243-x2, 743-y2, 226-x2, 780-y2);
  popMatrix();
}
void secColorChangeCircle() {
  int sec=second();
  float cl1=4.25*sec;
  fill(cl1);
  //8
  ellipse(209, 610, 217-200, 617-601);
  //9
  ellipse(542, 199, 558-525, 214-183);
  //10
  ellipse(510, 268, 518-502, 275-258);
  //11
  ellipse(552, 732, 578-523, 760-701);
  //12
  ellipse(504, 766, 510-498, 771-757);
  //13
  ellipse(184, 144, 215-152, 177-111);
  ellipse(309, 774, 51, 50);
}
void doubleTri() {
  //double triangle
  //1
  if (sec>55 && sec<1) {
    int av=48;
    int bv=157;
    pushMatrix();
    translate(av, bv);
    rotate(theta1);
    scale(tan(theta1));
    fill(0);
    beginShape();
    vertex(48-av, 157-bv);
    vertex(30-av, 127-bv);
    vertex(62-av, 127-bv);
    vertex(48-av, 157-bv);
    vertex(36-av, 187-bv);
    vertex(67-av, 185-bv);
    endShape(CLOSE);
    theta1 +=1;
    popMatrix();
  }
  else {
    fill(0);
    beginShape();
    vertex(48, 157);
    vertex(30, 127);
    vertex(62, 127);
    vertex(48, 157);
    vertex(36, 187);
    vertex(67, 185);
    endShape(CLOSE);

    //2
    beginShape();
    vertex(22, 418);
    vertex(52, 418);
    vertex(41, 450);
    vertex(20, 482);
    vertex(62, 478);
    endShape(CLOSE);
    //3
    beginShape();
    vertex(55, 590);
    vertex(84, 578);
    vertex(53, 646);
    vertex(91, 636);
    endShape(CLOSE);
    //4
    beginShape();
    vertex(57, 715);
    vertex(83, 716);
    vertex(52, 767);
    vertex(88, 761);
    endShape(CLOSE);
    //5
    beginShape();
    vertex(368, 204);
    vertex(389, 202);
    vertex(364, 242);
    vertex(405, 237);
    endShape(CLOSE);
    //6
    beginShape();
    vertex(415, 520);
    vertex(437, 507);
    vertex(440, 579);
    vertex(465, 575);
    vertex(477, 557);
    endShape(CLOSE);
    //7
    beginShape();
    vertex(569, 326);
    vertex(585, 325);
    vertex(570, 356);
    vertex(588, 352);
    endShape(CLOSE);
    //8
    beginShape();
    vertex(583, 447);
    vertex(600, 445);
    vertex(578, 476);
    vertex(606, 476);
    endShape(CLOSE);
  }
}

void doulbeTri() {
  fill(0);
  beginShape();
  vertex(48, 157);
  vertex(30, 127);
  vertex(62, 127);
  vertex(48, 157);
  vertex(36, 187);
  vertex(67, 185);
  endShape(CLOSE);

  //2
  beginShape();
  vertex(22, 418);
  vertex(52, 418);
  vertex(41, 450);
  vertex(20, 482);
  vertex(62, 478);
  endShape(CLOSE);
  //3
  beginShape();
  vertex(55, 590);
  vertex(84, 578);
  vertex(53, 646);
  vertex(91, 636);
  endShape(CLOSE);
  //4
  beginShape();
  vertex(57, 715);
  vertex(83, 716);
  vertex(52, 767);
  vertex(88, 761);
  endShape(CLOSE);
  //5
  beginShape();
  vertex(368, 204);
  vertex(389, 202);
  vertex(364, 242);
  vertex(405, 237);
  endShape(CLOSE);
  //6
  beginShape();
  vertex(415, 520);
  vertex(437, 507);
  vertex(440, 579);
  vertex(465, 575);
  vertex(477, 557);
  endShape(CLOSE);
  //7
  beginShape();
  vertex(569, 326);
  vertex(585, 325);
  vertex(570, 356);
  vertex(588, 352);
  endShape(CLOSE);
  //8
  beginShape();
  vertex(583, 447);
  vertex(600, 445);
  vertex(578, 476);
  vertex(606, 476);
  endShape(CLOSE);
}



