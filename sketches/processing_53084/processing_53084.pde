
//Shogun Warrior
void setup()
{
size(580, 800);
background(133, 173, 193, 255);
smooth();

//background accent
stroke(235, 32, 32, 75);
strokeWeight(3);
fill(133, 78, 78, 150);
beginShape();
vertex(160, 675);
vertex(35, 75);
vertex(500, 100);
vertex(515, 550);
vertex(160, 675);
endShape();
strokeWeight(0.5);

//helmet
//face
noStroke();
fill(220);
beginShape();
vertex(309, 188);
vertex(295, 191);
vertex(285, 175);
vertex(285, 155);
bezierVertex(285,153, 310,125, 336,156);
vertex(335, 177);
vertex(324, 194);
vertex(309, 188);
endShape();
noFill();
//helmet right side
fill(7, 8, 42, 255);
beginShape();
vertex(281, 193);
vertex(275, 203);
bezierVertex(275,203, 275,206, 287,210);
vertex(287, 197);
vertex(281, 193);
endShape();
//helmet left side
beginShape();
vertex(339, 195);
vertex(344, 205);
bezierVertex(344,205, 340,210, 334,211);
vertex(334, 199);
vertex(339, 195);
endShape();
noFill();
//nose bridge
fill(5, 60, 87, 255);
beginShape();
vertex(309.5, 173);
vertex(315, 176);
vertex(313, 180);
vertex(309, 179);
vertex(305, 180);
vertex(303, 176);
vertex(309.5, 173);
endShape();
noFill();
//nose
beginShape();
vertex(309, 179);
vertex(305, 180);
vertex(304, 190);
vertex(309, 188);
vertex(314, 190);
vertex(313, 180);
vertex(309, 179);
endShape();
//face right side
fill(27, 116, 161, 255);
beginShape();
vertex(305, 180);
vertex(304, 190);
vertex(295, 191);
vertex(295, 182);
vertex(305, 180);
endShape();
//face left side
beginShape();
vertex(313, 180);
vertex(314, 190);
vertex(324, 194);
vertex(324, 183);
vertex(313, 180);
endShape();
noFill();
//neck
fill(190);
//right side
triangle(286,196, 304,210, 285,219);
//left side
triangle(334,199, 311,210, 334,223);
noFill();
//right cheek
fill(7, 8, 42, 255);
beginShape();
vertex(292, 207);
vertex(281, 193);
vertex(280, 180);
vertex(285, 175);
vertex(295, 191);
vertex(291, 192);
vertex(292, 207);
endShape();
//left cheek
beginShape();
vertex(327, 209);
vertex(339, 195);
vertex(340, 182);
vertex(335, 177);
vertex(324, 194);
vertex(327, 195);
vertex(327, 209);
endShape();
noFill();
//right cheek upper
fill(5, 60, 87, 255);
beginShape();
vertex(280, 180);
vertex(285, 175);
vertex(295, 191);
vertex(291, 192);
vertex(280, 180);
endShape();
//left cheek upper
beginShape();
vertex(340, 182);
vertex(335, 177);
vertex(324, 194);
vertex(328, 195);
vertex(340, 182);
endShape();
//left stripe
beginShape();
vertex(320, 142);
bezierVertex(320,142, 326,145, 320,174);
bezierVertex(320,174, 342,144, 320,142);
endShape();
//right stripe
beginShape();
vertex(301, 141);
bezierVertex(301,141, 280,140, 298,173);
bezierVertex(298,173, 295,146, 301,141);
endShape();
//eyes
//right eye
fill(7, 8, 42, 255);
beginShape();
vertex(305, 180);
vertex(303, 176);
vertex(287, 167);
vertex(295, 183);
vertex(304, 180);
endShape();
//left eye
beginShape();
vertex(313, 180);
vertex(315, 176);
vertex(332, 169);
vertex(324, 184);
vertex(313, 180);
endShape();
noFill();
//right inner eye
fill(255, 255, 0, 255);
beginShape();
vertex(304, 179);
vertex(303, 177);
vertex(291, 171);
vertex(296, 179);
vertex(304, 179);
endShape();
//left inner eye
beginShape();
vertex(314, 179);
vertex(316, 177);
vertex(329, 172);
vertex(323, 180);
vertex(314, 179);
endShape();
noFill();
//center horn
fill(217, 32, 32, 255);
beginShape();
vertex(312, 120);
bezierVertex(312,120, 305,125, 299,146);
bezierVertex(299,146, 310,138, 322,146);
bezierVertex(322,146, 318,125, 312,120);
endShape();
noFill();
//center horn accent
stroke(82, 12, 12, 100);
line(312,120, 311,143);
noStroke();
//helmet ellipse
stroke(5, 60, 87, 255);
strokeWeight(2);
fill(19, 164, 237, 255);
pushMatrix();
translate(157, 71);
rotate(radians(3));
ellipse(157, 71, 25, 15);
popMatrix();
noStroke();
noFill();
//grill
fill(5, 60, 87, 255);
beginShape();
vertex(309, 188);
vertex(291, 192);
vertex(292, 207);
vertex(308, 215);
vertex(327, 209);
vertex(328, 195);
vertex(309, 188);
endShape();
noFill();
//vent
//left side
//rectangle 1
fill(25);
beginShape();
vertex(311, 192);
vertex(315, 194);
vertex(315, 210);
vertex(311, 209);
vertex(311, 193);
endShape();
//rectangle 2
beginShape();
vertex(318, 194);
vertex(321, 195);
vertex(321, 208);
vertex(318, 209);
vertex(318, 195);
endShape();
//rectangle 3
beginShape();
vertex(323, 196);
vertex(325, 197);
vertex(325, 205);
vertex(323, 207);
vertex(323, 196);
endShape();
//right side
//rectangle 1
beginShape();
vertex(302, 193);
vertex(306, 192);
vertex(306, 210);
vertex(302, 209);
vertex(302, 193);
endShape();
//rectangle 2
beginShape();
vertex(297, 194);
vertex(300, 193);
vertex(300, 208);
vertex(297, 206);
vertex(297, 194);
endShape();
//rectangle 3
beginShape();
vertex(293, 195);
vertex(295, 194);
vertex(295, 205);
vertex(293, 204);
vertex(293, 195);
endShape();
noFill();
stroke(0);
strokeWeight(0.5);

//horns
//right horn
//right horn 2nd segment
stroke(127, 113, 22, 255);
strokeWeight(0.25);
fill(207, 184, 14, 255);
beginShape();
vertex(204, 40);
vertex(200, 41);
vertex(175, 105);
vertex(180, 110);
vertex(225, 105);
vertex(230, 100);
vertex(243, 56);
vertex(241, 50);
vertex(204, 40);
endShape();
//right horn 2nd segment shadow
fill(127, 113, 22, 255);
beginShape();
vertex(200, 41);
vertex(204, 40);
bezierVertex(204,40, 205,69, 235,58);
vertex(241, 50);
vertex(243, 56);
bezierVertex(243,56, 210,80, 200,41);
endShape();
//right horn 3rd segment
fill(207, 184, 14, 255);
beginShape();
vertex(180, 110);
vertex(175, 115);
vertex(209, 180);
vertex(215, 180);
bezierVertex(215,180, 225,150, 240,145);
vertex(230, 110);
vertex(225, 105);
vertex(180, 110);
endShape();
//right horn 3rd segment shadow
fill(127, 113, 22, 255);
beginShape();
vertex(215, 180);
bezierVertex(215,180, 225,150, 240,145);
bezierVertex(240,145, 221,147, 209,180);
vertex(215, 180);
endShape();
//right horn 4th segment
fill(207, 184, 14, 255);
beginShape();
vertex(285, 150);
vertex(240, 145);
bezierVertex(240,145, 225,150, 215,180);
vertex(220, 185);
vertex(280, 185);
vertex(280, 180);
vertex(285, 175);
vertex(285, 150);
endShape();
//right horn tip
beginShape();
vertex(270, 15);
vertex(205, 35);
bezierVertex(205,35, 200,69, 235,58);
vertex(270, 15);
endShape();
//left horn
//left horn 2nd segment
beginShape();
vertex(431, 51);
vertex(435, 53);
vertex(455, 125);
vertex(450, 130);
vertex(405, 115);
vertex(400, 109);
vertex(394, 69);
vertex(396, 65);
vertex(431, 51);
endShape();
//left horn 2nd segment shadow
fill(127, 113, 22, 255);
beginShape();
vertex(435, 53);
vertex(431, 51);
bezierVertex(431,51, 420,80, 396,65);
vertex(395, 70);
bezierVertex(395,70, 423,84, 435,53);
endShape();
//left horn 3rd segment
fill(207, 184, 14, 255);
beginShape();
vertex(450, 130);
vertex(454, 137);
vertex(405, 190);
vertex(400, 190);
bezierVertex(400,190, 400,170, 385,150);
vertex(400, 117);
vertex(405, 115);
vertex(450, 130);
endShape();
//left horn 3rd segment shadow
fill(127, 113, 22, 255);
beginShape();
vertex(400, 190);
bezierVertex(400,190, 400,170, 385,150);
bezierVertex(385,150, 405,165, 405,190);
vertex(400, 190);
endShape();
//left horn 4th segment
fill(207, 184, 14, 255);
beginShape();
vertex(336, 152);
vertex(385, 150);
bezierVertex(385,150, 400,170, 400,190);
vertex(395, 195);
vertex(340, 187);
vertex(340, 182);
vertex(335, 177);
vertex(336, 152);
endShape();
//left horn tip
beginShape();
vertex(365, 25);
vertex(430, 45);
bezierVertex(430,45, 435,76, 400,70);
vertex(365, 25);
endShape();
noFill();
noStroke();

//arms
//left arm
//left wing
fill(217, 32, 32, 255);
beginShape();
vertex(387, 211);
vertex(445, 155);
bezierVertex(445,155, 455,170, 455,200);
vertex(435, 225);
vertex(405, 207);
vertex(370, 215);
vertex(387, 211);
endShape();
noFill();
//left shoulder
fill(7, 8, 42, 255);
beginShape();
vertex(370, 215);
vertex(405, 207);
vertex(435, 225);
vertex(430, 255);
vertex(425, 260);
bezierVertex(425,260, 400,263, 386,273);
vertex(370, 215);
endShape();
noFill();
//left shoulder accent
fill(5, 60, 87, 255);
beginShape();
vertex(405, 207);
vertex(435, 225);
bezierVertex(435,225, 395,240, 380,273);
vertex(377, 248);
bezierVertex(377,248, 380,222, 405,206);
endShape();
//left shoulder node 1
fill(0);
beginShape();
vertex(360, 211);
vertex(365, 212);
bezierVertex(365,212, 375,215, 375,225);
vertex(375, 230);
vertex(360, 211);
endShape();
//left shoulder node 2
beginShape();
vertex(346, 210);
bezierVertex(346,210, 330,210, 330,220);
vertex(346, 210);
endShape();
noFill();
//left bicep
fill(220);
beginShape();
vertex(425, 260);
vertex(439, 301);
vertex(435, 308);
bezierVertex(435,308, 420,310, 405,320);
vertex(398, 317);
vertex(393, 304);
vertex(395, 295);
vertex(387, 275);
bezierVertex(386,273, 400,263, 425,260);
endShape();
noFill();
//left bicep shadow
fill(190);
beginShape();
vertex(439, 301);
vertex(435, 308);
bezierVertex(435,308, 420,310, 405,320);
vertex(398, 317);
bezierVertex(398,317, 415,301, 439,301);
endShape();
//elbow
fill(0);
beginShape();
vertex(405, 321);
bezierVertex(405,321, 417,310, 435,309);
vertex(436, 316);
bezierVertex(436,316, 415,320, 405,321);
endShape();
noFill();
//left forearm
//sm rectangle
stroke(7, 8, 42, 255);
fill(7, 8, 42, 255);
beginShape();
vertex(395, 326);
bezierVertex(395,326, 420,310, 454,317);
vertex(457, 346);
bezierVertex(457,346, 425,336, 400,355);
vertex(395, 326);
endShape();
noFill();
//lg rectangle
fill(7, 8, 42, 255);
beginShape();
vertex(400, 360);
bezierVertex(400,360, 425,340, 458,352);
vertex(465, 407);
bezierVertex(465,407, 435,400, 410,415);
vertex(400, 360);
endShape();
noFill();
//forearm band
stroke(5, 60, 87, 255);
fill(5, 60, 87, 255);
beginShape();
vertex(402, 353);
bezierVertex(402,353, 420,338, 455.5,345);
vertex(456, 352);
bezierVertex(456,352, 425,343, 403,358);
vertex(402, 353);
endShape();
//forearm cuff
beginShape();
vertex(410, 415);
bezierVertex(410,415, 435,399, 465,407);
vertex(460, 420);
bezierVertex(460,420, 440,415, 418,426);
vertex(410, 415);
endShape();
noFill();
//left hand
//left thumb
stroke(7, 8, 42, 255);
fill(7, 8, 42, 255);
beginShape();
vertex(410, 437);
vertex(423, 451);
vertex(410, 463);
vertex(413, 466);
bezierVertex(413,466, 406,470, 403,465);
bezierVertex(403,465, 391,455, 405,443);
vertex(410, 437);
endShape();
//left fingers
beginShape();
vertex(456, 465);
vertex(457, 470);
vertex(427, 480);
vertex(423, 479);
vertex(410, 463);
vertex(423, 451);
vertex(432, 453);
vertex(442, 463);
vertex(456, 465);
endShape();
//left backhand
beginShape();
vertex(460, 420);
bezierVertex(460,420, 440,415, 418,426);
vertex(410, 437);
vertex(423, 451);
vertex(432, 453);
vertex(442, 463);
vertex(455, 465);
vertex(461, 465);
vertex(460, 420);
endShape();
noFill();
//left hand shadow
fill(0);
beginShape();
vertex(432, 453);
vertex(425, 462);
vertex(428, 465);
vertex(439, 459);
vertex(432, 453);
endShape();
noFill();
noStroke();
//right arm
//right wing
fill(217, 32, 32, 255);
beginShape();
vertex(225, 205);
vertex(175, 145);
bezierVertex(175,145, 165,160, 160,190);
vertex(179, 218);
vertex(210, 200);
vertex(225, 205);
endShape();
noFill();
//right shoulder
fill(7, 8, 42, 255);
beginShape();
vertex(242, 210);
vertex(210, 200);
vertex(175, 220);
vertex(180, 245);
vertex(187, 251);
bezierVertex(187,251, 200,250, 220,260);
vertex(242, 210);
endShape();
noFill();
//right shoulder accent
fill(5, 60, 87, 255);
beginShape();
vertex(210, 200);
vertex(175, 220);
bezierVertex(175,220, 205,225, 223,253);
vertex(231,235);
bezierVertex(231,235, 225,210, 210,200);
endShape();
//right shoulder node 1
fill(0);
beginShape();
vertex(255, 207);
bezierVertex(255,207, 240,205, 238,218);
vertex(255, 207);
endShape();
//right shoulder node 2
beginShape();
vertex(284, 219);
bezierVertex(284,219, 290,210, 270,208);
vertex(280, 220);
vertex(284, 219);
endShape();
noFill();
//right bicep
fill(220);
beginShape();
vertex(187, 251);
bezierVertex(187,251, 200,250, 220,260);
vertex(215, 275);
vertex(215, 290);
vertex(218, 302);
vertex(216, 311);
bezierVertex(214,310, 195,296, 174,296);
vertex(187, 251);
endShape();
noFill();
//right forearm
//sm rectangle
stroke(7, 8, 42, 255);
fill(7, 8, 42, 255);
beginShape();
vertex(165, 296);
bezierVertex(165,296, 195,292, 221,315);
vertex(222, 322);
vertex(214, 344);
bezierVertex(214,344, 192,321, 157,324);
vertex(165, 296);
endShape();
//lg rectangle
beginShape();
vertex(155, 329);
bezierVertex(155,329, 192,324, 212,350);
vertex(195, 400);
bezierVertex(195,400, 174,382, 140,380);
vertex(155, 329);
endShape();
noFill();
//forearm band
stroke(5, 60, 87, 255);
fill(5, 60, 87, 255);
beginShape();
vertex(159, 324);
bezierVertex(159,324, 190,321, 213,342);
vertex(211, 348);
bezierVertex(211,349, 195,327, 157,329);
vertex(159, 324);
endShape();
//forearm cuff
beginShape();
vertex(140, 380);
bezierVertex(140,380, 175,382, 195,400);
vertex(185, 410);
bezierVertex(185,410, 170,398, 143,395);
vertex(140, 380);
endShape();
noFill();
//right hand
//right thumb
stroke(7, 8, 42, 255);
fill(7, 8, 42, 255);
beginShape();
vertex(189, 423);
vertex(174, 433);
vertex(185, 449);
vertex(182, 451);
bezierVertex(182,451, 185,458, 194,451);
bezierVertex(194,451, 204,447, 194,432);
vertex(189, 423);
endShape();
//right fingers
beginShape();
vertex(174, 433);
vertex(162, 432);
vertex(150, 441);
vertex(135, 442);
vertex(131, 446);
vertex(161, 460);
vertex(165, 460);
vertex(185, 449);
vertex(174, 433);
endShape();
//right backhand
beginShape();
vertex(185, 410);
bezierVertex(185,410, 170,398, 143,395);
vertex(128, 440);
vertex(135, 442);
vertex(150, 441);
vertex(162, 432);
vertex(174, 433);
vertex(189, 423);
vertex(185, 410);
endShape();
noFill();
//right hand shadow
fill(0);
beginShape();
vertex(164, 432);
vertex(169, 443);
vertex(165, 445);
vertex(157, 437);
vertex(162, 432);
endShape();
noStroke();

//feet
//left foot
fill(7, 8, 42, 255);
beginShape();
vertex(425, 692);
bezierVertex(425,692, 448,713, 450,740);
bezierVertex(450,740, 451,756, 430,763);
bezierVertex(430,763, 383,776, 360,735);
bezierVertex(360,735, 355,729, 367,703);
vertex(425, 692);
endShape();
//right foot
beginShape();
vertex(157, 683);
bezierVertex(157,683, 130,710, 130,735);
bezierVertex(130,735, 130,755, 160,759);
bezierVertex(160,759, 200,765, 220,733);
bezierVertex(220,733, 224,722, 212,700);
vertex(157, 683);
endShape();
noFill();

//legs
//right lower leg
//sm rectangle
stroke(5, 60, 87, 255);
fill(5, 60, 87, 255);
beginShape();
vertex(270, 522);
vertex(261, 553);
bezierVertex(261,553, 225,565, 189,535);
vertex(197, 502);
bezierVertex(197,502, 220,535, 270,522);
endShape();
//right top
beginShape();
vertex(197, 502);
bezierVertex(197,502, 220,535, 270,522);
bezierVertex(270,522, 282,516, 261,505);
vertex(260, 510);
bezierVertex(260,510, 225,519, 211,495);
vertex(212, 490);
bezierVertex(212,490, 190,490, 197,502);
endShape();
noFill();
//right lower leg cuff
fill(5, 60, 87, 255);
beginShape();
vertex(220, 690);
bezierVertex(220,690, 170,703, 155,670);
vertex(158, 690);
bezierVertex(158,690, 170,711, 209,703);
vertex(220, 690);
endShape();
noFill();
//lg rectangle
stroke(7, 8, 42, 255);
fill(7, 8, 42, 255);
beginShape();
vertex(260, 557);
bezierVertex(260,557, 220,570, 188,540);
vertex(155, 670);
bezierVertex(155,670, 167,704, 220,690);
vertex(260, 557);
endShape();
noFill();
//right lower leg band
stroke(5, 60, 87, 255);
fill(5, 60, 87, 255);
beginShape();
vertex(261, 552);
bezierVertex(261,552, 225,565, 189,534);
bezierVertex(189,534, 185,535, 188,540);
bezierVertex(188,540, 215,569, 260,558);
bezierVertex(260,558, 264,555, 261,552);
endShape();
noFill();
//left lower leg
//sm rectangle
fill(5, 60, 87, 255);
beginShape();
vertex(320, 527);
vertex(328, 561);
bezierVertex(328,561, 380,570, 400,547);
vertex(394, 514);
bezierVertex(394,514, 360,540, 320,527);
endShape();
//left top
beginShape();
vertex(394, 514);
bezierVertex(394,514, 360,540, 320,527);
bezierVertex(320,527, 309,521, 327,512);
vertex(328,515);
bezierVertex(328,515, 360,525, 378,505);
vertex(378, 503);
bezierVertex(378,503, 401,503, 394,514);
endShape();
noFill();
//left lower leg cuff
fill(5, 60, 87, 255);
beginShape();
vertex(360, 695);
bezierVertex(360,695, 395,705, 427,680);
vertex(423, 696);
bezierVertex(423,697, 400,715, 370,707);
vertex(360, 695);
endShape();
noFill();
//lg rectangle
stroke(7, 8, 42, 255);
fill(7, 8, 42, 255);
beginShape();
vertex(329, 566);
bezierVertex(329,566, 376,574, 402,553);
vertex(427, 680);
bezierVertex(427,680, 401,705, 360,695);
vertex(329, 566);
endShape();
noFill();
//left lower leg band
stroke(5, 60, 87, 255);
fill(5, 60, 87, 255);
beginShape();
vertex(328, 560);
bezierVertex(328,560, 380,570, 401,545);
bezierVertex(401,545, 407,551, 402,554);
bezierVertex(402,553, 376,575, 329,566);
bezierVertex(329,566, 325,565, 328,560);
endShape();
noFill();
//right upper leg
noStroke();
fill(220);
beginShape();
vertex(240, 408);
vertex(211, 495);
bezierVertex(211,495, 225,518, 260,510);
vertex(280, 446);
bezierVertex(280,446, 270,420, 240,408);
endShape();
//left upper leg
beginShape();
vertex(357, 418);
vertex(378, 505);
bezierVertex(378,505, 360,525, 328,515);
vertex(310, 445);
bezierVertex(310,445, 330,420, 357,418);
endShape();
noFill();
//briefs
fill(7, 8, 42, 255);
beginShape();
vertex(362, 369);
bezierVertex(362,369, 300,354, 235,360);
vertex(237, 380);
bezierVertex(237,380, 230,408, 246,412);
vertex(273, 441);
bezierVertex(275,440, 288,460, 315,440);
vertex(355, 420);
bezierVertex(355,420, 363,420, 364,400);
vertex(362, 375);
vertex(362, 369);
endShape();
noFill();

//shin guards
//right shin guard
fill(217, 32, 32, 255);
beginShape();
vertex(246, 455);
bezierVertex(246,455, 235,515, 270,525);
bezierVertex(270,525, 250,520, 229,560);
vertex(180, 690);
vertex(203, 585);
bezierVertex(203,585, 223,515, 190,495);
bezierVertex(190,495, 225,510, 246,455);
endShape();
//left shin guard
beginShape();
vertex(347, 460);
bezierVertex(347,460, 366,515, 400,510);
bezierVertex(400,510, 380,520, 382,560);
vertex(400, 693);
vertex(368, 585);
bezierVertex(368,585, 355,525, 320,529);
bezierVertex(320,529, 355,515, 347,460);
endShape();
//right shin guard accent
stroke(82, 12, 12, 255);
line(246,455, 224,525);
line(224,525, 180,690);
line(224,525, 270,525);
line(224,525, 190,495);
//left shin guard accent
line(347,460, 368,530);
line(368,530, 400,510);
line(368,530, 400,693);
line(368,530, 320,529);
noFill();
noStroke();

//chest plate
//chest plate outline
fill(207, 184, 14, 255);
beginShape();
vertex(308, 208);
vertex(330, 220);
vertex(355, 205);
vertex(375, 230);
vertex(385, 270);
vertex(395, 295);
vertex(390, 325);
vertex(365, 370);
bezierVertex(365,370, 300,355, 232,360);
vertex(232, 360);
vertex(215, 290);
vertex(215, 275);
vertex(235, 220);
vertex(265, 200);
vertex(280, 220);
vertex(308, 208);
endShape();
noFill();
//chest plate left eye
fill(127, 113, 22, 255);
beginShape();
vertex(320, 260);
vertex(340, 250);
bezierVertex(340,250, 365,255, 382,277);
vertex(370, 300);
vertex(336, 300);
vertex(326, 288);
vertex(320, 260);
endShape();
noFill();
//chest plate left eye inner eye
fill(35);
beginShape();
vertex(320, 260);
vertex(335, 255);
bezierVertex(335,255, 360,260, 373,278);
vertex(365, 300);
vertex(336, 300);
vertex(326, 288);
vertex(320, 260);
endShape();
noFill();
//chest plate right eye
fill(127, 113, 22, 255);
beginShape();
vertex(285, 255);
vertex(265, 245);
bezierVertex(265,245, 240,250, 225,265);
vertex(230, 290);
vertex(262, 295);
vertex(275, 284);
vertex(285, 255);
endShape();
noFill();
//chest plate right eye inner eye
fill(35);
beginShape();
vertex(285, 255);
vertex(270, 250);
bezierVertex(270,250, 250,255, 234,268);
vertex(237, 290);
vertex(262, 295);
vertex(275, 284);
vertex(285, 255);
endShape();
noFill();
//nose
//nose tip
stroke(127, 113, 22, 255);
beginShape();
vertex(301, 281);
vertex(326, 288);
vertex(336, 300);
vertex(321, 328);
vertex(275, 325);
vertex(262, 296);
vertex(275, 284);
vertex(301, 281);
endShape();
//nose tip shadow
noStroke();
fill(127, 113, 22, 255);
beginShape();
vertex(298, 322);
vertex(321, 328);
vertex(275, 325);
vertex(298, 322);
endShape();
//nose bridge upper
beginShape();
vertex(304, 245);
vertex(318, 250);
vertex(320, 260);
vertex(322, 247);
vertex(304, 240);
vertex(285, 244);
vertex(285, 255);
vertex(288, 248);
vertex(304, 245);
endShape();
//nose bridge lower
beginShape();
vertex(301, 277);
vertex(327, 284);
vertex(326, 288);
vertex(300, 281);
vertex(275, 284);
vertex(273, 280);
vertex(301, 277);
endShape();
noFill();
//nose bridge
fill(207, 184, 14, 255);
beginShape();
vertex(304, 245);
vertex(318, 250);
vertex(327, 284);
vertex(301, 277);
vertex(273, 280);
vertex(288, 248);
vertex(304, 245);
endShape();
noFill();
//inner mouth background
fill(35);
beginShape();
vertex(350, 367);
vertex(342, 400);
vertex(325, 415);
vertex(303, 414);
vertex(308, 372);
vertex(281, 370);
vertex(281, 395);
vertex(278, 413);
vertex(260, 413);
vertex(247, 395);
vertex(240, 360);
vertex(235, 360);
bezierVertex(235,360, 300,356, 350,367);
endShape();
noFill();
//inner mouth
fill(46, 40, 6, 255);
beginShape();
vertex(280, 433);
vertex(281, 413);
vertex(284, 395);
vertex(284, 374);
vertex(304, 375);
vertex(304, 380);
vertex(288, 379);
vertex(287, 405);
vertex(285, 423);
vertex(280, 433);
endShape();
noFill();
//mouth
fill(127, 113, 22, 255);
beginShape();
vertex(281, 413);
vertex(278, 413);
vertex(281, 395);
vertex(281, 370);
vertex(308, 372);
vertex(305, 397);
vertex(303, 414);
vertex(300, 414);
vertex(302, 397);
vertex(304, 375);
vertex(284, 374);
vertex(284, 395);
vertex(281, 413);
endShape();
noFill();
//left jaw
fill(207, 184, 14, 255);
beginShape();
vertex(363, 369);
bezierVertex(363,369, 350,425, 335,433);
vertex(327, 435);
vertex(300, 434);
vertex(300, 414);
vertex(325, 415);
vertex(342, 400);
vertex(350, 366);
vertex(363, 369);
endShape();
//right jaw
beginShape();
vertex(235, 359);
bezierVertex(235,359, 240,425, 260,432);
vertex(280, 433);
vertex(281, 413);
vertex(260, 413);
vertex(247, 395);
vertex(243, 358);
vertex(235, 359);
endShape();
noFill();
//teeth
//top left inner tooth
fill(130);
beginShape();
vertex(305, 361);
vertex(313, 375);
vertex(318, 395);
vertex(305, 361);
endShape();
//top right inner tooth
beginShape();
vertex(285, 360);
vertex(275, 370);
vertex(267, 392);
vertex(285, 360);
endShape();
noFill();
//top left tooth
fill(200);
beginShape();
vertex(335, 364);
vertex(328, 375);
vertex(318, 395);
vertex(313, 375);
vertex(305, 361);
vertex(335, 364);
endShape();
//top right tooth
beginShape();
vertex(285, 360);
vertex(275, 370);
vertex(267, 392);
vertex(260, 370);
vertex(255, 359);
vertex(285, 360);
endShape();
noFill();
//bottom left inner tooth
fill(130);
triangle(303,414, 313,398, 304,407);
//bottom right inner tooth
triangle(278,413, 270,397, 279,405);
noFill();
//bottom left tooth
fill(200);
triangle(303,414, 313,398, 322,415);
//bottom right tooth
triangle(261,413, 270,397, 278,413);
noFill();
//left lip
stroke(127, 113, 22, 255);
fill(207, 184, 14, 255);
beginShape();
vertex(321, 328);
vertex(345, 366);
vertex(321, 364);
vertex(295, 360);
vertex(321, 328);
endShape();
//right lip
beginShape();
vertex(275, 325);
vertex(295, 360);
vertex(268, 361);
vertex(248, 359);
vertex(275, 325);
endShape();
//left lip accent
line(321,328, 321,364);
//right lip accent
line(275,325, 268,361);
noFill();
}

