
//GERALD MORIN
//September 7th, 2012
//Kandinsky Painting
//Creative Computing F

size(450,208);
smooth();
background(0,0,0);
noStroke();


//Left Background
fill(51,51,32);
beginShape();
vertex(0,0);
vertex(246,0);
vertex(121,208);
vertex(0,208);
endShape(CLOSE);

//Left patchwork
//Shapes in descending order 
fill(283,182,77);
beginShape();
vertex(0,0);
vertex(7,0);
curveVertex(7,0);
curveVertex(7,0);
curveVertex(27,7);
curveVertex(27,7);
vertex(6,41);
vertex(0,38);
endShape(CLOSE);

fill(180,49,40);
beginShape();
vertex(0,38);
vertex(6,41);
vertex(0,60);
endShape(CLOSE);

fill(214,147,102);
beginShape();
curveVertex(27,7);
curveVertex(27,7);
curveVertex(61,21);
curveVertex(61,21);
vertex(45,57);
vertex(6,41);
endShape(CLOSE);

fill(221,187,130);
beginShape();
vertex(6,41);
vertex(45,57);
vertex(37,78);
vertex(0,64);
vertex(0,60);
endShape(CLOSE);

fill(187,136,136);
beginShape();
vertex(0,64);
vertex(37,78);
vertex(22,113);
vertex(0,116);
endShape(CLOSE);

fill(213,204,150);
beginShape();
curveVertex(61,21);
curveVertex(61,21);
curveVertex(100,32);
curveVertex(112,32);
curveVertex(112,32);
vertex(90,75);
vertex(45,57);
vertex(61,21);
endShape(CLOSE);

fill(148,178,170);
beginShape();
vertex(45,57);
vertex(65,65);
vertex(57,84);
vertex(37,78);
endShape(CLOSE);

fill(204,119,102);
beginShape();
vertex(65,65);
vertex(90,75);
vertex(80,93);
vertex(57,84);
endShape(CLOSE);

fill(219,173,81);
beginShape();
vertex(57,84);
vertex(80,93);
vertex(62,125);
vertex(22,113);
vertex(37,78);
endShape(CLOSE);

//Top Curve
//From left to Right

fill(144,151,141);
beginShape();
vertex(0,0);
vertex(104,0);
curveVertex(104,0);
curveVertex(104,0);
curveVertex(127,4);
curveVertex(127,4);
vertex(123,40);
curveVertex(123,40);
curveVertex(123,40);
curveVertex(95,34);
curveVertex(61,24);
curveVertex(20,8);
curveVertex(6,0);
curveVertex(6,0);
endShape(CLOSE);

fill(218,144,2);
beginShape();
curveVertex(127,4);
curveVertex(127,4);
curveVertex(202,6);
curveVertex(226,0);
curveVertex(226,0);
vertex(242,0);
vertex(214,44);
curveVertex(214,45);
curveVertex(214,45);
curveVertex(169,42);
curveVertex(122,40);
curveVertex(122,40);
endShape(CLOSE);

fill(183,106,8);
beginShape();
vertex(242,0);
vertex(251,0);
vertex(227,44);
vertex(213,44);
endShape(CLOSE);

fill(187,102,102);
beginShape();
vertex(251,0);
vertex(331,0);
curveVertex(331,0);
curveVertex(331,0);
curveVertex(329,9);
curveVertex(328,30);
curveVertex(322,45);
curveVertex(322,45);
vertex(227,44);
vertex(251,0);
endShape(CLOSE);

//Left most vertical
//top organge included in previous segment
//descending order

fill(60,117,51);
beginShape();
curveVertex(213,44);
curveVertex(213,44);
curveVertex(205,52);
curveVertex(203,55);
curveVertex(198,60);
curveVertex(183,81);
curveVertex(174,94);
curveVertex(174,94);
vertex(207,96);
curveVertex(213,83);
curveVertex(223,55);
curveVertex(227,44);
curveVertex(227,44);
endShape(CLOSE);

fill(60,117,51);
beginShape();
vertex(174,94);
vertex(93,208);
vertex(148,208);
vertex(206,96);
endShape(CLOSE);

//red stripe

fill(188,1,0);
beginShape();
vertex(90,75);
vertex(174,95);
vertex(160,114);
vertex(160,114);
vertex(81,93);
endShape(CLOSE);

fill(180,76,43);
beginShape();
curveVertex(174,95);
curveVertex(174,95);
curveVertex(190,96);
curveVertex(207,94);
curveVertex(207,94);
curveVertex(193,119);
curveVertex(193,119);
curveVertex(170,117);
curveVertex(159,115);
curveVertex(159,115);
endShape(CLOSE);

fill(76,36,13);
beginShape();
curveVertex(207,94);
curveVertex(207,94);
curveVertex(223,95);
curveVertex(238,90);
curveVertex(238,90);
vertex(238,120);
curveVertex(238,120);
curveVertex(238,120);
curveVertex(219,121);
curveVertex(193,120);
curveVertex(193,120);
endShape(CLOSE);

//Following horizontal 

fill(206,134,132);
beginShape();
curveVertex(0,106);
curveVertex(0,106);
curveVertex(73,127);
curveVertex(114,135);
curveVertex(114,135);
vertex(114,157);
curveVertex(114,157);
curveVertex(114,157);
curveVertex(76,149);
curveVertex(0,127);
curveVertex(0,127);
endShape(CLOSE);

