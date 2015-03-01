
//Brandon Brown 9-11-2014//

int y = 137;

/*void setup() {
  size(500,800);
}*/

smooth(8);
size(500,800);


fill(44,38,61);
rect(0,0,500,800);



//line pattern//
pushMatrix() ;
for (int i =0; i <9; i++) {
  

strokeWeight(2);
stroke(56,51,65);
beginShape();
vertex(0,57);
bezierVertex(24,57,24,71,49,71);
bezierVertex(74,71,74,57,99,57);
bezierVertex(124,57,124,71,149,71);
bezierVertex(174,71,174,57,199,57);
bezierVertex(224,57,224,71,249,71);
bezierVertex(274,71,274,57,299,57);
bezierVertex(324,57,324,71,349,71);
bezierVertex(374,71,374,57,399,57);
bezierVertex(424,57,424,71,449,71);
bezierVertex(474,71,474,57,500,57);
endShape();
translate(0, 60);

}
popMatrix() ; 

noStroke();


//end line pattern//

//planets//


fill(191,90,100);
beginShape();
vertex(50,99);
bezierVertex(50,102,48,105,44,105);
bezierVertex(41,105,38,102,38,99);
bezierVertex(38,96,41,93,44,93);
bezierVertex(48,93,50,96,50,99);
endShape();




/*void draw() {
  background();
ellipse(90,y++,18,18);
}*/

fill(166,255,181);
ellipse(90,137,18,18);

fill(136,124,138);
beginShape();
vertex(366,131);
bezierVertex(366,135,364,137,360,137);
bezierVertex(357,137,354,135,354,131);
bezierVertex(354,128,357,125,360,125);
bezierVertex(364,125,366,128,366,131);
endShape();


fill(136,124,138);
beginShape();
vertex(106,71);
bezierVertex(106,73,104,75,102,75);
bezierVertex(100,75,98,73,98,71);
bezierVertex(98,69,100,67,102,67);
bezierVertex(104,67,106,69,106,71);
endShape();


fill(136,124,138);
beginShape();
vertex(467,175);
bezierVertex(467,178,465,180,462,180);
bezierVertex(460,180,457,178,457,175);
bezierVertex(457,172,460,170,462,170);
bezierVertex(465,170,467,172,467,175);
endShape();


fill(136,124,138);
beginShape();
vertex(169,155);
bezierVertex(169,159,166,162,162,162);
bezierVertex(159,162,156,159,156,155);
bezierVertex(156,151,159,148,162,148);
bezierVertex(166,148,169,151,169,155);
endShape();


fill(136,124,138);
beginShape();
vertex(421,78);
bezierVertex(421,82,418,85,414,85);
bezierVertex(411,85,408,82,408,78);
bezierVertex(408,74,411,71,414,71);
bezierVertex(418,71,421,74,421,78);
endShape();


fill(255,227,137);
beginShape();
vertex(455,129);
bezierVertex(455,135,450,140,444,140);
bezierVertex(438,140,433,135,433,129);
bezierVertex(433,123,438,118,444,118);
bezierVertex(450,118,455,123,455,129);
endShape();


fill(136,124,138);
beginShape();
vertex(305,56);
bezierVertex(305,59,304,60,301,60);
bezierVertex(299,60,297,59,297,56);
bezierVertex(297,54,299,52,301,52);
bezierVertex(304,52,305,54,305,56);
endShape();


fill(127,205,238);
beginShape();
vertex(333,96);
bezierVertex(333,101,329,105,324,105);
bezierVertex(319,105,315,101,315,96);
bezierVertex(315,91,319,87,324,87);
bezierVertex(329,87,333,91,333,96);
endShape();


fill(255,255,255);
beginShape();
vertex(414,203);
bezierVertex(414,205,413,206,412,206);
bezierVertex(410,206,409,205,409,203);
bezierVertex(409,202,410,201,412,201);
bezierVertex(413,201,414,202,414,203);
endShape();


fill(255,255,255);
beginShape();
vertex(331,170);
bezierVertex(331,171,330,172,329,172);
bezierVertex(328,172,327,171,327,170);
bezierVertex(327,169,328,168,329,168);
bezierVertex(330,168,331,169,331,170);
endShape();


