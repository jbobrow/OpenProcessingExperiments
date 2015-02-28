
/* Miro's clock, practice v2: adding structure
 number of white square => hour
 number of white line across the body => minute(just digit in tens cause we don't need too accurate about the time for living)
 twinkle star as time passing by (second)
 mouse pressed to know day or night
 */
// Stella Wang, Tainan

void setup() {
  size(600, 750);
}

void draw() {

  background(220);

  noFill();
  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(152, 136);
  curveVertex(112, 83);
  curveVertex(68, 49);
  curveVertex(30, 65);
  curveVertex(32, 104);
  curveVertex(77, 159);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(139, 130);
  curveVertex(102, 97);
  curveVertex(69, 87);
  curveVertex(40, 124);
  curveVertex(46, 159);
  curveVertex(65, 181);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(571, 141);
  curveVertex(509, 132);
  curveVertex(438, 143);
  curveVertex(436, 175);
  curveVertex(481, 188);
  curveVertex(568, 194);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(427, 175);
  curveVertex(481, 188);
  curveVertex(543, 226);
  curveVertex(540, 289);
  curveVertex(502, 346);
  curveVertex(471, 382);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(402, 316);
  curveVertex(402, 316);
  curveVertex(386, 375);
  curveVertex(386, 428);
  curveVertex(399, 508);
  curveVertex(419, 629);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(402, 316);
  curveVertex(402, 316);
  curveVertex(386, 375);
  curveVertex(386, 428);
  curveVertex(399, 508);
  curveVertex(419, 629);
  endShape();


  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(427, 175);
  curveVertex(481, 188);
  curveVertex(543, 226);
  curveVertex(540, 289);
  curveVertex(502, 346);
  curveVertex(471, 382);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(531, 304);
  curveVertex(502, 346);
  curveVertex(480, 381);
  curveVertex(483, 408);
  curveVertex(523, 420);
  curveVertex(599, 398);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(567, 401);
  curveVertex(586, 353);
  curveVertex(595, 314);
  curveVertex(599, 281);
  curveVertex(594, 223);
  curveVertex(588, 196);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(247, 678);
  curveVertex(294, 709);
  curveVertex(342, 728);
  curveVertex(401, 735);
  curveVertex(451, 722);
  curveVertex(487, 704);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(444, 734);
  curveVertex(452, 723);
  curveVertex(457, 693);
  curveVertex(462, 667);
  curveVertex(464, 640);
  curveVertex(464, 623);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(131, 134);
  curveVertex(99, 108);
  curveVertex(69, 111);
  curveVertex(66, 148);
  curveVertex(89, 179);
  curveVertex(165, 241);
  endShape();



  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(205, 576);
  curveVertex(229, 468);
  curveVertex(258, 405);
  curveVertex(291, 360);
  curveVertex(331, 296);
  curveVertex(480, 143);
  endShape();

  noFill();
  stroke(0);
  smooth();
  strokeWeight(2);
  line(561, 255, 599, 217);

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(302, 307);
  curveVertex(370, 269);
  curveVertex(435, 250);
  curveVertex(499, 235);
  curveVertex(549, 225);
  curveVertex(598, 217);
  endShape();

  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(370, 335);
  curveVertex(445, 279);
  curveVertex(482, 262);
  curveVertex(514, 251);
  curveVertex(547, 240);
  curveVertex(595, 229);
  endShape();

  /*
  fill(204, 68, 20);
   smooth();
   noStroke();
   beginShape();
   curveVertex(227, 184);
   curveVertex(171, 90);
   curveVertex(111, 79);
   curveVertex(98, 120);
   curveVertex(130, 148);
   curveVertex(247, 141);
   endShape();
   */

  fill(30, 63, 10);
  smooth();
  noStroke();
  beginShape();
  curveVertex(449, 338);
  curveVertex(173, 267);
  curveVertex(133, 149);
  curveVertex(172, 92);
  curveVertex(338, 11);
  curveVertex(507, 8);
  endShape();

  fill(30, 63, 10);
  smooth();
  noStroke();
  beginShape();
  vertex(338, 11);
  vertex(234, 200);
  vertex(173, 267);
  vertex(134, 201);
  endShape(CLOSE);

  /*
  fill(204, 204, 204);
   smooth();
   noStroke();
   beginShape();
   curveVertex(376, 1);
   curveVertex(339, 10);
   curveVertex(292, 55);
   curveVertex(253, 133);
   curveVertex(235, 199);
   curveVertex(215, 389);
   endShape();
   */
  drawSquare();

  drawLine();


  noFill();
  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(249, 395);
  curveVertex(229, 466);
  curveVertex(223, 494);
  curveVertex(219, 541);
  curveVertex(223, 589);
  curveVertex(238, 625);
  endShape();

  noFill();
  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(223, 521);
  curveVertex(222, 589);
  curveVertex(249, 644);
  curveVertex(341, 654);
  curveVertex(403, 596);
  curveVertex(392, 496);
  endShape();

  noFill();
  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(374, 621);
  curveVertex(401, 596);
  curveVertex(407, 562);
  curveVertex(403, 526);
  curveVertex(399, 508);
  curveVertex(389, 446);
  endShape();

  noFill();
  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(114, 715);
  curveVertex(223, 591);
  curveVertex(246, 551);
  curveVertex(249, 514);
  curveVertex(223, 494);
  curveVertex(128, 494);
  endShape();

  noFill();
  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(106, 613);
  curveVertex(163, 527);
  curveVertex(177, 512);
  curveVertex(195, 498);
  curveVertex(223, 494);
  curveVertex(285, 507);
  endShape();

  fill(0);
  smooth();
  noStroke();
  beginShape();
  curveVertex(198, 557);
  curveVertex(162, 529);
  curveVertex(136, 522);
  curveVertex(108, 540);
  curveVertex(97, 554);
  curveVertex(45, 618);
  endShape();

  fill(0);
  smooth();
  noStroke();
  beginShape();
  curveVertex(190, 433);
  curveVertex(97, 554);
  curveVertex(114, 581);
  curveVertex(156, 563);
  curveVertex(161, 560);
  curveVertex(194, 534);
  endShape();

  fill(0);
  smooth();
  noStroke();
  beginShape();
  curveVertex(82, 637);
  curveVertex(160, 560);
  curveVertex(169, 546);
  curveVertex(167, 536);
  curveVertex(162, 529);
  curveVertex(127, 482);
  endShape();

  fill(0);
  smooth();
  noStroke();
  beginShape();
  vertex(162, 529);
  vertex(97, 554);
  vertex(160, 560);
  endShape(CLOSE);

  noFill();
  stroke(0);
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(400, 15);
  curveVertex(173, 266);
  curveVertex(51, 517);
  curveVertex(87, 638);
  curveVertex(223, 590);
  curveVertex(286, 344);
  endShape();

  fill(0);
  smooth();
  noStroke();
  beginShape();
  curveVertex(594, 267);
  curveVertex(581, 191);
  curveVertex(548, 150);
  curveVertex(526, 136);
  curveVertex(518, 144);
  curveVertex(498, 159);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(649, 205);
  curveVertex(581, 191);
  curveVertex(534, 163);
  curveVertex(524, 150);
  curveVertex(519, 136);
  curveVertex(551, 97);
  endShape();

  triangle(581, 191, 594, 223, 614, 208);
  triangle(234, 200, 173, 266, 237, 289);
  triangle(233, 215, 222, 283, 243, 289);
  triangle(252, 291, 235, 260, 229, 287);

  noStroke();
  beginShape();
  curveVertex(150, 249);
  curveVertex(173, 266);
  curveVertex(197, 280);
  curveVertex(225, 288);
  curveVertex(252, 291);
  curveVertex(283, 287);
  endShape();

  //black1

  fill(0);
  smooth();
  noStroke();
  beginShape();
  curveVertex(138, 71);
  curveVertex(171, 91);
  curveVertex(178, 117);
  curveVertex(163, 141);
  curveVertex(132, 149);
  curveVertex(97, 124);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(509, 158);
  curveVertex(509, 133);
  curveVertex(529, 114);
  curveVertex(548, 126);
  curveVertex(545, 154);
  curveVertex(481, 200);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(322, 192);
  curveVertex(324, 251);
  curveVertex(305, 279);
  curveVertex(287, 269);
  curveVertex(335, 207);
  curveVertex(586, 220);
  endShape();
  triangle(324, 246, 335, 207, 366, 227);
  beginShape();
  curveVertex(314, 208);
  curveVertex(335, 207);
  curveVertex(343, 208);
  curveVertex(358, 214);
  curveVertex(366, 227);
  curveVertex(371, 239);
  endShape();
  triangle(372, 252, 334, 241, 366, 227);

  beginShape();
  curveVertex(351, 231);
  curveVertex(347, 247);
  curveVertex(332, 297);
  curveVertex(366, 286);
  curveVertex(371, 244);
  curveVertex(356, 190);
  endShape();

  triangle(403, 316, 443, 280, 467, 365);
  triangle(435, 334, 457, 381, 471, 357);
  triangle(461, 376, 441, 396, 446, 359);
  beginShape();
  curveVertex(398, 282);
  curveVertex(443, 280);
  curveVertex(470, 302);
  curveVertex(477, 331);
  curveVertex(464, 369);
  curveVertex(428, 406);
  endShape();

  noFill();
  smooth();
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(350, 334);
  curveVertex(429, 331);
  curveVertex(442, 349);
  curveVertex(449, 374);
  curveVertex(443, 395);
  curveVertex(411, 425);
  endShape();

  fill(0);
  smooth();
  noStroke();
  beginShape();
  curveVertex(475, 236);
  curveVertex(522, 421);
  curveVertex(585, 435);
  curveVertex(600, 390);
  curveVertex(588, 354);
  curveVertex(490, 314);
  endShape();

  //color1 (204, 68, 20)

  fill(204, 68, 20);
  smooth();
  noStroke();
  beginShape();
  curveVertex(227, 184);
  curveVertex(171, 91);
  curveVertex(115, 82);
  curveVertex(98, 120);
  curveVertex(132, 149);
  curveVertex(222, 131);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(514, 116);
  curveVertex(509, 133);
  curveVertex(512, 155);
  curveVertex(526, 164);
  curveVertex(545, 154);
  curveVertex(557, 128);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(333, 269);
  curveVertex(332, 297);
  curveVertex(353, 304);
  curveVertex(367, 290);
  curveVertex(371, 270);
  curveVertex(371, 257);
  endShape();
  smooth();
  noStroke();
  beginShape();
  curveVertex(323, 311);
  curveVertex(332, 297);
  curveVertex(340, 290);
  curveVertex(356, 279);
  curveVertex(371, 270);
  curveVertex(382, 265);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(518, 372);
  curveVertex(542, 413);
  curveVertex(568, 419);
  curveVertex(578, 400);
  curveVertex(570, 378);
  curveVertex(559, 364);
  endShape();

  // color1 (56, 76, 160)

  fill(56, 76, 160);
  smooth();
  noStroke();
  beginShape();
  curveVertex(427, 316);
  curveVertex(403, 316);
  curveVertex(400, 293);
  curveVertex(419, 277);
  curveVertex(443, 280);
  curveVertex(460, 310);
  endShape();

  beginShape();
  curveVertex(543, 481);
  curveVertex(522, 421);
  curveVertex(523, 385);
  curveVertex(550, 350);
  curveVertex(588, 354);
  curveVertex(625, 392);
  endShape();
  beginShape();
  curveVertex(485, 413);
  curveVertex(522, 421);
  curveVertex(554, 401);
  curveVertex(570, 379);
  curveVertex(588, 354);
  curveVertex(595, 333);
  endShape();

  //2 newmoon

  fill(0);
  smooth();
  noStroke();
  beginShape();
  curveVertex(178, 84);
  curveVertex(171, 91);
  curveVertex(158, 102);
  curveVertex(141, 128);
  curveVertex(132, 149);
  curveVertex(121, 181);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(485, 130);
  curveVertex(509, 133);
  curveVertex(522, 137);
  curveVertex(535, 144);
  curveVertex(545, 154);
  curveVertex(549, 156);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(400, 339);
  curveVertex(403, 316);
  curveVertex(410, 303);
  curveVertex(427, 288);
  curveVertex(443, 280);
  curveVertex(480, 267);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(532, 417);
  curveVertex(542, 413);
  curveVertex(553, 404);
  curveVertex(562, 392);
  curveVertex(570, 378);
  curveVertex(589, 320);
  endShape();
  beginShape();
  curveVertex(584, 431);
  curveVertex(542, 413);
  curveVertex(539, 391);
  curveVertex(553, 376);
  curveVertex(570, 378);
  curveVertex(613, 408);
  endShape();

  //line

    noFill();
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(152, 136);
  curveVertex(112, 83);
  curveVertex(68, 49);
  curveVertex(30, 65);
  curveVertex(32, 104);
  curveVertex(77, 159);
  endShape();

  //bg
  fill(220);
  smooth();
  noStroke();
  beginShape();
  curveVertex(386, 314);
  curveVertex(251, 292);
  curveVertex(238, 175);
  curveVertex(291, 55);
  curveVertex(337, 10);
  curveVertex(359, 10);
  endShape();


  smooth();
  noStroke();
  beginShape();
  curveVertex(405, 325);
  curveVertex(415, 326);
  curveVertex(441, 348);
  curveVertex(449, 373);
  curveVertex(442, 398);
  curveVertex(420, 424);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(315, 312);
  curveVertex(341, 262);
  curveVertex(347, 243);
  curveVertex(334, 244);
  curveVertex(323, 254);
  curveVertex(289, 331);
  endShape();

  stroke(0);
  smooth();
  noFill();
  strokeWeight(2);
  beginShape();
  curveVertex(152, 274);
  curveVertex(236, 201);
  curveVertex(304, 135);
  curveVertex(356, 73);
  curveVertex(379, 0);
  curveVertex(385, -30);
  endShape();

  fill(0);
  beginShape();
  curveVertex(443, 648);
  curveVertex(443, 622);
  curveVertex(460, 604);
  curveVertex(496, 604);
  curveVertex(503, 623);
  curveVertex(502, 653);
  endShape();

  smooth();
  noStroke();
  beginShape();
  curveVertex(445, 600);
  curveVertex(443, 622);
  curveVertex(458, 638);
  curveVertex(494, 639);
  curveVertex(503, 623);
  curveVertex(493, 595);
  endShape();

  //mousepressed to know day or night
  int h =hour();
  if (mousePressed) {
    if (6 < h && h < 18) {
      background(220);
      fill(204, 68, 20);
      smooth();
      noStroke();
      beginShape();
      curveVertex(227, 184);
      curveVertex(171, 91);
      curveVertex(115, 82);
      curveVertex(98, 120);
      curveVertex(132, 149);
      curveVertex(222, 131);
      endShape();

      smooth();
      noStroke();
      beginShape();
      curveVertex(138, 71);
      curveVertex(171, 91);
      curveVertex(178, 117);
      curveVertex(163, 141);
      curveVertex(132, 149);
      curveVertex(97, 124);
      endShape();

      smooth();
      noStroke();
      beginShape();
      curveVertex(178, 84);
      curveVertex(171, 91);
      curveVertex(158, 102);
      curveVertex(141, 128);
      curveVertex(132, 149);
      curveVertex(121, 181);
      endShape();
    } 
    else {
      background(50);
      fill(250, 240, 2);
      smooth();
      noStroke();
      beginShape();
      curveVertex(227, 184);
      curveVertex(171, 91);
      curveVertex(115, 82);
      curveVertex(98, 120);
      curveVertex(132, 149);
      curveVertex(222, 131);
      endShape();

      fill(50);
      smooth();
      noStroke();
      beginShape();
      curveVertex(178, 84);
      curveVertex(171, 91);
      curveVertex(158, 102);
      curveVertex(141, 128);
      curveVertex(132, 149);
      curveVertex(121, 181);
      endShape();
    }
  }

  drawStar();
}


