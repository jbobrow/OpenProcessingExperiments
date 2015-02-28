
//bg stuff
void setup() {
size(800, 600);
background(0);
smooth();
}

void draw() {
//stripes
noStroke();
//red stripe
beginShape();
fill(map(mouseX, 0, 800, 34, 90), map(mouseY, 0, 600, 80, 30), 235);
vertex(800, 0);
vertex(800, 64);
vertex(418, 157);
vertex(401, 124);
vertex(792, 0);
endShape();

//pinkstripe
beginShape();
fill(map(mouseX, 0, 800, 200, 240), map(mouseY, 0, 600, 180, 90), 150);
vertex(800, 80);
vertex(800, 166);
vertex(444, 212);
vertex(433, 176);
vertex(800, 81);
endShape();

//bluestripe
beginShape();
fill(map(mouseX, 0, 800, 70, 120), map(mouseY, 0, 600, 60, 10), 90);
vertex(800, 208);
vertex(800, 290);
vertex(478, 277);
vertex(449, 250);
vertex(452, 232);
endShape();

//greenstripe
beginShape();
fill(map(mouseX, 0, 800, 35, 70), map(mouseY, 0, 600, 130, 70), 44);
vertex(800, 535);
vertex(800, 600);
vertex(767, 600);
vertex(506, 493);
vertex(517, 458);
endShape();

//face

//main faceplace

//whitebase face
beginShape();
fill(255, 255, 255);
noStroke();
vertex(416, 567);
vertex(436, 514);
curveVertex(436, 514);
curveVertex(429, 501);
curveVertex(420, 478);
curveVertex(416, 462);
curveVertex(413, 427);
curveVertex(400, 415);
curveVertex(420, 471);
vertex(420, 471);
vertex(423, 430);
vertex(434, 375);
curveVertex(434, 375);
curveVertex(430, 365);
curveVertex(422, 312);
curveVertex(423, 300);
vertex(419, 300);
curveVertex(419, 300);
curveVertex(408, 279);
curveVertex(404, 265);
curveVertex(403, 230);
curveVertex(406, 221);
curveVertex(415, 224);
vertex(424, 226);
vertex(431, 236);
vertex(438, 240);
vertex(436, 209);
vertex(425, 174);
vertex(420, 187);
curveVertex(420, 187);
curveVertex(410, 160);
curveVertex(388, 124);
curveVertex(344, 84);
vertex(348, 103);
curveVertex(348, 103);
curveVertex(301, 91);
curveVertex(270, 92);
curveVertex(249, 99);
curveVertex(230, 111);
curveVertex(207, 129);
vertex(225, 93);
vertex(190, 121);
vertex(161, 157);
vertex(158, 135);
vertex(134, 228);
curveVertex(150, 274);
curveVertex(150, 281);
curveVertex(146, 282);
curveVertex(128, 270);
vertex(100, 280);
vertex(98, 281);
vertex(93, 328);
curveVertex(93, 328);
curveVertex(98, 336);
curveVertex(100, 337);
curveVertex(113, 343);
curveVertex (120, 346);
curveVertex(130, 360);
curveVertex(139, 387);
vertex(142, 354);
vertex(135, 353);
vertex(159, 358);
vertex(179, 362);
curveVertex(178, 361);
curveVertex(184, 363);
curveVertex(188, 368);
curveVertex(198, 376);
vertex(200, 360);
curveVertex(200, 360);
curveVertex(206, 358);
curveVertex(220, 364);
vertex(228, 382);
curveVertex(299, 363);
curveVertex(224, 356);
curveVertex(220, 351);
curveVertex(183, 336);
curveVertex(164, 271);
curveVertex(181, 316);
vertex(190, 327);
vertex(182, 288);
vertex(212, 336);
vertex(218, 340);
vertex(235, 355);
vertex(236, 362);
vertex(234, 356);
vertex(236, 384);
vertex(229, 405);
vertex(255, 388);
vertex(220, 432);
vertex(223, 426);
vertex(223, 441);
vertex(175, 442);
vertex(154, 458);
curveVertex(154, 458);
curveVertex(188, 475);
curveVertex(218, 496);
curveVertex(245, 547);
vertex(244, 555);
vertex(265, 572);
vertex(292, 574);
vertex(319, 562);
curveVertex(319, 562);
curveVertex(331, 573);
curveVertex(367, 579);
curveVertex(405, 566);
endShape();
//finally

//eye left
beginShape();
noStroke();
fill(0);
vertex(204, 249);
vertex(204, 219);
vertex(213, 194);
curveVertex(213, 194);
curveVertex(236, 172);
curveVertex(251, 167);
curveVertex(261, 161);
curveVertex(277, 151);
curveVertex(270, 170);
curveVertex(266, 179);
curveVertex(258, 190);
curveVertex(254, 203);
curveVertex(243, 214);
curveVertex(222, 224);
endShape();

   beginShape();
vertex(190, 215);
vertex(201, 178);
vertex(208, 166);
vertex(252, 140);
vertex(258, 134);
vertex(263, 125);
vertex(265, 139);
vertex(259, 146);
vertex(242, 157);
vertex(212, 177);
endShape();

//eye right
beginShape();
vertex(375, 227);
curveVertex(375, 227);
curveVertex(372, 208);
curveVertex(366, 200);
curveVertex(349, 169);
curveVertex(339, 163);
curveVertex(333, 165);
curveVertex(331, 175);
curveVertex(339, 196);
curveVertex(348, 208);
curveVertex(365, 218);
vertex(370, 223);
endShape();

//right eyebrow
beginShape();
vertex(387, map(mouseY, 200, 400, 207, 227));
vertex(381, map(mouseY, 200, 400, 185, 205));
vertex(367, map(mouseY, 200, 400, 169, 189));
vertex(335, map(mouseY, 200, 400, 142, 162));
vertex(326, map(mouseY, 200, 400, 134, 154));
vertex(326, map(mouseY, 200, 400, 130, 150));
vertex(328, map(mouseY, 200, 400, 128, 148));
vertex(328, map(mouseY, 200, 400, 125, 145));
vertex(319, map(mouseY, 200, 400, 129, 249));
vertex(321, map(mouseY, 200, 400, 143, 163));
vertex(345, map(mouseY, 200, 400, 165, 185));
vertex(368, map(mouseY, 200, 400, 184, 204));
vertex(376, map(mouseY, 200, 400, 190, 210));
endShape();

//nose and...uh nose...wrinkles???
beginShape();
vertex(245, 346);
curveVertex(245, 346);
curveVertex(239, 326);
curveVertex(240, 320);
curveVertex(244, 310);
curveVertex(257, 291);
curveVertex(262, 285);
vertex(264, 274);
curveVertex(280, 268);
curveVertex(266, 294);
curveVertex(252, 307);
curveVertex(245, 323);
endShape();
//that was wrinkle 1 left
//wrinkle 2 left
beginShape();
vertex(264, 274);
curveVertex(261, 279);
curveVertex(253, 285);
curveVertex(243, 293);
curveVertex(236, 308);
curveVertex(243, 290);
curveVertex(249, 282);
curveVertex(260, 274);
curveVertex(272, 262);
curveVertex(279, 245);
curveVertex(281, 263);
endShape();

//wrinkle right
beginShape();
vertex(346, 235);
vertex(351, 252);
vertex(362, 266);
vertex(382, 286);
vertex(394, 311);
vertex(398, 317);
vertex(398, 295);
vertex(387, 275);
vertex(367, 259);
vertex(360, 251);
endShape();

//actual nose
beginShape();
vertex(294, 279);
vertex(280, 269);
vertex(278, 247);
vertex(291, 214);
vertex(300, 199);
vertex(312, 196);
vertex(321, 200);
vertex(352, 252);
vertex(359, 259);
vertex(356, 266);
vertex(344, 274);
vertex(340, 273);
vertex(342, 266);
vertex(349, 260);
vertex(319, 212);
vertex(314, 207);
vertex(311, 205);
vertex(306, 211);
vertex(301, 216);
vertex(288, 256);
vertex(288, 267);
vertex(296, 262);
vertex(304, 248);
vertex(309, 265);
vertex(305, 268);
vertex(301, 261);
vertex(297, 275);
endShape();

//right nostril
beginShape();
vertex(327, 242);
vertex(331, 245);
vertex(334, 259);
vertex(322, 259);
endShape();
//end nose



//lip
beginShape();
fill(255, 255, 255);
vertex(283, 353);
vertex(276, 447);
vertex(266, 468);
vertex(276, 447);
vertex(266, 495);
vertex(269, 498);
vertex(291, 506);
vertex(313, 501);
vertex(351, 507);
vertex(371, 499);
vertex(386, 508);
vertex(374, 522);
vertex(322, 528);
vertex(313, 520);
vertex(312, 514);
vertex(304, 519);
vertex(296, 527);
vertex(270, 515);
vertex(248, 506);
vertex(247, 500);
vertex(250, 481);
vertex(270, 413);
endShape();

//right hand
//whitebase righthand
beginShape();
fill(255, 255, 255);
vertex(460, 600);
vertex(477, 537);
vertex(504, 457);
vertex(480, 377);
curveVertex(479, 394);
curveVertex(477, 396);
curveVertex(475, 396);
curveVertex(470, 397);
vertex(475, 354);
vertex(482, 323);
curveVertex(482, 301);
curveVertex(429, 243);
curveVertex(439, 276);
curveVertex(434, 279);
curveVertex(414, 235);
curveVertex(414, 230);
curveVertex(411, 232);
curveVertex(411, 236);
curveVertex(411, 250);
curveVertex(416, 275);
curveVertex(424, 293);
curveVertex(440, 372);
curveVertex(426, 476);
curveVertex(440, 503);
curveVertex(448, 529);
curveVertex(449, 533);
curveVertex(439, 536);
curveVertex(445, 534);
vertex(440, 524);
vertex(420, 600);
endShape();
//lines
stroke(0);
strokeWeight(5);
strokeCap(ROUND);
noFill();
beginShape();
vertex(458, 377);
vertex(440, 286);
curveVertex(460, 307);
curveVertex(466, 311);
curveVertex(466, 320);
curveVertex(464, 325);
vertex(458, 374);
endShape();
//end right hand

//ear bit
noStroke();
fill(0);
beginShape();
vertex(149, 303);
vertex(144, 296);
vertex(119, 288);
vertex(117, 290);
vertex(110, 319);
vertex(137, 344);
vertex(141, 337);
vertex(118, 318);
vertex(122, 298);
endShape();

//left hand
fill(255, 255, 255);
noStroke();
beginShape();
vertex(250, 600);
vertex(235, 565);
vertex(237, 549);
curveVertex(237, 549);
curveVertex(217, 513);
curveVertex(210, 510);
curveVertex(172, 472);
vertex(167, 474);
vertex(144, 462);
vertex(167, 438);
vertex(189, 406);
vertex(190, 400);
vertex(200, 398);
vertex(215, 417);
vertex(223, 410);
vertex(206, 369);
vertex(169, 404);
vertex(169, 413);
vertex(146, 432);
vertex(112, 435);
vertex(124, 484);
vertex(121, 489);
vertex(111, 466);
vertex(107, 474);
vertex(126, 518);
vertex(165, 539);
vertex(201, 568);
vertex(215, 600);
endShape();

beginShape();
vertex(127, 435);
vertex(146, 391);
vertex(151, 363);
vertex(162, 368);
vertex(178, 387);
vertex(182, 382);
vertex(162, 400);
vertex(160, 409);
vertex(132, 433);
endShape();
//end left hand

//hair
//1
beginShape();
vertex(118, 200);
vertex(122, 181);
vertex(142, 131);
vertex(120, 69);
vertex(109, 80);
vertex(106, 0);
vertex(9, 0);
vertex(76, 110);
vertex(97, 95);
endShape();
//2
beginShape();
vertex(167, 110);
vertex(248, 60);
vertex(236, 13);
vertex(211, 28);
vertex(213, 0);
vertex(126, 0);
vertex(155, 50);
endShape();
//3
beginShape();
vertex(261, 0);
vertex(265, 24);
vertex(280, 17);
vertex(288, 66);
vertex(312, 63);
vertex(340, 73);
vertex(345, 0);
endShape();
//4
beginShape();
vertex(356, 71);
vertex(376, 86);
vertex(390, 97);
vertex(397, 54);
vertex(403, 55);
vertex(422, 26);
vertex(440, 0);
vertex(369, 0);
vertex(371, 16);
vertex(383, 13);
endShape();

  //mouth
if (mousePressed == true) {
    fill(255, 0, 0);
  } else {
    fill(0);
    }
beginShape();
vertex(355, 276);
vertex(363, 277);
vertex(368, 292);
vertex(377, 337);
vertex(385, 418);
vertex(395, 474);
vertex(396, 501);
vertex(392, 512);
vertex(309, 526);
vertex(382, 526);
vertex(376, 528);
vertex(372, 531);
vertex(342, 536);
vertex(320, 535);
vertex(309, 526);
vertex(304, 531);
vertex(395, 535);
vertex(273, 530);
vertex(236, 507);
vertex(234, 504);
vertex(235, 495);
vertex(239, 485);
vertex(259, 426);
vertex(274, 429);
vertex(284, 312);
vertex(292, 306);
vertex(293, 301);
vertex(314, 296);
endShape();
 
 

    
}
//DONE