fill(255,255,255);
beginShape();
vertex(52,36);
bezierVertex(52,37,52,38,50,38);
bezierVertex(49,38,48,37,48,36);
bezierVertex(48,35,49,34,50,34);
bezierVertex(52,34,52,35,52,36);
endShape();


fill(255,255,255);
beginShape();
vertex(469,84);
bezierVertex(469,85,468,86,467,86);
bezierVertex(466,86,465,85,465,84);
bezierVertex(465,83,466,82,467,82);
bezierVertex(468,82,469,83,469,84);
endShape();


fill(255,255,255);
beginShape();
vertex(271,99);
bezierVertex(271,100,270,101,269,101);
bezierVertex(268,101,267,100,267,99);
bezierVertex(267,98,268,97,269,97);
bezierVertex(270,97,271,98,271,99);
endShape();


fill(255,255,255);
beginShape();
vertex(344,39);
bezierVertex(344,41,343,41,342,41);
bezierVertex(341,41,340,41,340,39);
bezierVertex(340,38,341,37,342,37);
bezierVertex(343,37,344,38,344,39);
endShape();


fill(255,255,255);
beginShape();
vertex(163,102);
bezierVertex(163,103,162,104,160,104);
bezierVertex(159,104,157,103,157,102);
bezierVertex(157,100,159,99,160,99);
bezierVertex(162,99,163,100,163,102);
endShape();


fill(255,255,255);
beginShape();
vertex(244,44);
bezierVertex(244,46,243,47,241,47);
bezierVertex(240,47,238,46,238,44);
bezierVertex(238,43,240,41,241,41);
bezierVertex(243,41,244,43,244,44);
endShape();


fill(255,255,255);
beginShape();
vertex(384,87);
bezierVertex(384,89,383,90,381,90);
bezierVertex(380,90,379,89,379,87);
bezierVertex(379,86,380,85,381,85);
bezierVertex(383,85,384,86,384,87);
endShape();


fill(255,255,255);
beginShape();
vertex(141,34);
bezierVertex(141,35,140,37,139,37);
bezierVertex(137,37,136,35,136,34);
bezierVertex(136,32,137,31,139,31);
bezierVertex(140,31,141,32,141,34);
endShape();


fill(255,255,255);
beginShape();
vertex(105,191);
bezierVertex(105,192,103,194,102,194);
bezierVertex(101,194,99,192,99,191);
bezierVertex(99,190,101,188,102,188);
bezierVertex(103,188,105,190,105,191);
endShape();


fill(255,255,255);
beginShape();
vertex(23,135);
bezierVertex(23,137,22,138,20,138);
bezierVertex(19,138,18,137,18,135);
bezierVertex(18,134,19,133,20,133);
bezierVertex(22,133,23,134,23,135);
endShape();


fill(255,255,255);
beginShape();
vertex(41,224);
bezierVertex(41,225,40,227,38,227);
bezierVertex(37,227,36,225,36,224);
bezierVertex(36,222,37,221,38,221);
bezierVertex(40,221,41,222,41,224);
endShape();


fill(255,255,255);
beginShape();
vertex(198,71);
bezierVertex(198,73,196,75,194,75);
bezierVertex(191,75,190,73,190,71);
bezierVertex(190,69,191,67,194,67);
bezierVertex(196,67,198,69,198,71);
endShape();


fill(255,255,255);
beginShape();
vertex(476,36);
bezierVertex(476,37,475,39,473,39);
bezierVertex(472,39,470,37,470,36);
bezierVertex(470,34,472,33,473,33);
bezierVertex(475,33,476,34,476,36);
endShape();


fill(255,227,137);
beginShape();
vertex(460,147);
vertex(426,113);
vertex(428,111);
vertex(462,145);
vertex(460,147);
endShape();

//end planets//

//foreground//


fill(84,188,232);
beginShape();
vertex(-900,673);
vertex(-1400,673);
vertex(-1400,565);
vertex(-900,565);
vertex(-900,673);
endShape();


fill(67,124,159);
beginShape();
vertex(-900,582);
vertex(-1400,582);
vertex(-1400,399);
vertex(-900,399);
vertex(-900,582);
endShape();


