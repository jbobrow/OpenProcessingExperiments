
size(640, 480);

smooth();

background(219, 217, 200);


//big pink box
noStroke();
fill(198, 142, 135); 
quad(394, 54,   613, 54,    613, 329,    394, 329);

//upper left dark rect
fill(50);
quad(0, 0,   240, 0,    240, 69,   0, 69);



//lines
stroke(0);
strokeWeight(3);
line (0,344, 640, 357);



//top big grey
noStroke();
fill(194, 199, 189);
beginShape ();
vertex(77, 0);   
vertex(399, 0);  
vertex(402, 37);    
vertex (430, 115);
vertex(290, 110);
vertex (255, 104);
vertex(218, 91);
vertex (174, 69);
endShape();

//top right grey
beginShape ();
vertex(556, 0);   
vertex(640, 0);  
vertex(640, 114);    
vertex (608, 120);
vertex(558, 129);
vertex (489, 116);
vertex(499, 106);
vertex (527, 72);
vertex (535, 56);
endShape();

//tri grey
beginShape ();
vertex(640, 150);   
vertex(619, 151);  
vertex(606, 148);    
vertex (616, 160);
vertex(628, 172);
vertex (640, 170);
endShape();

//bottom right grey
quad(530, 313,   563, 480,  466, 480, 468, 320);

//mid bottom right grey
quad(364, 308,  419, 316,   414, 480, 322, 480);

//middle left grey
beginShape ();
vertex(294, 269);
vertex (311, 282);
vertex(217, 480);
vertex (99, 480);
vertex(168, 440);
vertex (199, 410);
vertex (229, 373);
vertex(245, 349);
endShape();

//bottom left side grey
beginShape ();
vertex(268, 231);   
vertex(280, 255);  
vertex(0, 413);    
vertex (0, 371);
vertex(57, 353);
vertex (157, 305);
vertex(213, 273);
endShape();

//mid left side grey
beginShape ();
vertex(277, 178);   
vertex(272, 201);  
vertex(237, 218);    
vertex (179, 251);
vertex(110, 277);
vertex (60, 292);
vertex(22, 302);
vertex (0, 305);
vertex(0, 233);
vertex(55, 230);
vertex(122, 221);
vertex(185, 205);
vertex(207, 199);
vertex(243, 189);
endShape();

//upper left grey
beginShape ();
vertex(321, 145);   
vertex(290, 162);  
vertex(215, 173);    
vertex (123, 177);
vertex(83, 180);
vertex (0, 176);
vertex(0, 59);
vertex (8, 66);
vertex(10, 66);
vertex(9, 63);
vertex(5, 57);
vertex(35, 73);
vertex(126, 105);
vertex(185, 119);
vertex(222, 128);
vertex(277, 138);
endShape();



//lines
stroke(8);
strokeWeight(4);
line(0, 365,   640, 371);
strokeWeight(3);
line (0, 344, 640, 357);
strokeWeight(4);
line(306, 300, 301, 478);
line(226, 445,  223, 370);
line(78, 335, 79, 367);
line (246, 332, 246, 369);
line(416, 335, 416, 371);
line (582, 335,   582, 372);

noStroke();

//lighter smaller pink quad
fill(222, 126, 153);
quad(450, 256,    533, 247,    530, 314,    447, 320); 

//left side green rect
fill(0, 135, 105);
quad(0, 160,   83, 160,    83, 212,    0, 212);

//upper rightish dark rect
fill (50, 54, 50);
quad(412, 0,    612, 0,    612, 35,   412, 35);

//top red square
fill(215, 76, 65);
quad(495, 0,   556, 0,    556, 54,    495, 54);

//right side top red square
quad(607, 39,    640, 39,   640, 74,    607, 74);

//right side bottom red quad
quad(609, 344,    640, 344,    640, 380,     597, 375);

//right side bottom purple rect
fill(115, 110, 150);
quad (558, 400,    640, 400,    640, 424,    558, 424);

//orange quad
fill (239, 144, 58);
quad(385, 367,   432, 367,   430, 414,   380, 411);

//yellow square
fill (253, 199, 67);
quad(57, 407,   97, 407,   97, 454,   57, 454);

//bottom left blue rect
fill(75, 120, 181);
quad (0, 470,    22, 470,    22, 480,   0, 480);

//bottom left blue triangle
triangle(0, 454,   63, 478,   0, 478);

//black circle on big salmon
fill(40);
ellipse(526, 214,   25, 25);

//blue dot in small bright pink
fill (71, 124, 183);
ellipse (465, 279,   28, 28);

//big middle-ish blue circle
ellipse (339, 306,   46, 46);

//blue dot on the orange square
ellipse(406, 370,   34, 34);

//light blue dot
fill(125, 177, 217);
ellipse(529, 395,   25, 25);

//red dot on the right
fill(234, 104, 65);
ellipse(632, 425,   23, 23);

