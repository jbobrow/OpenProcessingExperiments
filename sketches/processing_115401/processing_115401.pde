
// 20131002_Assignment_painting Miro's work
//by HorusWang

void setup() {
  size(600, 680);
  background(141, 103, 80);
}

void draw() {

  //Upper circles 
  fill(0);
  ellipse(40, 36, 30, 26);
  ellipse(73, 78, 16, 14);
  ellipse(117, 72, 13, 14);
  ellipse(243, 39, 14, 12);
  ellipse(490, 15, 13, 12);
  ellipse(545, 13, 15, 13);


  //Rightside cluster of circles 
  ellipse(496, 79, 6, 6);
  ellipse(521, 47, 8, 8);
  ellipse(565, 47, 6, 6);
  ellipse(583, 74, 8, 7);
  ellipse(565, 124, 10, 9);
  ellipse(519, 179, 25, 23);
  ellipse(527, 251, 45, 44);
  ellipse(543, 329, 46, 43);
  ellipse(562, 391, 28, 26);
  ellipse(571, 506, 34, 30);
  ellipse(565, 600, 24, 22);
  ellipse(547, 658, 20, 22);

  //Rightside two circles

  ellipse(565, 185, 18, 18);
  ellipse(561, 270, 12, 11);

  //Upper lines & curve
  line(45, 40, 235, 41);
  beginShape();
  vertex(81, 40);
  bezierVertex(90, 22, 116, 20, 116, 40);
  endShape();
  //left
  noFill();
  beginShape();
  curveVertex(81, 40);
  curveVertex(81, 40);
  curveVertex(78, 52);
  curveVertex(78, 67);
  curveVertex(78, 78);
  curveVertex(78, 78);
  endShape();
  //right
  noFill();
  beginShape();
  curveVertex(116, 40);
  curveVertex(116, 40);
  curveVertex(118, 48);
  curveVertex(119, 56);
  curveVertex(119, 62);
  curveVertex(118, 72);
  curveVertex(118, 72);
  endShape();
  line(490, 15, 545, 13);

  //Rightside cluster of line
  line(496, 79, 541, 91);
  line(521, 47, 541, 91);
  line(565, 47, 541, 91);
  line(583, 74, 541, 91);
  line(565, 124, 541, 91);
  noFill();
  beginShape();
  curveVertex(541, 91);
  curveVertex(541, 91);
  curveVertex(525, 125);
  curveVertex(520, 149);
  curveVertex(519, 179);
  curveVertex(522, 209);
  curveVertex(527, 251);
  curveVertex(536, 287);
  curveVertex(543, 328);
  curveVertex(549, 350);
  curveVertex(555, 379);
  curveVertex(562, 414);
  curveVertex(569, 441);
  curveVertex(573, 476);
  curveVertex(574, 504);
  curveVertex(574, 534);
  curveVertex(571, 558);
  curveVertex(562, 602);
  curveVertex(556, 627);
  curveVertex(546, 657);
  curveVertex(537, 676);
  curveVertex(526, 680);
  curveVertex(526, 680);
  endShape();

  //line of two circle
  line(565, 185, 561, 270);


  // "*" symbols
  stroke(0);
  strokeWeight(0.5);
  // (1)
  line(78, 145, 174, 140);
  line(125, 103, 117, 183);
  line(101, 114, 138, 170);
  line(156, 106, 88, 181);
  //(2)
  line(180, 119, 214, 115);
  line(196, 101, 194, 148);
  line(184, 101, 209, 139);
  line(209, 103, 183, 132);
  //(3)
  line(258, 26, 310, 36);
  line(270, 4, 296, 59);
  line(303, 16, 256, 56);
  line(288, 10, 277, 63);
  //(4)
  line(309, 145, 354, 149);
  line(315, 125, 342, 174);
  line(353, 125, 303, 167);
  line(330, 122, 321, 171);
  //(5)
  line(380, 9, 412, 3);
  line(389, 0, 408, 17);
  line(400, 0, 381, 25);
  line(394, 0, 394, 24);
  //(6)
  line(27, 352, 60, 355);
  line(35, 342, 55, 371);
  line(67, 341, 28, 363);
  line(49, 338, 41, 371);
  //(7)
  line(268, 349, 308, 348);
  line(275, 334, 306, 373);
  line(310, 329, 267, 364);
  line(289, 327, 282, 375);
  //(8)
  line(247, 416, 278, 413);
  line(252, 405, 277, 428);
  line(274, 402, 246, 429);
  line(262, 399, 260, 433);
  //(9)
  line(205, 623, 244, 625);
  line(212, 617, 237, 644);
  line(263, 604, 208, 634);
  line(226, 598, 221, 641);
  //(10)
  line(283, 569, 323, 563);
  line(288, 549, 319, 587);
  line(315, 550, 284, 586);
  line(301, 543, 300, 586);
  //(11)
  line(459, 248, 493, 241);
  line(461, 230, 487, 254);
  line(492, 228, 461, 260);
  line(475, 227, 476, 262);
  //(12)
  line(441, 493, 483, 493);
  line(450, 476, 473, 517);
  line(479, 476, 438, 513);
  line(462, 473, 456, 516);

  //Leftside - White Part
  fill(255);
  noStroke();
  beginShape();
  curveVertex(0, 89);
  curveVertex(0, 89);
  curveVertex(37, 113);
  curveVertex(56, 142);
  curveVertex(63, 158);
  curveVertex(74, 191);
  curveVertex(76, 212);
  curveVertex(76, 234);
  curveVertex(75, 248);
  curveVertex(66, 271);
  curveVertex(58, 285);
  curveVertex(50, 297);
  curveVertex(38, 313);
  curveVertex(22, 330);
  curveVertex(0, 346);
  curveVertex(0, 346);
  endShape();

  //leftside - some shadow

  //(1)
  fill(0);
  beginShape();
  curveVertex(0, 54);
  curveVertex(0, 54);
  curveVertex(5, 71);
  curveVertex(3, 84);
  curveVertex(0, 96);
  curveVertex(0, 96);
  endShape();

  //(2)
  beginShape();
  curveVertex(0, 183);
  curveVertex(0, 183);
  curveVertex(4, 184);
  curveVertex(7, 190);
  curveVertex(8, 197);
  curveVertex(6, 203);
  curveVertex(0, 212);
  curveVertex(0, 212);
  endShape();

  //(3)
  beginShape();
  curveVertex(0, 234);
  curveVertex(0, 234);
  curveVertex(4, 241);
  curveVertex(5, 246);
  curveVertex(4, 250);
  curveVertex(0, 258);
  curveVertex(0, 258 );
  endShape();

  //Red circle
  fill(177, 13, 25);
  ellipse(175, 255, 136, 134);

  //The Tower (Black Part)
  fill(0);
  stroke(0);
  strokeWeight(1);
  beginShape();
  vertex(0, 459);
  vertex(0, 459);
  vertex(65, 386);
  vertex(127, 303);
  vertex(215, 194);
  vertex(247, 157);
  vertex(292, 93);
  vertex(321, 61);
  vertex(344, 38);
  vertex(352, 29);
  vertex(365, 15); //Top
  vertex(314, 101);
  vertex(272, 171);
  vertex(236, 223);
  vertex(175, 322);
  curveVertex(98, 440);
  curveVertex(82, 469);
  curveVertex(71, 491);
  curveVertex(60, 515);
  curveVertex(54, 536);
  vertex(48, 562);
  curveVertex(31, 564);
  curveVertex(13, 565);
  curveVertex(0, 561);
  curveVertex(0, 561);
  endShape();

  //central blue circle
  fill(19, 28, 98);
  ellipse(194, 355, 113, 116);

  //littele blue ball(1)
  noStroke();
  ellipse(98, 337, 32, 32);

  //little blue ball(2)
  stroke(0);
  strokeWeight(1);
  ellipse(35, 311, 38, 32);

  // yellow bottom of tower
  noStroke();
  fill(239, 205, 20);
  beginShape();
  curveVertex(0, 379);
  curveVertex(0, 379);
  curveVertex(11, 378);
  curveVertex(32, 378);
  curveVertex(53, 382);
  vertex(64, 386);
  vertex(0, 459);
  endShape();

  //red bottom of tower
  fill(177, 13, 25);
  beginShape();
  curveVertex(116, 419);
  curveVertex(116, 419);
  curveVertex(121, 432);
  curveVertex(127, 453);
  curveVertex(131, 470);
  curveVertex(127, 490);
  curveVertex(118, 509);
  curveVertex(103, 533);
  curveVertex(86, 547);
  curveVertex(50, 564);
  curveVertex(58, 528);
  curveVertex(70, 494);
  curveVertex(88, 458);
  curveVertex(116, 419);
  curveVertex(116, 419);
  endShape();

  // left-down figure
  //curve
  noFill();
  stroke(0);
  strokeWeight(1);
  beginShape();
  vertex(48, 563);
  bezierVertex(47, 587, 49, 633, 57, 679);
  endShape();
  //little ball
  //blue part
  fill(19, 28, 98);
  noStroke();
  beginShape();
  curveVertex(50, 634);
  curveVertex(50, 634);
  curveVertex(38, 639);
  curveVertex(36, 643);
  curveVertex(35, 648);
  curveVertex(38, 654);
  curveVertex(43, 659);
  curveVertex(54, 660);
  curveVertex(54, 660);
  endShape();
  //black part
  fill(0);
  beginShape();
  curveVertex(50, 634);
  curveVertex(50, 634);
  curveVertex(60, 635);
  curveVertex(66, 640);
  curveVertex(69, 645);
  curveVertex(67, 653);
  curveVertex(62, 658);
  curveVertex(54, 660);
  curveVertex(54, 660);
  endShape();
  //2 short lines
  noFill();
  stroke(0);
  strokeWeight(0.5);
  line(6, 628, 0, 633);
  line(0, 656, 9, 654);
  //black ellipse
  fill(0);
  ellipse(110, 607, 42, 33);
  //curve
  noFill();
  stroke(0);
  strokeWeight(0.5);
  beginShape();
  vertex(88, 679);
  bezierVertex(92, 664, 106, 656, 127, 680);
  endShape();


  // Curve from upper-left and Ball
  noFill();
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  vertex(157, 11);
  bezierVertex(148, 41, 150, 64, 160, 78);
  bezierVertex(175, 83, 206, 71, 218, 70);
  bezierVertex(225, 73, 228, 87, 230, 122);
  bezierVertex(236, 142, 247, 156, 271, 171);
  bezierVertex(283, 175, 321, 182, 334, 188);//
  bezierVertex(343, 197, 355, 221, 364, 264);//
  endShape();
  //ball
  fill(0);
  beginShape();
  curveVertex(361, 255);
  curveVertex(361, 255);
  curveVertex(355, 260);
  curveVertex(353, 267);
  curveVertex(355, 273);
  curveVertex(361, 276);
  curveVertex(368, 274);
  curveVertex(373, 269);
  curveVertex(375, 266);
  curveVertex(376, 261);
  curveVertex(375, 256);
  curveVertex(368, 253);
  curveVertex(361, 255);
  curveVertex(361, 255);
  endShape();


  //Central Curve
  //black ball
  fill(0);
  ellipse(405, 163, 20, 20);
  //blue&black ball
  //blue part
  fill(19, 28, 98);
  stroke(0);
  strokeWeight(0.5);
  beginShape();
  curveVertex(387, 189);//same as curve point
  curveVertex(387, 189);
  curveVertex(379, 186);
  curveVertex(370, 189);
  curveVertex(366, 193);
  curveVertex(363, 199);
  curveVertex(365, 204);
  curveVertex(369, 209);
  curveVertex(369, 209);//same as curve point
  endShape();
  //black part
  fill(0);
  noStroke();
  beginShape();
  curveVertex(387, 189);//same as curve point
  curveVertex(387, 189);
  curveVertex(390, 194);
  curveVertex(392, 200);
  curveVertex(390, 207);
  curveVertex(386, 211);
  curveVertex(380, 213);
  curveVertex(373, 212);
  curveVertex(369, 209);
  curveVertex(369, 209);//same as curve point
  endShape();

  //Curve
  noFill();
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  vertex(405, 163);
  bezierVertex(394, 180, 387, 189, 369, 209);
  bezierVertex(355, 221, 328, 243, 299, 270);//
  bezierVertex(285, 284, 248, 326, 226, 352);//
  bezierVertex(212, 376, 203, 395, 197, 413);//
  bezierVertex(189, 431, 177, 461, 169, 492);//
  bezierVertex(160, 531, 159, 570, 161, 599);
  bezierVertex(172, 629, 181, 643, 189, 654);//
  bezierVertex(204, 665, 229, 680, 229, 680);
  endShape();

  //bottom ball of this curve
  //blue part
  fill(19, 28, 98);
  noStroke();
  beginShape();
  curveVertex(240, 680);
  curveVertex(240, 680);
  curveVertex(226, 678);
  curveVertex(205, 666);
  curveVertex(190, 654);
  curveVertex(195, 652);
  curveVertex(203, 650);
  curveVertex(219, 651);
  curveVertex(228, 653);
  curveVertex(232, 658);
  curveVertex(236, 664);
  curveVertex(239, 674);
  curveVertex(240, 680);
  curveVertex(240, 680);
  endShape();//draw some weird.....
  //black part
  fill(0);
  noStroke();
  beginShape();
  curveVertex(230, 680);
  curveVertex(230, 680);
  curveVertex(207, 668);
  curveVertex(190, 654);
  curveVertex(185, 657);
  curveVertex(181, 660);
  curveVertex(177, 663);
  curveVertex(174, 666);
  curveVertex(171, 670);
  curveVertex(169, 680);
  curveVertex(230, 680);
  curveVertex(230, 680);
  endShape();//draw some weird.....

  //The circle crossred part andcurve
  //blue parrt
  fill(19, 28, 98);
  noStroke();
  beginShape();
  curveVertex(126, 492);//point1
  curveVertex(126, 492);
  curveVertex(120, 506);
  curveVertex(114, 518);
  curveVertex(108, 527);
  curveVertex(99, 537);
  curveVertex(93, 542);
  curveVertex(86, 549);//point2
  curveVertex(94, 559);
  curveVertex(110, 568);
  curveVertex(127, 572);
  curveVertex(142, 574);
  curveVertex(159, 571);//point3
  curveVertex(160, 553);
  curveVertex(162, 531);
  curveVertex(164, 513);
  curveVertex(167, 501);
  curveVertex(169, 491);//point4
  curveVertex(153, 488);
  curveVertex(150, 489);
  curveVertex(139, 490);
  curveVertex(126, 491);
  curveVertex(126, 491);
  endShape();

  //left-black part
  fill(0);
  beginShape();
  curveVertex(126, 492);//point1
  curveVertex(126, 492);
  curveVertex(120, 506);
  curveVertex(114, 518);
  curveVertex(108, 527);
  curveVertex(99, 537);
  curveVertex(93, 542);
  curveVertex(86, 549);//point2
  curveVertex(84, 542);
  curveVertex(83, 533);
  curveVertex(86, 522);
  curveVertex(91, 512);
  curveVertex(96, 506);
  curveVertex(104, 499);
  curveVertex(115, 493);
  curveVertex(126, 491);
  curveVertex(126, 491);
  endShape();
  //right-black part
  fill(0);
  beginShape();
  curveVertex(159, 571);//point3
  curveVertex(159, 571);
  curveVertex(160, 553);
  curveVertex(162, 531);
  curveVertex(164, 513);
  curveVertex(167, 501);
  curveVertex(169, 491);//point4
  curveVertex(175, 495);
  curveVertex(184, 502);
  curveVertex(190, 511);
  curveVertex(193, 524);
  curveVertex(192, 536);
  curveVertex(188, 545);
  curveVertex(184, 552);
  curveVertex(181, 558);
  curveVertex(177, 561);
  curveVertex(173, 564);
  curveVertex(159, 571);
  curveVertex(159, 571);
  endShape();


  //black ball below yellow eye
  fill(0);
  noStroke();  
  beginShape();
  curveVertex(431, 174);
  curveVertex(431, 174);
  curveVertex(425, 182);
  curveVertex(423, 194);
  curveVertex(426, 206);
  curveVertex(435, 216);
  curveVertex(448, 221);
  curveVertex(458, 220);
  curveVertex(470, 215);
  curveVertex(481, 204);
  curveVertex(483, 193);
  curveVertex(482, 183);
  curveVertex(480, 175);
  curveVertex(475, 166);
  curveVertex(461, 161);
  curveVertex(451, 162);
  curveVertex(444, 165);
  curveVertex(437, 168);
  curveVertex(437, 168);
  endShape();

  //strange Green half-circle in cluster
  fill(109, 137, 86);
  noStroke();
  beginShape();
  curveVertex(539, 307);
  curveVertex(539, 307);
  curveVertex(538, 307);
  curveVertex(536, 307);
  curveVertex(535, 308);
  curveVertex(534, 309);
  curveVertex(533, 310);
  curveVertex(531, 310);
  curveVertex(530, 311);
  curveVertex(527, 313);
  curveVertex(525, 317);
  curveVertex(522, 320);
  curveVertex(520, 325);
  curveVertex(518, 332);
  curveVertex(518, 337);
  curveVertex(522, 343);
  curveVertex(526, 347);
  curveVertex(531, 350);
  curveVertex(539, 351);
  curveVertex(546, 351);
  curveVertex(549, 351);
  curveVertex(549, 351);
  endShape();
  
  beginShape();
  curveVertex(243,527);
  curveVertex(243,527);
  curveVertex(291,477);
  curveVertex(274,473);
  curveVertex(242,479);
  curveVertex(222,485);
  curveVertex(208,494);
  curveVertex(208,494);
  endShape();

  //blue eye's curve
  noFill();
  stroke(0);
  strokeWeight(0.6);
  beginShape();
  vertex(384, 271);
  bezierVertex(390, 281, 407, 307, 436, 341);
  bezierVertex(471, 379, 496, 412, 510, 438);
  bezierVertex(516, 460, 514, 504, 508, 535);
  bezierVertex(499, 563, 490, 577, 480, 590);
  vertex(459, 610);
  endShape();

  //little curve(1)
  noFill();
  stroke(0);
  strokeWeight(0.6);
  beginShape();
  vertex(390, 281);
  bezierVertex(413, 260, 435, 249, 450, 244);
  endShape();
  //little curve(2)
  noFill();
  stroke(0);
  strokeWeight(0.6);
  beginShape();
  vertex(407, 307);
  bezierVertex(432, 291, 455, 281, 486, 275);
  endShape();
  //little curve(3)
  noFill();
  stroke(0);
  strokeWeight(0.6);
  beginShape();
  vertex(436, 341);
  bezierVertex(459, 328, 482, 320, 505, 317);
  endShape();
  //little curve(4)
  noFill();
  stroke(0);
  strokeWeight(0.6);
  beginShape();
  vertex(471, 379);
  bezierVertex(487, 371, 509, 366, 530, 369);
  endShape();
  //little curve(5)
  noFill();
  stroke(0);
  strokeWeight(0.6);
  beginShape();
  vertex(496, 412);
  bezierVertex(511, 407, 527, 406, 545, 411);
  endShape();   
  //little curve(6)
  noFill();
  stroke(0);
  strokeWeight(0.6);
  beginShape();
  vertex(516, 460);
  bezierVertex(528, 464, 540, 475, 550, 491);
  endShape();
  //little curve(6)
  noFill();
  stroke(0);
  strokeWeight(0.6);
  beginShape();
  vertex(514, 504);
  bezierVertex(533, 524, 546, 550, 554, 572);
  endShape();
  //small ball
  //blue part
  fill(19, 28, 98);
  noStroke();
  beginShape();
  curveVertex(499, 563);
  curveVertex(499, 563);
  curveVertex(487, 559);
  curveVertex(479, 562);
  curveVertex(472, 568);
  curveVertex(470, 576);
  curveVertex(474, 586);
  curveVertex(480, 590);
  curveVertex(480, 590);
  endShape();
  //black part
  fill(0);
  noStroke();
  beginShape();
  curveVertex(499, 563);
  curveVertex(499, 563);
  curveVertex(505, 567);
  curveVertex(508, 578);
  curveVertex(506, 588);
  curveVertex(496, 594);
  curveVertex(487, 593);
  curveVertex(480, 590);
  curveVertex(480, 590);
  endShape();

  //little Mountain
  fill(0);
  noStroke();
  beginShape();
  curveVertex(497, 680);
  curveVertex(497, 680);
  curveVertex(481, 651);
  curveVertex(458, 609);
  curveVertex(448, 593);
  curveVertex(440, 587);
  curveVertex(432, 587);
  curveVertex(424, 591);
  curveVertex(416, 599);
  curveVertex(397, 634);
  curveVertex(371, 680);
  curveVertex(371, 680);
  endShape();

  //Yellow Eye
  //Layout(1)-black&biggest
  fill(0);
  noStroke();
  beginShape();
  curveVertex(424, 30);
  curveVertex(424, 30);
  curveVertex(410, 33);
  curveVertex(400, 38);
  curveVertex(389, 44);
  curveVertex(380, 52);
  curveVertex(372, 61);
  curveVertex(364, 68);
  curveVertex(356, 75);
  curveVertex(346, 82);
  curveVertex(337, 86);
  curveVertex(330, 89);
  curveVertex(327, 92);
  curveVertex(325, 96);
  curveVertex(328, 102);
  curveVertex(336, 106);
  curveVertex(351, 107);
  curveVertex(366, 111);
  curveVertex(376, 116);
  curveVertex(386, 126);
  curveVertex(394, 135);
  curveVertex(405, 143);
  curveVertex(415, 145);
  curveVertex(426, 147);
  curveVertex(441, 145);
  curveVertex(456, 139);
  curveVertex(466, 133);
  curveVertex(476, 120);
  curveVertex(481, 108);
  curveVertex(483, 97);
  curveVertex(483, 84);
  curveVertex(482, 74);
  curveVertex(476, 60);
  curveVertex(469, 49);
  curveVertex(461, 42);
  curveVertex(451, 36);
  curveVertex(440, 32);
  curveVertex(430, 30);
  curveVertex(424, 30);
  curveVertex(424, 30);
  endShape();

  //Layout(2)-YellowPart
  fill(237, 187, 12);
  noStroke();
  beginShape();
  curveVertex(399, 65);
  curveVertex(399, 65);
  curveVertex(396, 70);
  curveVertex(392, 77);
  curveVertex(390, 85);
  curveVertex(389, 97);
  curveVertex(390, 105);
  curveVertex(395, 114);
  curveVertex(405, 122);
  curveVertex(416, 126);
  curveVertex(431, 125);
  curveVertex(445, 119);
  curveVertex(452, 113);
  curveVertex(458, 101);
  curveVertex(461, 92);
  curveVertex(462, 82);
  curveVertex(462, 69);
  curveVertex(461, 63);
  curveVertex(457, 59);
  curveVertex(452, 56);
  curveVertex(440, 55);
  curveVertex(424, 56);
  curveVertex(411, 60);
  curveVertex(399, 65);
  curveVertex(399, 65);
  endShape();  

  //Layout(3)-central-black 
  fill(0);
  noStroke();
  beginShape();
  curveVertex(424, 69);
  curveVertex(424, 69);
  curveVertex(414, 72);
  curveVertex(406, 79);
  curveVertex(402, 89);
  curveVertex(405, 99);
  curveVertex(411, 106);
  curveVertex(420, 110);
  curveVertex(431, 109);
  curveVertex(437, 105);
  curveVertex(442, 98);
  curveVertex(445, 91);
  curveVertex(444, 82);
  curveVertex(441, 75);
  curveVertex(438, 72);
  curveVertex(432, 69);
  curveVertex(424, 69);
  curveVertex(424, 69);
  endShape();
  //little curve with yellow eye
  noFill();
  stroke(0);
  strokeWeight(1);
  beginShape();
  vertex(480, 83);
  bezierVertex(487, 98, 496, 109, 514, 111);
  endShape();

  //Blue Eye
  //black part
  fill(0);
  noStroke();
  beginShape();
  curveVertex(369, 365);
  curveVertex(369, 365);
  curveVertex(377, 369);
  curveVertex(384, 373);
  curveVertex(388, 377);
  curveVertex(391, 382);
  curveVertex(395, 387);
  curveVertex(400, 393);
  curveVertex(407, 398);
  curveVertex(414, 400);
  curveVertex(425, 400);
  curveVertex(437, 397);
  curveVertex(445, 392);
  curveVertex(451, 385);
  curveVertex(452, 374);
  curveVertex(450, 368);
  curveVertex(447, 363);
  curveVertex(448, 367);
  curveVertex(447, 378);
  curveVertex(443, 381);
  curveVertex(439, 384);
  curveVertex(430, 387);
  curveVertex(417, 386);
  curveVertex(405, 382);
  curveVertex(399, 378);
  curveVertex(391, 372);
  curveVertex(386, 368);
  curveVertex(382, 366);
  curveVertex(378, 364);
  curveVertex(375, 363);
  curveVertex(371, 362);
  curveVertex(369, 365);
  curveVertex(369, 365);
  endShape();
  //White Part
  fill(255);
  noStroke();
  beginShape();
  curveVertex(447, 363);
  curveVertex(447, 363);
  curveVertex(448, 367);
  curveVertex(447, 378);
  curveVertex(443, 381);
  curveVertex(439, 384);
  curveVertex(430, 385);
  curveVertex(417, 386);
  curveVertex(405, 382);
  curveVertex(399, 378);
  curveVertex(391, 372);
  curveVertex(386, 368);
  curveVertex(382, 366);
  curveVertex(378, 364);
  curveVertex(375, 365);
  curveVertex(371, 363);
  vertex(370, 361);//
  curveVertex(374, 360);
  curveVertex(380, 358);
  curveVertex(388, 356);
  curveVertex(388, 354);
  curveVertex(402, 353);//
  curveVertex(409, 352);
  curveVertex(417, 351);
  curveVertex(423, 352);
  curveVertex(427, 353);//
  curveVertex(435, 355);
  curveVertex(441, 357);
  curveVertex(442, 359);
  curveVertex(447, 363);
  curveVertex(447, 363);
  endShape();

  //blue part
  fill(19, 28, 98);
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  curveVertex(402, 353);//
  curveVertex(409, 352);
  curveVertex(417, 351);
  curveVertex(423, 352);
  curveVertex(427, 353);//
  curveVertex(429, 354);
  curveVertex(433, 361);
  curveVertex(432, 364);
  curveVertex(433, 367);
  curveVertex(430, 373);
  curveVertex(428, 375);
  curveVertex(425, 376); 
  curveVertex(421, 379);
  curveVertex(414, 380);
  curveVertex(408, 378); 
  curveVertex(402, 373);
  curveVertex(399, 369);
  curveVertex(398, 365);  
  curveVertex(399, 358);
  curveVertex(400, 354);
  curveVertex(402, 353);
  curveVertex(402, 353); 
  endShape();

  //Central Black
  fill(0);
  noStroke();
  beginShape();
  curveVertex(416, 357);
  curveVertex(416, 357);
  curveVertex(413, 358); 
  curveVertex(410, 361);
  curveVertex(408, 365);
  curveVertex(410, 368); 
  curveVertex(413, 370);
  curveVertex(416, 371);
  curveVertex(420, 369);
  curveVertex(421, 367);
  curveVertex(422, 365);
  curveVertex(421, 361); 
  curveVertex(419, 358);
  curveVertex(416, 357);
  curveVertex(416, 357); 
  endShape();

  //eyelash
  noFill();
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  vertex(451, 384);
  bezierVertex(456, 387, 461, 390, 468, 390);
  endShape();
  beginShape();
  vertex(446, 392);
  bezierVertex(445, 404, 450, 409, 459, 416);
  endShape();
  beginShape();
  vertex(425, 400);
  bezierVertex(423, 407, 425, 414, 430, 422);
  endShape();

  //blue eye curve(1)
  noFill();
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  vertex(387, 384);
  bezierVertex(378, 390, 371, 392, 360, 393);
  bezierVertex(352, 393, 345, 389, 341, 383);
  bezierVertex(340, 371, 344, 359, 353, 337);
  bezierVertex(360, 324, 370, 304, 385, 273);
  endShape();
  //blue-ball of curve(1)
  fill(19, 28, 98);
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  curveVertex(360, 324);
  curveVertex(360, 324);
  curveVertex(369, 325);
  curveVertex(373, 322);
  curveVertex(376, 315);
  curveVertex(375, 310);
  curveVertex(370, 304);
  curveVertex(370, 304);
  endShape();
  //black-ball of curve(1)
  fill(0);
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  curveVertex(360, 324);
  curveVertex(360, 324);
  curveVertex(355, 320);
  curveVertex(352, 312);
  curveVertex(354, 307);
  curveVertex(359, 304);
  curveVertex(364, 302);
  curveVertex(370, 304);
  curveVertex(370, 304);
  endShape();

  //curve(2)
  noFill();
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  vertex(387, 375);
  bezierVertex(387, 375, 387, 384, 388, 394);
  bezierVertex(387, 405, 383, 422, 375, 439);
  bezierVertex(349, 458, 321, 481, 296, 504);
  bezierVertex(276, 523, 261, 542, 250, 556);
  bezierVertex(245, 570, 242, 594, 246, 613);
  bezierVertex(258, 627, 276, 638, 299, 645);
  bezierVertex(325, 646, 366, 640, 397, 635);
  endShape();

  //left-black
  fill(0);
  noStroke();
  beginShape();
  curveVertex(387, 405);
  curveVertex(387, 405);
  curveVertex(375, 409);
  curveVertex(358, 416);
  curveVertex(346, 420);
  curveVertex(334, 423);
  curveVertex(325, 423);
  curveVertex(316, 421);
  curveVertex(309, 416);
  curveVertex(307, 412);
  curveVertex(308, 396);//  
  curveVertex(303, 400);
  curveVertex(301, 403);
  curveVertex(299, 407);
  curveVertex(297, 415);
  curveVertex(299, 425);
  curveVertex(308, 433);
  curveVertex(324, 438);
  curveVertex(347, 438);
  curveVertex(360, 437);
  curveVertex(375, 439);
  curveVertex(383, 422);
  curveVertex(387, 405);
  curveVertex(387, 405);
  endShape();
  //right-black
  fill(0);
  noStroke();
  beginShape();
  curveVertex(410, 428);
  curveVertex(410, 428);
  curveVertex(414, 433);
  curveVertex(424, 441);
  curveVertex(434, 444);
  curveVertex(447, 442);
  curveVertex(461, 436);//
  curveVertex(454, 446);
  curveVertex(448, 450);
  curveVertex(440, 455);
  curveVertex(432, 456);
  curveVertex(421, 453);
  curveVertex(412, 451);
  curveVertex(402, 446);
  curveVertex(406, 437);
  curveVertex(406, 437);
  endShape();


  //central-red
  fill(177, 13, 25);
  noStroke();
  beginShape();
  curveVertex(387, 405);
  curveVertex(387, 405);
  curveVertex(383, 422);
  curveVertex(375, 439);
  curveVertex(389, 441);
  curveVertex(400, 446);
  curveVertex(409, 428);
  curveVertex(409, 428);
  endShape();


  //curve(3)
  noFill();
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  vertex(410, 412);
  bezierVertex(410, 428, 402, 446, 393, 456);
  bezierVertex(381, 466, 364, 474, 351, 484);
  bezierVertex(336, 503, 332, 523, 335, 542);
  bezierVertex(344, 553, 360, 562, 384, 564);
  bezierVertex(398, 560, 414, 545, 421, 522);
  bezierVertex(416, 509, 408, 504, 394, 504);
  bezierVertex(381, 512, 376, 517, 371, 523);
  endShape();
  //curve beside little mountain
  beginShape();
  vertex(481, 651);
  bezierVertex(510, 633, 524, 611, 525, 581);
  endShape();

  //ellipse
  fill(0);
  ellipse(371, 523, 22, 17);

  //blue-small ball beside little mountain
  fill(19, 28, 98);
  noStroke();
  beginShape();
  curveVertex(324, 646);
  curveVertex(324, 646);
  curveVertex(329, 654);
  curveVertex(338, 659);
  curveVertex(349, 660);
  curveVertex(359, 657);
  curveVertex(364, 650);
  curveVertex(367, 640);
  curveVertex(367, 640);
  endShape();
  //black-small ball beside little mountain
  fill(0);
  noStroke();
  beginShape();
  curveVertex(324, 646);
  curveVertex(324, 646);
  curveVertex(324, 636);
  curveVertex(328, 627);
  curveVertex(336, 619);
  curveVertex(345, 617);
  curveVertex(354, 620);
  curveVertex(361, 626);
  curveVertex(365, 632);
  curveVertex(367, 640);
  curveVertex(367, 640);
  endShape();

  //some black parts
  fill(0);
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  curveVertex(261, 542);
  curveVertex(261, 542);
  curveVertex(251, 555);
  curveVertex(245, 571);
  curveVertex(265, 567);
  vertex(281, 561);
  vertex(281, 561);
  endShape();

  beginShape();
  curveVertex(243, 478);
  curveVertex(243, 478);
  curveVertex(248, 483);
  curveVertex(261, 487);
  curveVertex(269, 481);
  curveVertex(274, 473);
  curveVertex(266, 472);
  curveVertex(253, 474);
  curveVertex(243, 478);
  curveVertex(243, 478);
  endShape();

  beginShape();
  curveVertex(287, 667);
  curveVertex(287, 667);
  curveVertex(296, 664);
  curveVertex(307, 664);
  curveVertex(317, 666);
  curveVertex(307, 680);
  curveVertex(295, 680);
  curveVertex(287, 667);
  curveVertex(287, 667);
  endShape();

  beginShape();
  curveVertex(252, 680);
  curveVertex(252, 680);
  curveVertex(259, 676);
  curveVertex(267, 674);
  curveVertex(273, 680);
  curveVertex(273, 680);
  endShape();

  beginShape();
  curveVertex(245, 330);
  curveVertex(245, 330);
  curveVertex(250, 339);
  curveVertex(253, 357);
  curveVertex(252, 376);
  curveVertex(247, 386);
  curveVertex(244, 392);
  curveVertex(240, 398);
  curveVertex(223, 409);
  curveVertex(197, 412);
  curveVertex(206, 389);
  curveVertex(217, 366);
  curveVertex(232, 343);
  curveVertex(247, 326);
  curveVertex(247, 326);
  endShape();

  beginShape();
  curveVertex(190, 430);
  curveVertex(190, 430);
  curveVertex(172, 432);
  curveVertex(162, 446);
  curveVertex(166, 456);
  curveVertex(177, 461);
  curveVertex(177, 461);
  endShape();

  beginShape();
  curveVertex(121, 432);
  curveVertex(121, 432);
  curveVertex(125, 442);
  curveVertex(128, 455);
  curveVertex(109, 443);
  curveVertex(109, 443);
  endShape();

  beginShape();
  vertex(138, 459);
  vertex(138, 459);
  vertex(156, 467);
  vertex(136, 480);
  vertex(136, 480);
  endShape();

  beginShape();
  vertex(285, 284);
  vertex(285, 284);
  vertex(299, 271);
  vertex(290, 265);
  vertex(290, 265);
  endShape();

  beginShape();
  curveVertex(290, 265);
  curveVertex(290, 265);
  curveVertex(272, 250);
  curveVertex(285, 232);
  curveVertex(298, 224);
  curveVertex(290, 265);
  curveVertex(290, 265);
  endShape();

  //some blue parts
  fill(19, 28, 98);
  noStroke();
  beginShape();
  curveVertex(261, 542);
  curveVertex(261, 542);
  curveVertex(251, 555);
  curveVertex(245, 571);
  curveVertex(225, 574);
  curveVertex(200, 573);
  curveVertex(243, 527);
  curveVertex(243, 527);
  endShape();

  beginShape();
  curveVertex(243, 478);
  curveVertex(243, 478);
  curveVertex(244, 470);
  curveVertex(248, 464);
  curveVertex(256, 459);
  curveVertex(267, 461);
  curveVertex(271, 466);
  curveVertex(274, 473);
  curveVertex(266, 472);
  curveVertex(253, 474);
  curveVertex(243, 478);
  curveVertex(243, 478);
  endShape();

  beginShape();
  curveVertex(190, 430);
  curveVertex(190, 430);
  curveVertex(198, 433);
  curveVertex(204, 439);
  curveVertex(205, 446);
  curveVertex(201, 453);
  curveVertex(192, 459);
  curveVertex(184, 461);
  curveVertex(177, 461);
  curveVertex(177, 461);
  endShape();  

  beginShape();
  curveVertex(121, 432);
  curveVertex(121, 432);
  curveVertex(125, 442);
  curveVertex(129, 454);
  curveVertex(138, 459);
  curveVertex(143, 417);
  curveVertex(143, 417);
  endShape();

  beginShape();
  curveVertex(285, 284);
  curveVertex(285, 284);
  curveVertex(275, 319);
  curveVertex(307, 313);
  curveVertex(330, 301);
  curveVertex(299, 271);
  curveVertex(299, 271);
  endShape();

  beginShape();
  curveVertex(20, 233);
  curveVertex(20, 233);
  curveVertex(54, 222);
  curveVertex(74, 218);
  curveVertex(89, 218);
  curveVertex(106, 221);
  curveVertex(125, 232);
  curveVertex(141, 250);
  curveVertex(116, 253);
  curveVertex(99, 252);
  curveVertex(85, 249);
  curveVertex(72, 247);
  curveVertex(48, 241);
  curveVertex(20, 233);
  curveVertex(20, 233);
  endShape();


  //Red part in tower
  fill(177, 13, 25);
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(66, 386);
  vertex(66, 386);
  vertex(127, 303);
  bezierVertex(139, 311, 152, 320, 175, 323);
  vertex(175, 323);
  vertex(112, 418);
  bezierVertex(99, 406, 83, 393, 66, 386);
  vertex(66, 386);
  vertex(66, 386);
  endShape();
  
  //Blue part in tower
  fill(19,28,98);
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(216,196);
  vertex(216,196);
   bezierVertex(222,201,228,207,234,215);
  vertex(235,224);
  vertex(271,171);
  bezierVertex(263,167,254,162,247,157);
  vertex(247,157);
  vertex(247,157);
  endShape();
  
  //Black part in big blue circle
  fill(0);
  noStroke();
  beginShape();
  vertex(190,299);
  vertex(190,299);
   bezierVertex(200,298,212,299,221,303);
  vertex(221,303);
  bezierVertex(217,307,205,317,189,322);
  vertex(175,323);
  vertex(175,323);
  endShape();

  beginShape();
  vertex(175,323);
  vertex(175,323);
   bezierVertex(165,324,158,320,152,319);
  vertex(152,319);
    bezierVertex(147,328,140,345,139,361);
  vertex(140,375);
  vertex(140,375);
  endShape();
   
   //little yellow
  fill(239, 205, 20);
  noStroke(); 
  beginShape();
  vertex(190,299);
  vertex(190,299);
   bezierVertex(176,303,166,308,157,314);
  vertex(152,318);
    bezierVertex(156,322,166,323,175,322);
  vertex(175,322);
  vertex(175,322);
  endShape();
  
  
  //some black in blue
  fill(0);
  noStroke();
  beginShape();
  vertex(111,327);
  vertex(111,327);
  bezierVertex(115,333,116,340,115,345);
  bezierVertex(111,353,104,355,95,354);
  vertex(92,353);
  vertex(92,353);
  endShape();
  
  beginShape();
  vertex(52,299);
  vertex(52,299);
  bezierVertex(39,292,31,291,25,294);
  bezierVertex(19,300,16,305,14,314);
  bezierVertex(18,320,19,323,25,328);
  vertex(30,326);
   curveVertex(35,312);
    vertex(52,299);
  vertex(52,299);
  endShape();
  
  
  //black in left eye
  fill(0);
  noStroke();
  beginShape();
  curveVertex(74,218);
  curveVertex(74,218);
  curveVertex(89,218);
  curveVertex(106,221);
  curveVertex(100,235);
  curveVertex(99,252);
  curveVertex(91,250);
  curveVertex(85,249);
  curveVertex(78,248);
  curveVertex(72,247);
  curveVertex(74,235);
  curveVertex(74,218);
  curveVertex(74,218);
  endShape();
  //eyelash
  noFill();
  stroke(0);
  strokeWeight(0.8);
  beginShape();
  vertex(78,248);
  vertex(78,248);
  bezierVertex(76,257,72,268,68,280);
  endShape();
  
  beginShape();
  vertex(85,249);
  vertex(85,249);
  bezierVertex(81,266,78,278,77,295);
  endShape();
  
  beginShape();
  vertex(91,250);
  vertex(91,250);
  bezierVertex(91,264,92,283,96,296);
  endShape();
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}