fill(50,59,85);
beginShape();
vertex(-900,486);
vertex(-1400,486);
vertex(-1400,229);
vertex(-900,229);
vertex(-900,486);
endShape();


fill(44,38,61);
beginShape();
vertex(-296,408);
vertex(-796,408);
vertex(-796,126);
vertex(-296,126);
vertex(-296,408);
endShape();


fill(98,91,116);
beginShape();
vertex(500,610);
bezierVertex(449,524,356,466,250,466);
bezierVertex(143,466,50,524,0,610);
vertex(0,800);
vertex(500,800);
vertex(500,610);
endShape();


fill(255,255,255);
beginShape();
vertex(18,790);
bezierVertex(203,599,236,352,236,352);
vertex(262,352);
bezierVertex(262,352,296,599,480,790);
vertex(18,790);
endShape();


fill(255,0,0);
beginShape();
vertex(107,1083);
bezierVertex(107,1129,70,1165,25,1165);
bezierVertex(-20,1165,-56,1129,-56,1083);
bezierVertex(-56,1038,-20,1001,25,1001);
bezierVertex(70,1001,107,1038,107,1083);
endShape();


fill(255,0,0);
beginShape();
vertex(91,1005);
bezierVertex(91,1027,73,1045,52,1045);
bezierVertex(30,1045,13,1027,13,1005);
bezierVertex(13,984,30,966,52,966);
bezierVertex(73,966,91,984,91,1005);
endShape();


fill(255,0,0);
beginShape();
vertex(141,1005);
bezierVertex(141,1025,125,1041,105,1041);
bezierVertex(85,1041,69,1025,69,1005);
bezierVertex(69,986,85,970,105,970);
bezierVertex(125,970,141,986,141,1005);
endShape();


fill(255,0,0);
beginShape();
vertex(177,937);
bezierVertex(177,945,170,952,161,952);
bezierVertex(153,952,146,945,146,937);
bezierVertex(146,928,153,922,161,922);
bezierVertex(170,922,177,928,177,937);
endShape();


fill(255,0,0);
beginShape();
vertex(25,1005);
bezierVertex(25,1019,13,1031,0,1031);
bezierVertex(-13,1031,-25,1019,-25,1005);
bezierVertex(-25,992,-13,980,0,980);
bezierVertex(13,980,25,992,25,1005);
endShape();


fill(255,0,0);
beginShape();
vertex(159,963);
bezierVertex(159,977,147,989,133,989);
bezierVertex(119,989,108,977,108,963);
bezierVertex(108,949,119,938,133,938);
bezierVertex(147,938,159,949,159,963);
endShape();


beginShape();
vertex(591,1388);
bezierVertex(804,1168,842,884,842,884);
vertex(872,884);
bezierVertex(872,884,910,1168,1122,1388);
vertex(591,1388);
endShape();


beginShape();
vertex(1133,1377);
bezierVertex(1086,1328,1043,1272,1007,1209);
bezierVertex(978,1159,952,1105,932,1049);
bezierVertex(903,972,890,906,887,882);
vertex(827,882);
bezierVertex(824,906,810,972,782,1049);
bezierVertex(761,1105,736,1159,707,1209);
bezierVertex(670,1272,628,1328,580,1377);
vertex(1133,1377);
endShape();


fill(228,242,168);
beginShape();
vertex(857,886);
bezierVertex(856,889,847,960,810,1059);
bezierVertex(789,1117,763,1172,733,1224);
bezierVertex(695,1288,651,1347,602,1398);
vertex(1112,1398);
bezierVertex(1062,1347,1018,1288,981,1224);
bezierVertex(951,1172,925,1117,903,1059);
bezierVertex(867,960,857,889,857,886);
endShape();