//bottom middle blue circle
strokeWeight(3);
stroke(45, 71, 136);
fill(55, 103, 160);
ellipse(379, 456,   38, 38);

//big green circle
stroke(104, 104, 71); 
fill(120, 120, 92);
ellipse (263, 403,  43, 43);

//little blue dot on the bottom right
noStroke();
fill(71, 129, 189);
ellipse(565, 476, 23, 23);

//big pink half ellipse on the bottom left
fill(226, 159, 191);
ellipse (102, 483,    102, 68);

//bottom little green triangle
fill(58, 90, 75);
triangle(168, 461,   168,480,    136, 480);

//red rect bottom left
beginShape();
fill(188, 68, 55);
vertex(172, 306);
vertex(184, 305);
vertex(193, 313);
vertex(198, 480);
vertex(168, 480);
vertex(165, 314);
endShape();






//blue piece on grey
fill(80, 100, 133);
beginShape ();
vertex(243, 189);   
vertex(237, 218);  
vertex(203, 209);    
vertex (206, 201);
endShape();

//right black star
beginShape ();
fill(0);
vertex(548, 298);   
vertex(550, 306);  
vertex(556, 306);    
vertex (552, 310);
vertex(554, 315);
vertex (548, 312);
vertex(542, 317);
vertex (544, 311);
vertex(541, 307);
vertex(546, 306);
endShape();

//bottom black star
beginShape ();
vertex(390, 456);   
vertex(393, 465);  
vertex(401, 465);    
vertex (395, 470);
vertex(398, 478);
vertex (390, 474);
vertex(381, 479);
vertex (384, 471);
vertex (376, 465);
vertex(386, 464);
endShape();

//black dots
ellipse(375, 435,  6, 6);
ellipse (626, 84,   4, 4);



//arrow
stroke(8);
strokeWeight(4);
line(51, 205, 124, 255);
line(51, 205, 125, 156) ;


//thick line
strokeCap(ROUND);
strokeWeight(4);
line(640, 290, 604, 269);
line(604, 269, 558, 237);
line(558, 237, 405, 220);
line(405, 220, 314, 241);
line(314, 241, 129, 188);
line(129, 188, 98, 186);



//sunburst
stroke(218, 198, 155);
strokeWeight(2);
line(261, 117, 253, 178);
line(263, 146, 257, 177);
line(275, 131, 260, 178);
line(267, 180, 324, 48);
line(270, 182, 356, 16);
line(358, 49, 273, 184);
line (320, 125, 277, 186);
line(322, 139, 280, 188);
line(284, 191, 503, 0);
line(525, 0, 285, 195);
line(550, 0, 288, 197);
line(404, 119, 291, 199);
line (465, 121, 293, 205);
line(543, 100, 293, 205);
line(296, 210, 640, 95);
line(412, 182, 295, 213);
line(448, 200, 297, 219);
line(534, 218, 296, 224);
line(430, 241, 297, 231);
line(477, 275, 297, 234);
line(496, 293, 295, 239);
line(441, 293, 295, 245);
line(528, 334, 295, 247);
line(471, 329, 292, 248);
line(368, 291, 293, 248);
line(403, 319, 291, 251);
line(466, 395, 288, 257);
line(471, 422, 285, 257);
line(445, 420, 281, 259);
line(313, 314, 275, 263);
line(334, 371, 270, 270);
line(262, 268, 315, 420);
line(251, 276, 251, 379);
line(242, 277, 231, 283);
line(249, 277, 252, 381);
line(242, 276, 242, 338);
line(237, 276, 232, 381);
line(235, 276, 222, 391);
line(236, 275, 216, 360);
line(233, 274, 185, 426);
line(227, 271, 200, 324);
line(223, 267, 159, 375);
line(118, 419, 222, 267);
line(217, 265, 108, 397);
line(145, 333, 216, 263);
line(59, 402, 209, 256);
line(74, 366, 208, 258);
line(16, 393, 208, 257);
line(133, 303, 205, 250);
line(163, 275, 203, 249);
line(202, 247, 8, 325);
line(107, 275, 201, 243);
line(70, 275, 199, 242);
line(129, 251, 199, 240);
line(28, 256, 199, 236);
line(59, 236, 199, 228);
line(92, 218, 198, 223);
line(109, 211, 199, 221);
line(55, 189, 199, 221);
line(23, 164, 200, 214);
line(19, 141, 202, 211);
line(64, 143, 202, 209);
line(22, 106, 204, 204);
line(17, 80, 205, 203);
line(66, 98, 206, 200);
line(29, 49, 206, 201);
line(64, 66, 210, 195);
line(152, 124, 210, 195);
line(72, 0, 215, 190);
line(169, 85, 220, 184);
line(154, 13, 226, 180);
line(211, 68, 236, 179);
line(232, 0, 243, 178);
line(264, 0, 244, 177);

