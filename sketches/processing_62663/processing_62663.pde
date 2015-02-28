
//   parameters
size  (640, 480);
smooth();
background(214, 210, 177);


// background shape
fill(187,199,176);
noStroke();
quad(0,0,   100,0,   100,85,   0,190);

fill(195,202,175);
quad(0,167,   640,207,   640,263,   0,246);

fill(187,199,176);
noStroke();
quad(0,0,   100,0,   100,85,   0,190);

quad(0,335,   420,280,   420,480,   0,480);
quad(420,280,   420,480,  640,480, 640, 310);

fill(30,98,66);
quad(346,44,  525,0, 515,278, 336,300);

// black lines

noFill();
stroke(0, 0, 0);
bezier(198, 6,  198, 6,  626, 75, 638, 148);

stroke(0, 0, 0);
bezier(178, 17,  178, 17,  365, 32, 640, 168);

stroke(0, 0, 0);
bezier(6, 181,  98, 201,  308, 331, 428,444);

stroke(0, 0, 0);
bezier(222, 140,  222, 140, 524, 224, 640,276);

stroke(0, 0, 0);
bezier(165,148,  219,148, 640,322, 640,322);

stroke(0, 0, 0);
bezier(238,178,  238,178, 462,98, 640,156);

stroke(0, 0, 0);
bezier(542,0,  552,41, 554,242, 480,375);

stroke(0, 0, 0);
bezier(553,137,  566,138, 609,168, 640,198);


// black line quad

noFill();
quad(132,38,  300,4,  295,262, 126,285);

noFill();
quad(174,428,  342,426,  342,480, 170,480);



line(338, 0, 16, 280);

line(16, 248, 230, 177);

line(230, 181, 320, 137);
line(335, 3, 332, 270);
line(290, 217, 290, 347);
line(204, 387, 640, 214);
line(170, 421, 640, 234);
line(523, 0, 311, 480);
line(559, 0, 559, 238);
line(328, 450, 640, 441);
line(489, 410, 640, 408);


noFill();
beginShape();
vertex(196, 96);
vertex(299, 92);
vertex(199, 99);
vertex(373, 99);
vertex(196, 104);
vertex(373, 107);
vertex(170, 114);
vertex(368, 114);
vertex(248, 119);
vertex(229, 127);
vertex(347, 123);
vertex(347, 127);
vertex(248, 131);
vertex(194, 140);
vertex(338, 131);
endShape();


rect(267, 212, 32, 50);
rect(210, 205, 43, 64);



// ellipes


ellipse(488, 140, 30, 30);
ellipse(407, 170, 30, 30);
ellipse(381, 193, 28, 28);


ellipse(405, 240, 28, 28);
ellipse(357, 256, 28, 28);
ellipse(428, 226, 28, 28);
ellipse(470, 212, 32, 32);
ellipse(501, 198, 32, 32);

ellipse(519, 185, 32, 32);

ellipse(318, 218, 30, 30);
ellipse(298, 287, 30, 30);
ellipse(332, 270, 30, 30);
ellipse(243, 50, 42, 25);
ellipse(248, 250, 30, 30);
ellipse(227, 261, 30, 30);
ellipse(253, 307, 29, 29);
ellipse(225, 319, 29, 29);

arc(290, 234, 30, 30,  TWO_PI-PI/2, TWO_PI);
arc(290, 234, 30, 30, 0, PI/2);

// pink shape