fill(255,255,255);
beginShape();
vertex(337,575);
bezierVertex(346,575,353,582,353,591);
bezierVertex(353,593,353,594,352,596);
bezierVertex(356,594,361,592,366,592);
bezierVertex(380,592,391,603,391,617);
bezierVertex(391,620,391,622,390,624);
bezierVertex(391,624,393,623,394,623);
bezierVertex(404,623,412,627,418,633);
bezierVertex(426,625,436,620,447,620);
bezierVertex(462,620,475,629,482,641);
bezierVertex(486,637,492,634,499,634);
vertex(499,800);
vertex(421,800);
bezierVertex(403,784,392,762,392,737);
bezierVertex(392,721,394,695,394,695);
bezierVertex(394,695,358,679,358,659);
bezierVertex(358,653,360,648,362,643);
bezierVertex(350,641,340,630,340,617);
bezierVertex(340,613,341,609,343,605);
bezierVertex(342,606,340,606,337,606);
bezierVertex(329,606,322,599,322,591);
bezierVertex(322,582,329,575,337,575);
endShape();


fill(255,255,255);
beginShape();
vertex(161,575);
bezierVertex(153,575,146,582,146,591);
bezierVertex(146,593,146,594,147,596);
bezierVertex(143,594,138,592,133,592);
bezierVertex(119,592,108,603,108,617);
bezierVertex(108,620,108,622,109,624);
bezierVertex(107,624,106,623,105,623);
bezierVertex(95,623,87,627,80,633);
bezierVertex(73,625,63,620,52,620);
bezierVertex(37,620,24,629,17,641);
bezierVertex(13,637,6,634,0,634);
vertex(0,800);
vertex(78,800);
bezierVertex(96,784,107,762,107,737);
bezierVertex(107,721,105,695,105,695);
bezierVertex(105,695,141,679,141,659);
bezierVertex(141,653,139,648,136,643);
bezierVertex(149,641,159,630,159,617);
bezierVertex(159,613,157,609,155,605);
bezierVertex(157,606,159,606,161,606);
bezierVertex(170,606,177,599,177,591);
bezierVertex(177,582,170,575,161,575);
endShape();


fill(228,242,168);
beginShape();
vertex(249,354);
bezierVertex(249,357,241,418,209,504);
bezierVertex(191,555,168,603,142,648);
bezierVertex(109,704,71,755,28,800);
vertex(471,799);
bezierVertex(428,755,390,704,357,648);
bezierVertex(331,603,308,555,290,504);
bezierVertex(258,418,250,357,249,354);
endShape();

//end foreground//

//ship//


fill(177,173,178);
beginShape();
vertex(342,227);
vertex(157,227);
vertex(196,181);
bezierVertex(198,180,199,179,201,179);
vertex(298,179);
bezierVertex(300,179,301,180,303,181);
vertex(342,227);
endShape();


fill(255,255,255);
beginShape();
vertex(416,338);
vertex(83,338);
vertex(155,255);
bezierVertex(156,254,158,253,160,253);
vertex(339,253);
bezierVertex(341,253,343,254,344,255);
vertex(416,338);
endShape();


fill(255,255,255);
beginShape();
vertex(274,140);
bezierVertex(274,140,269,119,249,119);
bezierVertex(229,119,225,140,225,140);
vertex(208,228);
vertex(291,228);
vertex(274,140);
endShape();


fill(255,120,133);
beginShape();
vertex(373,289);
vertex(344,255);
bezierVertex(343,254,341,253,339,253);
vertex(160,253);
bezierVertex(158,253,156,254,155,255);
vertex(126,289);
vertex(373,289);
endShape();


fill(177,173,178);
beginShape();
vertex(282,396);
vertex(217,396);
vertex(228,330);
vertex(271,330);
vertex(282,396);
endShape();


fill(44,38,61);
beginShape();
vertex(266,181);
vertex(263,156);
bezierVertex(263,155,260,143,249,143);
bezierVertex(239,143,236,154,236,156);
vertex(233,181);
vertex(249,171);
vertex(266,181);
endShape();


fill(208,206,209);
beginShape();
vertex(249,194);
vertex(198,227);
vertex(170,363);
vertex(249,363);
vertex(249,194);
endShape();


fill(239,239,240);
beginShape();
vertex(249,194);
vertex(301,227);
vertex(329,363);
vertex(249,363);
vertex(249,194);
endShape();


fill(255,120,133);
beginShape();
vertex(166,380);
vertex(149,380);
vertex(175,289);
vertex(185,289);
vertex(166,380);
endShape();


fill(255,120,133);
beginShape();
vertex(333,380);
vertex(350,380);
vertex(324,289);
vertex(314,289);
vertex(333,380);
endShape();


