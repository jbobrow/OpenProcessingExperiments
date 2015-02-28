
size(640,480);
smooth();
strokeWeight(.5);
background(201,213,201);
noStroke();
fill(219,219,185);
rect(0,10,624,470);

//COLORS!!
color RED = color(195,51,50);
color WHITE = color(204,218,218);
color WHITEborder = color(194,198,175);
color BLUE = color(42,70,135);
color LIGHTGREEN = color(25,105,68);
color GREEN = color(40,80,56);
color YELLOW = color(243,183,50);
color LIGHTBLUE = color(0,102,164);
color ORANGE = color(230,127,69);
//END COLORS!!!!

//tiny flag at bottom left
fill(LIGHTBLUE);
quad(221,423, 244,414, 244,426, 221,433);
fill(YELLOW);
quad(221,433, 244,426, 244,438, 221,440);
fill(RED);
quad(221,440, 244,438, 244,448, 221,448);

//bright blue thing on the bottom
fill(80,180,220);
rect(0,477, 300,4);
fill(BLUE);
rect(90,425, 22, 53);

//yellow swoop on left and grey block on it
fill(YELLOW);
beginShape();
vertex(130,220);
vertex(153,210);
vertex(178,200);
vertex(215,188);
vertex(243,184);
vertex(273,184);
vertex(293,186);
vertex(286,211);
vertex(262,209);
vertex(236,209);
vertex(209,214);
vertex(183,220);
vertex(132,233);
endShape(CLOSE);

fill(150,150,130);
rect(114,162, 23,70);
rect(207,248, 25,80);


//yellow circle and wierd blue things below it
fill(YELLOW);
ellipse(198,126, 52,52);
fill(LIGHTBLUE);
quad(213,227, 269,227, 259,241, 222,241);
fill(BLUE);
rect(110,225, 18,44);

//large grey qaud on the left
fill(168,178,168);
quad(0,61, 28,8, 250,8, 0,247);

//odd looking blue thing on top right
fill(LIGHTBLUE);
beginShape();
vertex(65,15);
vertex(207,14);
vertex(164,32);
vertex(134,39);
vertex(118,41);
vertex(100,41);
vertex(102,38);
vertex(118,35);
vertex(122,31);
vertex(121,29);
vertex(116,26);
endShape(CLOSE);

//rects on left wall
fill(WHITE);
rect(0,190, 25,10);
fill(YELLOW);
rect(0,200, 25,10);
fill(BLUE);
rect(0,210, 25,10);
//orange circle on left
fill(ORANGE);
ellipse(11,314, 70,70);

fill(150,150,130);
rect(9,235, 53, 50);
rect(26,315, 17,57);
fill(BLUE);
rect(0,330, 41,6);

//blue quad under rays on right
fill(LIGHTBLUE);
quad(433,269, 570,169, 623,224, 559,269);
quad(570,169, 623,176, 623,224, 559,269);

//white and red flag, and blue bar covering it
fill(WHITE);
quad(328,363, 371,329, 371,380, 328,404);
fill(BLUE);
rect(282,411, 220, 6);

//green,white,red flag
fill(RED);
quad(431,262, 448,250, 446,385, 431,392);
fill(WHITE);
quad(415,277, 431,262, 431,392, 413,400);
fill(GREEN);
quad(399,292, 415,277, 413,400, 397,407);

//canada
fill(RED);
quad(328,404, 371,380, 371,419, 328,431);
rect(356, 368, 14, 29);
rect(401,368,14,29);

//small slanted blue quad near flags
fill(LIGHTBLUE);
quad(445,284, 458,283, 498,320, 484,321);

//lightblue cross thing on left
fill(LIGHTBLUE);
triangle(29,298, 482,329, 29,315);
quad(177,287, 270,295, 159,339, 107,339);

//white tetris-y thing at very back of top right
fill(WHITE);
rect(495,10, 30, 29);
rect(510,39, 15, 25);

//grey upright rectangle on far right
fill(152,164,152);
rect(567,32, 25, 176);

//yellow,green, and black rays on right
fill(YELLOW);
triangle(496,272, 623,77, 623,116);
fill(GREEN);
triangle(501,273, 623,123, 623,172);
fill(0);
triangle(502,278, 623,177, 623, 225);

//tiny red triangle on left
fill(RED);
triangle(610,223, 623,223, 623,241);

