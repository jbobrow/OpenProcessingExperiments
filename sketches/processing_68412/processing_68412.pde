
//------------------------------
//
//  Author: Dervla McDonnell
//  EMSII Fall 2012
//  Assignment 2: Draw a Face
//
//------------------------------

//environment
size(500,500);
background(255,255,255);
//smooth();

//begin shirt
stroke(0,0,0);
strokeWeight(5);
fill(255,255,255);
beginShape();
vertex(44,500);
vertex(42,489);
vertex(49,436);
vertex(59,412);
vertex(150,350);
vertex(283,369);
vertex(299,382);
vertex(310,395);
vertex(321,404);
vertex(339,423);
vertex(341,458);
vertex(333,488);
vertex(329,500);
endShape();
//end shirt

//begin bottom of neck
fill(237,175,108);
beginShape();
vertex(268,387);
vertex(267,399);
vertex(270,402);
vertex(270,417);
vertex(269,420);
vertex(270,434);
vertex(273,453);
vertex(270,487);
vertex(242,453);
vertex(228,438);
vertex(208,426);
vertex(164,392);
vertex(139,357);
vertex(160,345);
endShape();
//end bottom of neck

//begin top of neck
beginShape();
vertex(160,345);
vertex(182,325);
vertex(196,313);
vertex(202,270);
vertex(303,326);
vertex(296,348);
vertex(275,383);
vertex(269,388);
vertex(264,397);
vertex(248,417);
vertex(244,427);
vertex(250,433);
endShape();
//end top of neck

//begin face
stroke(0,0,0);
strokeWeight(5);
beginShape();
vertex(168,248);
vertex(174,65);
vertex(361,111);
vertex(366,156);
vertex(372,171);
vertex(370,181);
vertex(357,190);
vertex(372,209);
vertex(389,236);
vertex(383,248);
vertex(369,250);
vertex(369,255);
vertex(369,259);
vertex(373,262);
vertex(372,268);
vertex(363,275);
vertex(367,283);
vertex(364,290);
vertex(352,298);
vertex(353,314);
vertex(346,330);
vertex(336,335);
vertex(308,333);
vertex(288,323);
vertex(266,315);
vertex(238,293);
vertex();
vertex();
vertex();
vertex();
vertex();
vertex();
vertex();
vertex();
vertex();
vertex();
vertex();
vertex();
vertex();
endShape();
//end face

//hair
fill(0, 0, 0);
noStroke();
beginShape();
vertex(151, 44);
vertex(162, 68);
vertex(191, 53);
vertex(270, 46);
vertex(375, 75);
vertex(407, 58);
vertex(401, 71);
vertex(389, 83);
vertex(385, 102);
vertex(358, 114);
vertex(376, 108);
vertex(382, 119);
vertex(376, 126);
vertex(376, 117);
vertex(354, 116);
vertex(340, 107);
vertex(327, 102);
vertex(333, 132);
vertex(316, 165);
vertex(324, 133);
vertex(321, 110);
vertex(313, 150);
vertex(305, 159);
vertex(276, 156);
vertex(252, 172);
vertex(254, 191);
vertex(257, 203);
vertex(235, 221);
vertex(215, 169);
vertex(208, 157);
vertex(195, 154);
vertex(183, 156);
vertex(178, 162);
vertex(177, 188);
vertex(188, 221);
vertex(197, 227);
vertex(203, 227);
vertex(214, 223);
vertex(208, 238);
vertex(215, 244);
vertex(223, 250);
vertex(232, 248);
vertex(227, 255);
vertex(220, 263);
vertex(206, 263);
vertex(220, 276);
vertex(235, 273);
vertex(230, 287);
vertex(220, 296);
vertex(186, 305);
vertex(166, 291);
vertex(159, 297);
vertex(157, 300);
vertex(160, 287);
vertex(145, 290);
vertex(151, 269);
vertex(150, 251);
vertex(132, 221);
vertex(119, 145);
vertex(126, 114);
vertex(141, 87);
vertex(136, 58);
vertex(150, 75);
vertex(151, 44);
endShape();
//end hair

//begin eyes
stroke(0,0,0);
strokeWeight(7);
line(340,185,327,221);
line(318,190,349,200);
//end eyes

//begin eyebrows
beginShape();
fill(0,0,0);
vertex(370,171);
vertex(339,171);
vertex(318,177);
vertex(340,181);
vertex(366,181);
vertex(372,171);
endShape();
//end eyebrows

//begin nose line
noFill();
strokeWeight(3);
beginShape();
vertex(372,249);
vertex(361,249);
vertex(352,247);
vertex(352,244);
vertex(351,236);
vertex(357,233);
endShape();
//end nose line

//begin blood
stroke(255,0,0);
strokeWeight(6);
line(360,252,360,263);
//end blood

//begin lip
fill(192,107,45);
stroke(0,0,0);
strokeWeight(3);
beginShape();
vertex(373,265);
vertex(357,271);
vertex(346,279);
vertex(360,277);
vertex(364,279);
vertex(372,273);
vertex(373,267);
endShape();
//end lip