fill(255,120,133);
beginShape();
vertex(255,264);
bezierVertex(255,261,252,259,249,259);
bezierVertex(247,259,244,261,244,264);
bezierVertex(244,267,247,269,249,269);
bezierVertex(252,269,255,267,255,264);
endShape();


fill(153,149,153);
beginShape();
vertex(223,363);
vertex(221,372);
vertex(278,372);
vertex(276,363);
vertex(223,363);
endShape();


fill(255,120,133);
beginShape();
vertex(260,380);
vertex(239,380);
vertex(244,264);
vertex(255,264);
vertex(260,380);
endShape();


fill(255,255,255);
beginShape();
vertex(90,295);
vertex(83,295);
vertex(83,338);
vertex(90,338);
vertex(90,295);
endShape();


fill(255,255,255);
beginShape();
vertex(416,295);
vertex(409,295);
vertex(409,338);
vertex(416,338);
vertex(416,295);
endShape();


fill(228,242,168);
beginShape();
vertex(282,396);
bezierVertex(262,385,237,385,217,396);
vertex(282,396);
endShape();


fill(239,239,240);
beginShape();
vertex(324,289);
vertex(365,338);
vertex(338,338);
vertex(324,289);
endShape();


fill(239,239,240);
beginShape();
vertex(175,289);
vertex(134,338);
vertex(161,338);
vertex(175,289);
endShape();


fill(169,221,243);
beginShape();
vertex(260,158);
bezierVertex(260,158,258,148,249,148);
bezierVertex(241,148,239,157,239,158);
bezierVertex(239,158,241,151,249,151);
bezierVertex(258,151,260,158,260,158);
endShape();

//end ship//

//text blue back//


fill(44,38,61);
beginShape();
vertex(132,779);
vertex(132,696);
vertex(153,696);
vertex(153,702);
vertex(140,702);
vertex(140,733);
vertex(152,733);
vertex(152,739);
vertex(140,739);
vertex(140,779);
vertex(132,779);
endShape();


fill(44,38,61);
beginShape();
vertex(179,779);
vertex(179,744);
bezierVertex(179,741,177,739,173,739);
vertex(168,739);
vertex(168,779);
vertex(160,779);
vertex(160,696);
vertex(174,696);
bezierVertex(179,696,181,696,183,697);
bezierVertex(185,699,186,701,186,705);
vertex(186,727);
bezierVertex(186,730,186,732,184,733);
bezierVertex(183,735,181,735,178,736);
vertex(178,736);
bezierVertex(184,736,187,739,187,744);
vertex(187,779);
vertex(179,779);
endShape();


fill(44,38,61);
beginShape();
vertex(195,766);
vertex(195,709);
bezierVertex(195,700,199,695,208,695);
bezierVertex(217,695,222,700,222,709);
vertex(222,766);
bezierVertex(222,775,217,780,208,780);
bezierVertex(199,780,195,775,195,766);
endShape();


fill(44,38,61);
beginShape();
vertex(251,696);
vertex(258,696);
vertex(258,779);
vertex(247,779);
vertex(237,705);
vertex(237,779);
vertex(230,779);
vertex(230,696);
vertex(241,696);
vertex(251,767);
vertex(251,696);
endShape();


fill(44,38,61);
beginShape();
vertex(273,779);
vertex(273,702);
vertex(264,702);
vertex(264,696);
vertex(289,696);
vertex(289,702);
vertex(281,702);
vertex(281,779);
vertex(273,779);
endShape();


fill(44,38,61);
beginShape();
vertex(296,779);
vertex(296,696);
vertex(304,696);
vertex(304,779);
vertex(296,779);
endShape();


fill(44,38,61);
beginShape();
vertex(312,779);
vertex(312,696);
vertex(332,696);
vertex(332,702);
vertex(320,702);
vertex(320,733);
vertex(332,733);
vertex(332,739);
vertex(320,739);
vertex(320,773);
vertex(332,773);
vertex(332,779);
vertex(312,779);
endShape();