//large green quad
fill(LIGHTGREEN); 
quad(352,45, 469,15, 463,197, 347,213);

//brown bar overlapping green quad
fill(85,51,39);
quad(169,234, 477,154, 479,160, 171,238);


//tall grey rect near bottom right, starting on green quad
fill(152,164,152);
quad(359,198, 380,197, 375,342, 353,343);

//white quad on the above grey one
fill(WHITE);
quad(337,280, 395,238, 435,234, 368,282);

//small black triangles over flags
fill(0);
triangle(440,299, 459,309, 454,314);
triangle(418,276, 430,281, 425,286);
triangle(370,227, 383,234, 379,240);

//pink Arches on large green quad
fill(193,90,119);
beginShape();
vertex(327,97);
vertex(514,61);
vertex(515,102);
vertex(501,96);
vertex(489,93);
vertex(470,91);
vertex(452,92);
vertex(427,99);
vertex(418,105);
vertex(401,118);
vertex(391,112);
vertex(381,109);
vertex(368,109);
vertex(350,113);
vertex(333,123);
vertex(326,131);
endShape(CLOSE);

//small lightblue cross on green quad
fill(LIGHTBLUE);
rect(338,64, 59, 7);
rect(354,49, 5, 37);

//blue bar across top right
fill(BLUE);
quad(307,132, 623,42, 623,50, 309,137);

//blue bar over cross thing and under triangles
fill(BLUE);
quad(166,316, 419,255, 421,259, 168,320);

//green,purple, then green rects on the left
fill(GREEN);
rect(0,392, 30,10);
fill(79,70,125);
rect(43,392, 66,10);
fill(GREEN);
rect(123,390, 80,12);

