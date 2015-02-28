
//Jules Tran
//09/07/2012
//Divided  painting assignment 2
//Creative Computing section F

background(16,16,16);
size(356, 256);

//start:
//bands going from top to bottom; left to right

//sand color triangle
noStroke();
fill(169,135,99);
beginShape();
vertex(203,0);
vertex(217,0);
vertex(216,4);
endShape(CLOSE);

//top orange
fill(170,101,54);
beginShape();
vertex(187,0);
vertex(203,0);
vertex(216,4);
vertex(208,62);
vertex(180,58);
endShape(CLOSE);
 
//blue under
fill(84,107,116);
beginShape();
vertex(180,58);
vertex(208,62);
vertex(205,76);
vertex(180,72);
endShape(CLOSE);

//purple under
fill(168,101,121);
beginShape();
vertex(180,72);
vertex(202,76);
vertex(201,88);
vertex(179,85);
endShape(CLOSE);

//blue under
fill(84,107,116);
beginShape();
vertex(179,85);
vertex(202,87);
vertex(201,170);
vertex(174,171);
endShape(CLOSE);

//seafoam triangle under
fill(157,166,145);
beginShape();
vertex(174,171);
vertex(201,170);
vertex(176,180);
endShape(CLOSE);

//lightbrown under
fill(186,136,102);
beginShape();
vertex(176,180);
vertex(201,170);
vertex(200,186);
vertex(179,198);
endShape(CLOSE);

//light brown triangle under
fill(217,171,155);
beginShape();
vertex(200,186);
vertex(200,195);
vertex(187,194);
endShape(CLOSE);

//blue shape under
fill(84,107,116);
beginShape();
vertex(187,194);
vertex(200,195);
vertex(179,207);
vertex(178,198);
endShape(CLOSE);

//last purple under
fill(185,102,120);
beginShape();
vertex(179,207);
vertex(200,195);
vertex(207,256);
vertex(191,256);
endShape(CLOSE);

//new band, top to bottom, middle band

//green
fill(76,119,71);
beginShape();
vertex(247,60);
vertex(272,59);
vertex(277,69);
vertex(253,72);
endShape(CLOSE);

//white-ish under
fill(211,203,176);
beginShape();
vertex(253,72);
vertex(277,69);
vertex(283,83);
vertex(258,85);
endShape(CLOSE);

//larger green under
fill(76,119,71);
beginShape();
vertex(258,85);
vertex(283,83);
vertex(296,123);
vertex(278,130);
endShape(CLOSE);

//small yellow under
fill(219,186,103);
beginShape();
vertex(278,130);
vertex(296,123);
vertex(298,130);
vertex(281,136);
endShape(CLOSE);

//light blue under
fill(174,189,198);
beginShape();
vertex(281,136);
vertex(298,130);
vertex(301,143);
vertex(285,149);
endShape(CLOSE);

//yellow under
fill(219,186,103);
beginShape();
vertex(285,149);
vertex(301,143);
vertex(307,166);
vertex(291,166);
endShape(CLOSE);

//green under
fill(76,119,71);
beginShape();
vertex(291,166);
vertex(307,166);
vertex(310,199);
vertex(301,199);
endShape(CLOSE);

//purple under
fill(185,102,120);
beginShape();
vertex(301,199);
vertex(310,199);
vertex(316,256);
vertex(310,256);
endShape(CLOSE);

//new band, top to bottom, far right band

//light orange top shape
fill(204,110,78);
beginShape();
vertex(280,0);
vertex(300,0);
vertex(315,34);
vertex(303,32);
endShape(CLOSE);

//red under
fill(177,37,15);
beginShape();
vertex(303,32);
vertex(315,34);
vertex(321,53);
vertex(313,56);
endShape(CLOSE);

//darker teal under
fill(73,104,103);
beginShape();
vertex(313,56);
vertex(321,53);
vertex(326,63);
vertex(316,63);
endShape(CLOSE);

//purple under
fill(189,145,156);
beginShape();
vertex(316,63);
vertex(326,63);
vertex(330,79);
vertex(320,79);
endShape(CLOSE);

//lighter teal under
fill(103,136,120);
beginShape();
vertex(320,79);
vertex(335,78);
vertex(350,108);
vertex(327,116);
endShape(CLOSE);

//light pink rectangle under
fill(209,186,171);
beginShape();
vertex(327,116);
vertex(350,108);
vertex(356,122);
vertex(334,133);
endShape(CLOSE);

//lighter light teal under
fill(115,148,135);
beginShape();
vertex(334,133);
vertex(356,122);
vertex(356,166);
vertex(347,164);
endShape(CLOSE);

//small triangle last shape
fill(167,151,124);
beginShape();
vertex(347,164);
vertex(356,166);
vertex(356,180);
endShape(CLOSE);

//bands going from right to left; top to bottom

//start: top band
//tangerine rectangle
fill(214,142,11);
beginShape();
vertex(326,63);
vertex(356,59);
vertex(356,77);
vertex(330,79);
endShape(CLOSE);

//tangerine color after purple shape
fill(214,142,11);
beginShape();
vertex(277,69);
vertex(316,63);
vertex(320,79);
vertex(283,83);
endShape(CLOSE);

//orange rectangle after white-ish rect.
fill(206,105,43);
beginShape();
vertex(202,76);
vertex(253,72);
vertex(258,85);
vertex(201,88);
endShape(CLOSE);