fill(44,38,61);
beginShape();
vertex(359,779);
vertex(359,744);
bezierVertex(359,741,357,739,352,739);
vertex(347,739);
vertex(347,779);
vertex(340,779);
vertex(340,696);
vertex(354,696);
bezierVertex(358,696,361,696,363,697);
bezierVertex(365,699,366,701,366,705);
vertex(366,727);
bezierVertex(366,730,365,732,364,733);
bezierVertex(363,735,360,735,357,736);
vertex(357,736);
bezierVertex(363,736,366,739,366,744);
vertex(366,779);
vertex(359,779);
endShape();


fill(44,38,61);
beginShape();
vertex(191,681);
vertex(191,597);
vertex(198,597);
vertex(198,674);
vertex(211,674);
vertex(211,681);
vertex(191,681);
endShape();


fill(44,38,61);
beginShape();
vertex(244,681);
vertex(241,658);
vertex(227,658);
vertex(224,681);
vertex(216,681);
vertex(229,597);
vertex(239,597);
vertex(251,681);
vertex(244,681);
endShape();


fill(44,38,61);
beginShape();
vertex(273,619);
vertex(273,609);
bezierVertex(273,605,272,603,269,603);
bezierVertex(266,603,264,605,264,609);
vertex(264,617);
bezierVertex(264,620,265,623,266,625);
vertex(278,646);
bezierVertex(280,649,281,652,281,656);
vertex(281,669);
bezierVertex(281,677,277,681,269,681);
bezierVertex(260,681,256,677,256,669);
vertex(256,658);
vertex(264,658);
vertex(264,669);
bezierVertex(264,673,265,675,269,675);
bezierVertex(272,675,273,673,273,669);
vertex(273,657);
bezierVertex(273,654,273,652,271,649);
vertex(260,629);
bezierVertex(258,626,257,622,257,619);
vertex(257,609);
bezierVertex(257,600,261,596,269,596);
bezierVertex(277,596,281,600,281,608);
vertex(281,619);
vertex(273,619);
endShape();


fill(44,38,61);
beginShape();
vertex(295,681);
vertex(295,604);
vertex(287,604);
vertex(287,597);
vertex(312,597);
vertex(312,604);
vertex(303,604);
vertex(303,681);
vertex(295,681);
endShape();


fill(44,38,61);
beginShape();
vertex(223,569);
vertex(216,569);
vertex(216,567);
vertex(231,567);
vertex(231,569);
vertex(225,569);
vertex(225,582);
vertex(223,582);
vertex(223,569);
endShape();


fill(44,38,61);
beginShape();
vertex(254,575);
vertex(245,575);
vertex(245,582);
vertex(242,582);
vertex(242,567);
vertex(245,567);
vertex(245,573);
vertex(254,573);
vertex(254,567);
vertex(257,567);
vertex(257,582);
vertex(254,582);
vertex(254,575);
endShape();


fill(44,38,61);
beginShape();
vertex(270,567);
vertex(281,567);
vertex(281,568);
vertex(272,568);
vertex(272,573);
vertex(280,573);
vertex(280,575);
vertex(272,575);
vertex(272,580);
vertex(281,580);
vertex(281,582);
vertex(270,582);
vertex(270,567);
endShape();


//end text blue back//

//text green fill//

fill(228,242,168);
beginShape();
vertex(168,733);
vertex(173,733);
bezierVertex(177,733,179,731,179,727);
vertex(179,708);
bezierVertex(179,704,176,702,172,702);
vertex(168,702);
vertex(168,733);
endShape();


fill(228,242,168);
beginShape();
vertex(203,709);
vertex(203,766);
bezierVertex(203,771,205,774,208,774);
bezierVertex(212,774,214,771,214,766);
vertex(214,709);
bezierVertex(214,704,212,701,208,701);
bezierVertex(205,701,203,704,203,709);
endShape();


fill(228,242,168);
beginShape();
vertex(347,733);
vertex(352,733);
bezierVertex(356,733,358,731,358,727);
vertex(358,708);
bezierVertex(358,704,356,702,352,702);
vertex(347,702);
vertex(347,733);
endShape();


fill(228,242,168);
beginShape();
vertex(240,651);
vertex(234,603);
vertex(234,603);
vertex(228,651);
vertex(240,651);
endShape();

//end text green fill//