//each triangle moves -18px left, 4px down
//1st Triangle line (starting at the top right)
int a1 = 595;
int b1 = 613;
int c1 = 602;
fill(RED);
quad(613,22, 623,20, 623,45, 620,56);
triangle(a1,26, b1,22, c1,60);
triangle(a1-18,30, b1-18,26, c1-18,64);
fill(WHITE);
stroke(WHITEborder);
triangle(a1-18*2,34, b1-18*2,30, c1-18*2,68);
noStroke();
fill(RED);
triangle(a1-18*3,38, b1-18*3,34, c1-18*3,72);
triangle(a1-18*4,42, b1-18*4,38, c1-18*4,76);
fill(BLUE);
triangle(a1-18*5,46, b1-18*5,42, c1-18*5,80);
fill(RED);
triangle(a1-18*6,50, b1-18*6,46, c1-18*6,84);
triangle(a1-18*7,54, b1-18*7,50, c1-18*7,88);
triangle(a1-18*8,58, b1-18*8,54, c1-18*8,92);
fill(BLUE);
triangle(a1-18*9,62, b1-18*9,58, c1-18*9,96);
//2nd Triangle line 
int a2 = 557;
int b2 = 98;
int c2 = 575;
int d2 = 94;
int e2 = 564;
int f2 = 134;
fill(BLUE);
triangle(a2,b2, c2,d2, e2,f2);
fill(RED);
triangle(a2-18*1,b2+4*1, c2-18*1,d2+4*1, e2-18*1,f2+4*1);
triangle(a2-18*2,b2+4*2, c2-18*2,d2+4*2, e2-18*2,f2+4*2);
fill(BLUE);
triangle(a2-18*3,b2+4*3, c2-18*3,d2+4*3, e2-18*3,f2+4*3);
fill(RED);
triangle(a2-18*4,b2+4*4, c2-18*4,d2+4*4, e2-18*4,f2+4*4);
triangle(a2-18*5,b2+4*5, c2-18*5,d2+4*5, e2-18*5,f2+4*5);
fill(WHITE);
stroke(WHITEborder);
triangle(a2-18*6,b2+4*6, c2-18*6,d2+4*6, e2-18*6,f2+4*6);
noStroke();
fill(RED);
triangle(a2-18*7,b2+4*7, c2-18*7,d2+4*7, e2-18*7,f2+4*7);
//3rd Triangle line 
int a3 = 563;
int b3 = 148;
int c3 = 581;
int d3 = 144;
int e3 = 571;
int f3 = 184;
fill(BLUE);
triangle(a3,b3, c3,d3, e3,f3);
fill(RED);
triangle(a3-18*1,b3+4*1, c3-18*1,d3+4*1, e3-18*1,f3+4*1);
triangle(a3-18*2,b3+4*2, c3-18*2,d3+4*2, e3-18*2,f3+4*2);
triangle(a3-18*3,b3+4*3, c3-18*3,d3+4*3, e3-18*3,f3+4*3);
fill(WHITE);
stroke(WHITEborder);
triangle(a3-18*4,b3+4*4, c3-18*4,d3+4*4, e3-18*4,f3+4*4);
noStroke();
fill(RED);
triangle(a3-18*5,b3+4*5, c3-18*5,d3+4*5, e3-18*5,f3+4*5);
triangle(a3-18*6,b3+4*6, c3-18*6,d3+4*6, e3-18*6,f3+4*6);
fill(BLUE);
triangle(a3-18*7,b3+4*7, c3-18*7,d3+4*7, e3-18*7,f3+4*7);
fill(RED);
triangle(a3-18*8,b3+4*8, c3-18*8,d3+4*8, e3-18*8,f3+4*8);
triangle(a3-18*9,b3+4*9, c3-18*9,d3+4*9, e3-18*9,f3+4*9);
triangle(a3-18*10,b3+4*10, c3-18*10,d3+4*10, e3-18*10,f3+4*10);
fill(BLUE);
triangle(a3-18*11,b3+4*11, c3-18*11,d3+4*11, e3-18*11,f3+4*11);
//4th Triangle line 
int a4 = 483;
int b4 = 227;
int c4 = 501;
int d4 = 223;
int e4 = 493;
int f4 = 262;
fill(BLUE);
triangle(a4,b4, c4,d4, e4,f4);
fill(RED);
triangle(a4-18*1,b4+4*1, c4-18*1,d4+4*1, e4-18*1,f4+4*1);
triangle(a4-18*2,b4+4*2, c4-18*2,d4+4*2, e4-18*2,f4+4*2);
fill(BLUE);
triangle(a4-18*3,b4+4*3, c4-18*3,d4+4*3, e4-18*3,f4+4*3);
fill(RED);
triangle(a4-18*4,b4+4*4, c4-18*4,d4+4*4, e4-18*4,f4+4*4);
triangle(a4-18*5,b4+4*5, c4-18*5,d4+4*5, e4-18*5,f4+4*5);
fill(WHITE);
stroke(WHITEborder);
triangle(a4-18*6,b4+4*6, c4-18*6,d4+4*6, e4-18*6,f4+4*6);
noStroke();
fill(RED);
triangle(a4-18*7,b4+4*7, c4-18*7,d4+4*7, e4-18*7,f4+4*7);
//5th Triangle line 
int a5 = 369;
int b5 = 311;
int c5 = 387;
int d5 = 307;
int e5 = 377;
int f5 = 347;
fill(BLUE);
triangle(a5,b5, c5,d5, e5,f5);
fill(RED);
triangle(a5-18*1,b5+4*1, c5-18*1,d5+4*1, e5-18*1,f5+4*1);
triangle(a5-18*2,b5+4*2, c5-18*2,d5+4*2, e5-18*2,f5+4*2);
triangle(a5-18*3,b5+4*3, c5-18*3,d5+4*3, e5-18*3,f5+4*3);
fill(WHITE);
stroke(WHITEborder);
triangle(a5-18*4,b5+4*4, c5-18*4,d5+4*4, e5-18*4,f5+4*4);
noStroke();
fill(RED);
triangle(a5-18*5,b5+4*5, c5-18*5,d5+4*5, e5-18*5,f5+4*5);
triangle(a5-18*6,b5+4*6, c5-18*6,d5+4*6, e5-18*6,f5+4*6);
fill(BLUE);
triangle(a5-18*7,b5+4*7, c5-18*7,d5+4*7, e5-18*7,f5+4*7);
fill(RED);
triangle(a5-18*8,b5+4*8, c5-18*8,d5+4*8, e5-18*8,f5+4*8);
triangle(a5-18*9,b5+4*9, c5-18*9,d5+4*9, e5-18*9,f5+4*9);
triangle(a5-18*10,b5+4*10, c5-18*10,d5+4*10, e5-18*10,f5+4*10);
fill(BLUE);
triangle(a5-18*11,b5+4*11, c5-18*11,d5+4*11, e5-18*11,f5+4*11);
//6th Triangle line 
int a6 = 289;
int b6 = 389;
int c6 = 307;
int d6 = 385;
int e6 = 297;
int f6 = 425;
fill(BLUE);
triangle(a6,b6, c6,d6, e6,f6);
fill(RED);
triangle(a6-18*1,b6+4*1, c6-18*1,d6+4*1, e6-18*1,f6+4*1);
triangle(a6-18*2,b6+4*2, c6-18*2,d6+4*2, e6-18*2,f6+4*2);
fill(BLUE);
triangle(a6-18*3,b6+4*3, c6-18*3,d6+4*3, e6-18*3,f6+4*3);
fill(RED);
triangle(a6-18*4,b6+4*4, c6-18*4,d6+4*4, e6-18*4,f6+4*4);
triangle(a6-18*5,b6+4*5, c6-18*5,d6+4*5, e6-18*5,f6+4*5);
fill(WHITE);
stroke(WHITEborder);
triangle(a6-18*6,b6+4*6, c6-18*6,d6+4*6, e6-18*6,f6+4*6);
noStroke();
fill(RED);
triangle(a6-18*7,b6+4*7, c6-18*7,d6+4*7, e6-18*7,f6+4*7);