/////////////////////////////////////structure//////////////////////////////////////

void drawSquare() {


  int ho = hour();
  int h = ho % 12; //0-11

  if (h >= 1) {
    fill(255);
  } 
  else {
    fill(0);
  }
  smooth();      //1
  noStroke();
  beginShape();
  vertex(220, 517);
  vertex(252, 525);
  vertex(248, 512);
  vertex(238, 499);
  vertex(223, 494);
  endShape(CLOSE);

  if (h >= 2) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();      //2
  noStroke();
  beginShape();
  vertex(218, 558);
  vertex(220, 576);
  vertex(223, 592);
  vertex(230, 583);
  vertex(237, 571);
  vertex(242, 561);
  endShape(CLOSE);


  if (h >= 3) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();      //3
  noStroke();
  beginShape();
  vertex(247, 547);
  vertex(243, 562);
  vertex(283, 573);
  vertex(286, 551);
  endShape(CLOSE);


  if (h >= 4) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();         //4
  noStroke();
  beginShape();
  vertex(228, 614);
  vertex(235, 628);
  vertex(243, 638);
  vertex(252, 646);
  vertex(261, 649);
  vertex(272, 654);
  vertex(279, 613);
  endShape(CLOSE);


  if (h >= 5) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();             //5
  noStroke();
  beginShape();
  vertex(319, 468);
  vertex(319, 490);
  vertex(340, 490);
  vertex(340, 468);
  endShape(CLOSE);


  if (h >= 6) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();            //6
  noStroke();
  beginShape();
  vertex(292, 507);
  vertex(296, 490);
  vertex(319, 490);
  vertex(317, 509);
  endShape(CLOSE);


  if (h >= 7) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();            //7
  noStroke();
  beginShape();
  vertex(290, 527);
  vertex(288, 536);
  vertex(287, 550);
  vertex(339, 550);
  vertex(341, 529);
  endShape(CLOSE);

  if (h >= 8) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();         //8
  noStroke();
  beginShape();
  vertex(284, 572);
  vertex(279, 613);
  vertex(340, 615);
  vertex(340, 584);
  endShape(CLOSE);


  if (h >= 9) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();        //9
  noStroke();
  beginShape();
  vertex(343, 508);
  vertex(342, 527);
  vertex(367, 530);
  vertex(368, 508);
  endShape(CLOSE);


  if (h >= 10) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();               //10
  noStroke();
  beginShape();
  vertex(366, 527);
  vertex(366, 591);
  vertex(403, 596);
  vertex(406, 583);
  vertex(407, 568);
  vertex(407, 554);
  vertex(404, 542);
  vertex(402, 527);
  endShape(CLOSE);

  if (h >= 11) {
    fill(255);
  } 
  else {
    fill(0);
  }  
  smooth();            //11
  noStroke();
  beginShape();
  vertex(340, 616);
  vertex(342, 655);
  vertex(355, 651);
  vertex(364, 644);
  vertex(371, 639);
  vertex(379, 630);
  vertex(387, 623);
  endShape(CLOSE);

  fill(11, 50, 145);
  smooth();
  noStroke();
  beginShape();
  vertex(220, 517);
  vertex(219, 557);
  vertex(243, 563);
  vertex(248, 544);
  vertex(252, 525);
  endShape(CLOSE);


  fill(11, 50, 145);
  smooth();
  noStroke();
  beginShape();
  vertex(286, 550);
  vertex(283, 574);
  vertex(340, 584);
  vertex(340, 550);
  endShape(CLOSE);

  fill(246, 134, 0);
  smooth();
  noStroke();
  beginShape();
  vertex(229, 468);
  vertex(226, 479);
  vertex(223, 494);
  vertex(235, 496);
  vertex(242, 500);
  vertex(246, 506);
  vertex(249, 512);
  vertex(251, 523);
  vertex(289, 528);
  vertex(299, 469);
  endShape(CLOSE);


  fill(43, 68, 11);
  smooth();
  noStroke();
  beginShape();
  vertex(251, 524);
  vertex(250, 535);
  vertex(248, 548);
  vertex(286, 550);
  vertex(289, 527);
  endShape(CLOSE);


  fill(207, 52, 0);
  smooth();
  noStroke();
  beginShape();
  vertex(243, 562);
  vertex(239, 569);
  vertex(235, 576);
  vertex(230, 582);
  vertex(227, 586);
  vertex(223, 591);
  vertex(229, 614);
  vertex(278, 614);
  vertex(283, 573);
  endShape(CLOSE);

  fill(26, 55, 159);
  smooth();
  noStroke();
  beginShape();
  vertex(299, 468);
  vertex(296, 490);
  vertex(319, 490);
  vertex(319, 468);
  endShape(CLOSE);

  fill(220, 50, 0);
  smooth();
  noStroke();
  beginShape();
  vertex(341, 507);
  vertex(339, 490);
  vertex(319, 490);
  vertex(317, 509);
  endShape(CLOSE);

  fill(47, 72, 17);
  smooth();
  noStroke();
  beginShape();
  vertex(292, 508);
  vertex(289, 527);
  vertex(315, 528);
  vertex(317, 509);
  endShape(CLOSE);


  fill(254, 243, 13); 
  smooth();     
  noStroke();
  beginShape();
  vertex(317, 509);
  vertex(315, 528);
  vertex(340, 528);
  vertex(341, 507);
  endShape(CLOSE);

  fill(218, 54, 3);
  smooth();
  noStroke();
  beginShape();
  vertex(279, 614);
  vertex(273, 654);
  vertex(292, 657);
  vertex(314, 658);
  vertex(342, 655);
  vertex(339, 615);
  endShape(CLOSE);

  fill(210, 38, 0);
  smooth();
  noStroke();
  beginShape();
  vertex(399, 507);
  vertex(403, 527);
  vertex(367, 530);
  vertex(368, 508);
  endShape(CLOSE);

  fill(62, 93, 34);
  smooth();
  noStroke();
  beginShape();
  vertex(341, 527);
  vertex(340, 550);
  vertex(340, 588);
  vertex(367, 591);
  vertex(367, 530);
  endShape(CLOSE);



  fill(218, 42, 1);
  smooth();
  noStroke();
  beginShape();
  vertex(341, 587);
  vertex(339, 615);
  vertex(386, 622);
  vertex(391, 616);
  vertex(396, 607);
  vertex(399, 603);
  vertex(403, 596);
  endShape(CLOSE);
}