//red rectangle
fill(186,24,13);
beginShape();
vertex(92,32);
vertex(180,72);
vertex(179,85);
vertex(94,48);
endShape(CLOSE);

//pink tip
fill(163,119,126);
beginShape();
vertex(83,21);
vertex(92,32);
vertex(94,48);
vertex(83,42);
endShape(CLOSE);

//from top to bottom; middle band

//small purple triangle
fill(163,119,126);
beginShape();
vertex(350,108);
vertex(356,105);
vertex(356,122);
endShape(CLOSE);

//large purple rectangle
fill(141,72,85);
beginShape();
vertex(298,130);
vertex(327,116);
vertex(334,133);
vertex(301,143);
endShape(CLOSE);

//small purple rectangle
fill(141,72,85);
beginShape();
vertex(270,141);
vertex(281,136);
vertex(285,149);
vertex(275,154);
endShape(CLOSE);

//darker yellow shape
fill(219,186,103);
beginShape();
vertex(201,170);
vertex(270,141);
vertex(275,154);
vertex(237, 168);
endShape(CLOSE);

//flesh pink shape
fill(237,181,139);
beginShape();
vertex(201,170);
vertex(237, 168);
vertex(200,186);
endShape(CLOSE);


//darker yellow shape
fill(219,186,103);
beginShape();
vertex(66,239);
vertex(176,180);
vertex(179,198);
vertex(70,255);
endShape(CLOSE);

//from top to bottom; last band

//burnt orange shape
fill(186,72,32);
beginShape();
vertex(328,165);
vertex(347,164);
vertex(356,180);
vertex(355,199);
vertex(328,200);
endShape(CLOSE);

//light light brown shape
fill(201,151,105);
beginShape();
vertex(307,166);
vertex(328,165);
vertex(328,200);
vertex(310,199);
endShape(CLOSE);

//light light brown shape after green
fill(201,151,105);
beginShape();
vertex(253,167);
vertex(291,166);
vertex(301,199);
vertex(286,197);
vertex(286,185);
vertex(253,185);
endShape(CLOSE);

//light dark brown shape
fill(186,136,102);
beginShape();
vertex(253,185);
vertex(286,185);
vertex(286,197);
vertex(253,197);
endShape(CLOSE);

//light flesh shape
fill(237,181,139);
beginShape();
vertex(202,195);
vertex(228,188);
vertex(253,185);
vertex(253,197);
vertex(253,197);
endShape(CLOSE);

//dark flesh pink shape
fill(205,120,103);
beginShape();
vertex(200,186);
vertex(237, 168);
vertex(253,167);
vertex(253,185);
vertex(228,188);
vertex(200,195);
endShape(CLOSE);

//salmon shape
fill(205,120,103);
beginShape();
vertex(120,170);
vertex(174,171);
vertex(176,180);
vertex(163,190);
vertex(118,183);
endShape(CLOSE);

//teal shape
fill(115,148,135);
beginShape();
vertex(52,153);
vertex(74, 163);
vertex(120, 170);
vertex(118,183);
vertex(109,181);
vertex(71,179);
vertex(52,174);
endShape(CLOSE);

//floating shapes from left to right

//red square
//light dark brown shape
fill(173,20,47);
beginShape();
vertex(78,200);
vertex(88,196);
vertex(89,208);
vertex(80,210);
endShape(CLOSE);

//yellow square
fill(215,200,115);
beginShape();
vertex(222,124);
vertex(247,119);
vertex(252,141);
vertex(228,144);
endShape(CLOSE);

//orange square
fill(228,84,42);
beginShape();
vertex(250,34);
vertex(268,29);
vertex(274,47);
vertex(255,51);
endShape(CLOSE);

//hot pink square
fill(196,48,68);
beginShape();
vertex(297,91);
vertex(306,91);
vertex(306,100);
vertex(297,101);
endShape(CLOSE);

//forest green triangle
fill(87,119,101);
beginShape();
vertex(120,0);
vertex(129,0);
vertex(123,4);
endShape(CLOSE);

//teal ellipse
fill(117,135,123);
ellipse(350,231,61,26);

//Top brown blob
fill(136,49,3);
beginShape();
vertex(217,0);
vertex(280,0);
vertex(303,32);
vertex(284,29);
vertex(216,4);
endShape(CLOSE);

//Top right brown blob
fill(136,49,3);
beginShape();
vertex(300,0);
vertex(356,0);
vertex(356,42);
vertex(315,34);
endShape(CLOSE);

//mysterious orange triangle
fill(241,151,131);
beginShape();
vertex(356,1);
vertex(356,9);
vertex(352,4);
endShape(CLOSE);

//far left bottom red blob
fill(183,6,0);
beginShape();
vertex(131,256);
vertex(159,219);
vertex(179,207);
vertex(191,256);
endShape(CLOSE);


//far right bottom red blob
fill(183,6,0);
beginShape();
vertex(200,195);
vertex(285,196);
vertex(285,222);
vertex(294,256);
vertex(207,256);
endShape(CLOSE);

//black spaces
fill(16,16,16);
beginShape();
vertex(214,241);
vertex(224,256);
vertex(216,256);
endShape(CLOSE);

fill(16,16,16);
beginShape();
vertex(247,239);
vertex(259,256);
vertex(252,256);
endShape(CLOSE);