fill(#bd5b75);
noStroke();

beginShape();
vertex(306, 170);
bezierVertex(370, 118, 420,153, 420,153);
bezierVertex(481, 90, 592, 127, 592, 127);
vertex(592, 69);
vertex(306, 123);

endShape();

// blue bar across pink

fill(#2A4C95);
noStroke();
quad(275,175, 278,182, 640,81, 640,70);




// blue cross

stroke(#2581B5);
strokeWeight(7);
strokeCap(SQUARE);
line(352, 50, 352, 107);
line(325, 77, 414, 78);


//shape

fill(#C7D2D7);
noStroke();
quad(98,1, 158,0, 158,78,  98,78);

stroke(0,0,0);
strokeWeight(1);
line(139,0, 98,62);

fill(#887CA8);
noStroke();
triangle(158, 0, 158, 78, 104, 77);


fill(#27689D);
noStroke();
beginShape();
vertex(0, 0);
vertex(0, 36);
bezierVertex(66, 33, 119,0, 119,0);
endShape();


fill(#C53034);
noStroke();
beginShape();
vertex(0, 51);
bezierVertex(98, 45, 158,0, 158,0);
vertex(200, 0);
bezierVertex(126, 59, 0,64, 0,64);
endShape();


fill(#C53034);
noStroke();
beginShape();
vertex(201, 27);
bezierVertex(201, 27, 137,72, 0,78);
vertex(0,89);
bezierVertex(0, 89, 68,93, 200,62);
endShape();


fill(#C53034);
noStroke();
beginShape();
vertex(200, 81);
bezierVertex(200, 81, 158,97, 0,107);
vertex(0,111);
vertex(196,107);
endShape();

fill(#EEB843);
noStroke();
ellipse(112, 165, 77, 77);

fill(#DEE9E6);
noStroke();
quad(0,135, 263,105, 263,137,  0,168);


fill(#C53034);
noStroke();
triangle(251, 122, 212, 152, 252, 183);


fill(#53362B);
noStroke();
quad(388,0, 439,0, 0,130,  0,116);


fill(#EEB843);
noStroke();
beginShape();
vertex(256,261);
bezierVertex(256, 261, 157,228, 4,312);
vertex(16,333);
bezierVertex(16,333, 146,276, 243,301);
endShape();


fill(#91947F);
noStroke();
quad(0,222, 20,222, 18,327,  0,327);

noFill();
stroke(0, 0, 0);
strokeWeight(3);
line(4,421, 640, 228);

fill(#A1AD9E);
noStroke();
quad(357,276, 390,275, 373,480,  347,480);




// thick black line


noFill();
stroke(0,0,0);
strokeWeight(3);
bezier(0, 345,  81, 347,  569, 268, 640, 245);

noFill();
stroke(0,0,0);
strokeWeight(3);
bezier(0, 283,  64,282,  514,207, 640, 152);




noFill();
stroke(0, 0, 0);
strokeWeight(3);
line(4,276, 0,444);


noFill();
stroke(0, 0, 0);
strokeWeight(3);
line(186,145,188,365);


noFill();
stroke(0, 0, 0);
strokeWeight(3);
line(0,177,42,173);


noFill();
stroke(0, 0, 0);
strokeWeight(3);
line(80,208,73,352);

noFill();
stroke(0, 0, 0);
strokeWeight(3);
line(109,201,100,352);


noFill();
stroke(0, 0, 0);
strokeWeight(3);
quad(30,299,  94,299,   92,347,   30,347);

fill(#25529A);
noStroke();
quad(62,457,67,463,   446,370,  440,365);

// triangles


fill(#2A4784);
noStroke();
triangle(454, 69, 483, 61, 465, 130);

fill(#2A4784);
noStroke();
triangle(570, 43, 584, 100, 599, 37);

fill(#2A4784);
noStroke();
triangle(568, 141, 582, 196, 598, 134);

fill(#2A4784);
noStroke();
triangle(346,267, 360,322, 373,261);

fill(#2A4784);
noStroke();
triangle(461,243, 473,297, 489,237);


fill(#D3E1DB);
noStroke();
triangle(480, 159, 495, 214, 511, 152);

fill(#D3E1DB);
noStroke();
triangle(546, 224, 561,283, 576, 218);


fill(#B9332D);
noStroke();
beginShape(TRIANGLES);
vertex(483, 61);
vertex(497, 121);
vertex(513, 55);
vertex(513, 55);
vertex(525, 115);
vertex(543, 49);
vertex(543, 49);
vertex(554, 107);
vertex(570, 43);

vertex(599, 37);
vertex(612, 93);
vertex(626, 31);

vertex(626, 31);
vertex(640, 82);
vertex(640, 29);

vertex(454, 164);
vertex(466, 221);
vertex(480, 160);

vertex(511, 152);
vertex(525, 208);
vertex(539, 147);

vertex(539, 147);
vertex(553, 202);
vertex(568, 141);

vertex(598, 134);
vertex(612, 190);
vertex(625, 129);

vertex(625, 129);
vertex(640, 185);
vertex(640, 126);
 

vertex(373, 261);
vertex(387, 317);
vertex(403, 255);

vertex(403, 255);
vertex(417, 310);
vertex(431, 249);

vertex(431, 249);
vertex(444, 306);
vertex(461, 243);

vertex(489, 237);
vertex(501, 293);
vertex(517, 231);

vertex(517, 231);
vertex(531, 286);
vertex(546, 224);

vertex(576, 218);
vertex(592, 275);
vertex(607, 212);

vertex(607, 212);
vertex(621, 268);
vertex(636, 205);

vertex(636, 205);
vertex(640, 221);
vertex(640, 205);


endShape();


// on the top of triangles..

fill(#1C3D53);
noStroke();

beginShape();
vertex(335,0);
vertex(467,0);
vertex(640, 89);
vertex(640, 106);
bezierVertex(640, 106, 576,52, 335,0);

endShape();




// grey quad


fill(#939581);
noStroke();
quad(126,354, 168,354, 163,475, 120,475);


//blue shape corner

fill(#0D69A1);
noStroke();
beginShape();
vertex(0, 470);
vertex(0, 480);
vertex(80, 480);
vertex(219, 426);
vertex(80, 411);

endShape(CLOSE);



fill(#255F9E);
noStroke();
beginShape();
vertex(640,260);
vertex(640, 387);
vertex(472,384);
endShape(CLOSE);




// looks like a flag

fill(#2B5138);
noStroke();
beginShape();
vertex(417, 421);
vertex(417, 480);
vertex(442, 480);
vertex(442, 397);
endShape(CLOSE);

fill(#D2DDD5);
noStroke();
beginShape();
vertex(442, 397);
vertex(442, 480);
vertex(465,480);
vertex(466, 375);
endShape(CLOSE);

fill(#CA2F38);
noStroke();
beginShape();
vertex(466, 375);
vertex(466, 480);
vertex(489, 480);
vertex(489,354);
endShape(CLOSE);




//blue shape corner to right

fill(#0D69A1);
noStroke();
beginShape();
vertex(0, 437);
vertex(0, 460);
vertex(540, 474);

endShape(CLOSE);


fill(#DEF5F4);
noStroke();
beginShape();
vertex(414, 337);
vertex(472,331);
vertex(368, 406);
vertex(322, 401);

endShape(CLOSE);


fill(#25529A);
noStroke();
quad(62,457,67,463,   446,370,  440,365);


noFill();
stroke(0, 0, 0);
strokeWeight(3);
line(0,453, 352,440);



noFill();
stroke(0, 0, 0);
strokeWeight(3);
line(43,368, 43,450);


noFill();
stroke(0, 0, 0);
strokeWeight(3);
quad(100,372, 97,442, 163,440,  164,372);


noFill();
stroke(0, 0, 0);
strokeWeight(3);
quad(182,368, 182,440, 238,437,  240,365);

noFill();
stroke(0, 0, 0);
strokeWeight(3);
quad(256,368, 254,440, 314,440,  319,365);

noFill();
stroke(0, 0, 0);
strokeWeight(3);
line(94,480, 640,444);


fill(#25529A);
noStroke();
quad(486,406,508,406,   568,461,  547,464);



fill(#F3BA3E);
noStroke();
triangle(640, 273, 640, 297, 567, 386);

fill(#274C37);
noStroke();
triangle(640, 308, 640, 334, 573, 391);

fill(#1D2820);
noStroke();
triangle(640, 344, 640, 370, 574, 400);



//brown bar across

fill(#4C2A1B);
noStroke();
quad(67,329,  70,336,   539,217,  535,210);




// purple shape

fill(67,62,109);
noStroke();
beginShape();
vertex(424, 175);
vertex(445, 175);
vertex(445, 220);
vertex(467, 220);
vertex(467, 266);
vertex(424, 263);
endShape(CLOSE);