void drawLine() {

  int mi = minute();
  int m = floor(mi/10); //0-5


  noFill();    //h1
  if (m >= 1) {
    stroke(255);
  } 
  else {
    stroke(0);
  }
  smooth();
  strokeWeight(2);
  line(214, 469, 374, 466);

  noFill();     //h2
  if (m >= 2) {
    stroke(255);
  } 
  else {
    stroke(0);
  }  
  smooth();
  strokeWeight(2);
  line(294, 508, 405, 508);

  noFill();     //v1
  if (m >= 3) {
    stroke(255);
  } 
  else {
    stroke(0);
  }
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(298, 416);
  curveVertex(300, 446);
  curveVertex(290, 528);
  curveVertex(274, 632);
  curveVertex(269, 713);
  curveVertex(279, 747);
  endShape();

  noFill();      //v2
  if (m >= 4) {
    stroke(255);
  } 
  else {
    stroke(0);
  }
  smooth();
  strokeWeight(2);
  beginShape();
  curveVertex(345, 376);
  curveVertex(343, 418);
  curveVertex(340, 532);
  curveVertex(340, 615);
  curveVertex(342, 728);
  curveVertex(348, 748);
  endShape();

  noFill();     //v3
  if (m >= 5) {
    stroke(255);
  } 
  else {
    stroke(0);
  }  
  smooth();
  strokeWeight(2);
  line(367, 495, 368, 559);
}

void drawStar() {

  int se = second();
  int s = se % 2;  //0=even 1=odd
  int h = hour();

  /*  if(h > 6) {
   stroke(0);
   } else {
   stroke(255);
   }
   
   */

  if (s < 1) {
    stroke(255);
  } 
  else {
    noStroke();
  }

  noFill();       //lr
  smooth();
  strokeWeight(2);
  line(457, 435, 581, 592);

  noFill();      //rl
  smooth();
  strokeWeight(2);
  line(434, 572, 567, 448);


  noFill();   //v
  smooth();
  strokeWeight(2);
  line(511, 444, 514, 576);

  noFill();    //h
  smooth();
  strokeWeight(2);
  line(433, 511, 571, 499);
}