fill(142,152,172);
beginShape();
vertex(114,135);
vertex(141,141);
vertex(129,159);
vertex(114,157);
endShape(CLOSE);

fill(55,101,127);
beginShape();
vertex(141,141);
vertex(180,144);
vertex(168,167);
vertex(129,159);
endShape(CLOSE);

fill(102,136,84);
beginShape();
curveVertex(180,144);
curveVertex(180,144);
curveVertex(232,147);
curveVertex(252,144);
curveVertex(252,144);
vertex(256,175);
curveVertex(256,175);
curveVertex(256,175);
curveVertex(216,173);
curveVertex(168,167);
curveVertex(168,167);
endShape(CLOSE);

//small Slashes
fill(202,204,168);
beginShape();
vertex(8,208);
vertex(47,141);
vertex(56,143);
vertex(16,208);
endShape(CLOSE);

beginShape();
vertex(112,134);
vertex(127,106);
vertex(131,108);
vertex(117,134);
endShape(CLOSE);

fill(218,173,108);
beginShape();
vertex(0, 149);
vertex(0,126);
vertex(8,129);
endShape(CLOSE);

//rainbow cup
fill(187,153,153);
beginShape();
vertex(247,74);
vertex(298,74);
vertex(295,81);
vertex(248,81);
endShape();

fill(218,175,45);
beginShape();
vertex(248,81);
vertex(295,81);
vertex(294,88);
vertex(248,87);
endShape();

fill(183,106,8);
beginShape();
vertex(248,87);
vertex(294,88);
vertex(292,95);
vertex(248,94);
endShape(CLOSE);

fill(142,152,172);
beginShape();
vertex(248,94);
vertex(292,95);
vertex(292,100);
vertex(248,101);
endShape();

fill(204,136,132);
beginShape();
vertex(248,101);
vertex(292,100);
vertex(292,107);
vertex(248,107);
endShape();

fill(221,187,120);
beginShape();
vertex(248,107);
vertex(292,107);
vertex(292,113);
vertex(248,114);
endShape();

fill(187,119,127);
beginShape();
vertex(248,114);
vertex(292,113);
vertex(291,120);
vertex(248,120);
endShape(CLOSE);

fill(170,153,153);
beginShape();
vertex(248,120);
vertex(291,120);
vertex(290,127);
vertex(248,127);
endShape(CLOSE);

//right wormy thing
//2 colors
fill(214,147,102);
beginShape();
vertex(341,16);
vertex(367,16);
curveVertex(367,16);
curveVertex(367,16);
curveVertex(369,32);
curveVertex(369,57);
curveVertex(369,57);
vertex(369,57);
vertex(369,57);
vertex(341,57);
curveVertex(341,57);
curveVertex(342,43);
curveVertex(340,30);
curveVertex(341,7);
curveVertex(341,7);
endShape(CLOSE);

beginShape();
vertex(341,57);
vertex(368,98);
curveVertex(368,98);
curveVertex(368,98);
curveVertex(363,127);
curveVertex(354,148);
curveVertex(354,148);
vertex(327,137);
curveVertex(327,137);
curveVertex(327,137);
curveVertex(336,113);
curveVertex(340,95);
curveVertex(340,95);
vertex(340,97);
vertex(341,59);
endShape();

beginShape();
vertex(307,174);
vertex(325,195);
curveVertex(325,195);
curveVertex(325,195);
curveVertex(321,205);
curveVertex(312,208);
curveVertex(312,208);
vertex(312,208);
vertex(275,208);
curveVertex(275,208);
curveVertex(275,208);
curveVertex(291,191);
curveVertex(305,175);
curveVertex(305,175);
endShape(CLOSE);

fill(209,187,177);
beginShape();
curveVertex(343,0);
curveVertex(343,0);
curveVertex(370,0);
curveVertex(370,0);
curveVertex(369,8);
curveVertex(367,16);
curveVertex(367,16);
vertex(367,16);
vertex(341,17);
curveVertex(341,15);
curveVertex(341,15);
curveVertex(343,6);
curveVertex(343,0);
curveVertex(343,0);
endShape(CLOSE);

beginShape();
curveVertex(369,57);
curveVertex(369,57);
curveVertex(370,78);
curveVertex(368,98);
curveVertex(368,98);
vertex(340,96);
vertex(341,57);
endShape(CLOSE);

beginShape();
curveVertex(354,149);
curveVertex(354,149);
curveVertex(345,171);
curveVertex(325,196);
curveVertex(325,196);
vertex(306,176);
curveVertex(306,176);
curveVertex(306,176);
curveVertex(318,155);
curveVertex(327,138);
curveVertex(327,138);
endShape(CLOSE);

//Random Rectangles
//moving from left to right
//top to bottom

fill(180,79,76);
beginShape();
vertex(88,104);
vertex(94,107);
vertex(90,115);
vertex(84,111);
endShape(CLOSE);

beginShape();
vertex(167,187);
vertex(172,193);
vertex(166,196);
vertex(162,192);
endShape(CLOSE);

fill(157,102,101);
beginShape();
vertex(391,7);
vertex(398,7);
vertex(398,16);
vertex(391,16);
endShape(CLOSE);

beginShape();
vertex(409,84);
vertex(412,84);
vertex(412,87);
vertex(409,87);
endShape(CLOSE);

beginShape();
vertex(362,158);
vertex(376,155);
vertex(378,171);
vertex(361,172);
endShape(CLOSE);

beginShape();
vertex(355,208);
vertex(359,205);
vertex(363,208);
endShape(CLOSE);