noStroke();
//purple tetris-y block over large green quad
fill(79,70,125);
rect(403,160,29,29);
rect(403,130,14,30);

//yellow ramp-y thing near flags on right
fill(YELLOW);
quad(299,318, 314,308, 358,308, 358,317);

//brown bar at top
fill(85,51,39);
quad(12,128, 386,13, 391,22, 15,133);

//Large dark blue swoop on the right
fill(28,55,82);
beginShape();
vertex(314,8);
vertex(417,8);
vertex(541,72);
vertex(577,96);
vertex(599,115);
vertex(609,127);
vertex(623,154);
vertex(623,195);
vertex(613,205);
vertex(600,215);
vertex(553,242);
vertex(597,200);
vertex(606,186);
vertex(612,166);
vertex(613,151);
vertex(609,138);
vertex(603,128);
vertex(595,119);
vertex(562,95);
vertex(519,70);
vertex(461,46);
endShape(CLOSE);

//green thing below theat white thing
fill(LIGHTGREEN);
quad(526,481, 530,433, 580,455, 578,481);

//white quad at bottom right
fill(WHITE);
quad(498,481, 590,433, 618,435, 525,481);

//little blue circle
fill(BLUE);
ellipse(614,473,15,15);

//Baige circle chain at bottom right
fill(188,145,103);
int j = 474;
for(int i = 613; i >= 528; i=i-17){
  ellipse(i,j,10,10);
  j= j+2;
}

//small orange triangle at the bottom right
fill(ORANGE);
triangle(449,481, 461,464, 473,481);

//blue and yellow rectangles on bottom right
fill(BLUE);
quad(612,327, 623,327, 623,385, 610,386);
fill(YELLOW);
quad(557,373, 596,373, 596,387, 557,387);
quad(596,361, 617,361, 616,401, 596,400);

//white thing with red triangle on it
fill(WHITE);
quad(77,110, 297,85, 297,107, 77,132);
fill(RED);
triangle(264,116, 290,96, 289,136);

//outlines of squares and circle
stroke(0);
strokeWeight(2);
noFill();
rect(189,261,43,45);
rect(244,258,38,47);
rect(293,257, 40,49);
rect(145,213,40,31);
ellipse(60,418,54,23);

//red semi circles on left
stroke(RED);
beginShape();
vertex(0,74);
vertex(76,109);
vertex(154,159);
vertex(174,176);
vertex(190,194);
vertex(208,221);
vertex(220,248);
vertex(226,281);
vertex(226,290);
vertex(225,311);
vertex(222,323);
vertex(215,350);
vertex(199,388);
vertex(175,426);
vertex(166,437);
vertex(125,481);
endShape();

beginShape();
vertex(0,211);
vertex(90,242);
vertex(129,259);
vertex(155,273);
vertex(177,286);
vertex(195,299);
vertex(222,326);
vertex(234,340);
vertex(245,361);
vertex(250,375);
vertex(253,396);
vertex(252,414);
vertex(249,428);
vertex(244,442);

endShape();

