
size(640, 480);
background(224, 210, 171);
smooth();

//pink rectangle
noStroke();
fill(201, 148, 158);
rect(95, 131, 102, 80);

//center orange triangle
fill(216, 106, 42);
quad(263, 222, 276, 248, 587, 51, 587, 51);


//whiteness
fill(255);
quad(263, 88, 310, 132, 557, -1, 431, -1);
quad(310, 132, 333, 152, 440, 100, 420, 72);


//39
fill(0);
quad(375, 213, 405, 260, 450, 230, 420, 183);

//44
strokeWeight(1);
fill(255);
quad(263, 88, 287, 110, 386, 56, 369, 32);

//10
fill(189, 201, 154);
quad(251, 128, 268, 156, 313, 134, 287, 110);

////middle circles

//orange circle
fill(226, 162, 19, 255);
stroke(0);
noStroke();
ellipse(223, 120, 125, 125);
//green circle
fill(181, 196, 175);
stroke(0);
strokeWeight(1);
ellipse(250, 120, 110, 110);
//red arc
fill(198, 103, 61);
strokeWeight(1);
bezier(252, 64, 325, 72, 318, 173, 252, 174);
//right arc of green circle
fill(181, 196, 175);
bezier(251, 64, 298, 86, 293, 152, 252, 175);
//orange circle outline
strokeWeight(3);
fill(0, 0);
bezier(225, 58, 305, 58, 305, 180, 225, 183);

//pink rectangle - right side
fill(224, 36, 36, 230);
stroke(0);
strokeWeight(.5);
quad(163, 131, 167, 209, 199, 209, 199, 131);


//tiny pink
fill(210, 72, 95);
quad(171, 170, 164, 211, 199, 208, 200, 156);

//tiny orange
fill(190, 75, 48);
quad(180, 164, 199, 180, 199, 157, 188, 164);


//orange circle all outline
fill(0, 0);
stroke(0);
strokeWeight(3);
ellipse(223, 120, 125, 125);

//2
fill(162, 100, 85);
quad(171, 170, 157, 143, 182, 130, 200, 156);

fill(40, 34, 38);
stroke(40, 34, 38);
quad(164, 139, 181, 164, 200, 156, 182, 130);
stroke(0);
bezier(164, 139, 165, 148, 174, 161, 179, 164);



//QUADS

//1
fill(224, 36, 36);
quad(130, 157, 146, 183, 171, 170, 157, 143);
//2
fill(185, 113, 45, 0);
quad(171, 170, 157, 143, 182, 130, 200, 156);
//3
fill(0, 0);
quad(182, 130, 200, 156, 221, 145, 205, 118);
//4
fill(172, 174, 127);
quad(205, 118, 221, 145, 251, 128, 232, 103);
//5
fill(68, 87, 85);
quad(251, 128, 232, 103, 263, 88, 287, 110);

//6
fill(255);
quad(146, 183, 171, 170, 189, 202, 164, 213);
//7
fill(0, 0);
quad(171, 170, 189, 202, 215, 185, 200, 156);
//8
fill(0, 0);
quad(200, 156, 215, 185, 235, 175, 221, 145);
//9
fill(137, 131, 91);
quad(221, 145, 235, 175, 268, 156, 251, 128);


//11
fill(0, 0);
quad(164, 213, 189, 202, 204, 224, 176, 237);
//12
fill(0);
quad(189, 202, 203, 225, 230, 210, 215, 185);
//13
fill(0, 0);
quad(215, 185, 230, 210, 250, 199, 235, 175);
//14
fill(0, 0);
quad(235, 175, 250, 199, 283, 179, 268, 156);
//15
fill(255);
quad(268, 156, 283, 179, 333, 152, 313, 134);
//16
fill(0);
quad(176, 237, 193, 263, 218, 249, 204, 224);
//17
fill(255);
quad(204, 224, 218, 249, 244, 231, 230, 210);
//18
fill(255);
quad(230, 210, 244, 231, 262, 221, 250, 199);
//19
fill(255);
quad(250, 199, 262, 221, 422, 136, 408, 113);
////20
fill(255);
quad(151, 292, 243, 442, 332, 378, 244, 231);
strokeWeight(2);
line(156, 291, 170, 314);
line(159, 288, 173, 311);
line(162, 285, 177, 309);
line(165, 282, 181, 307);
line(168, 279, 185, 305);
//
strokeWeight(1);
fill(224, 36, 36);
quad(190, 202, 199, 210, 199, 195, 189, 202);
//34
fill(255, 0);
quad(263, 88, 313, 134, 555, -1, 430, -1);
//35
fill(0, 230);
quad(422, 137, 408, 113, 445, 94, 462, 116);
//36
fill(0);
quad(491, 35, 506, 62, 534, 46, 519, 20);
//37                                           
fill(0);
quad(489, 111, 502, 133, 523, 119, 510, 98);
//38
fill(0);
quad(505, 148, 520, 172, 545.5, 155, 530, 131);
//39
strokeWeight(2);
fill(0, 0);
quad(375, 213, 405, 259, 445, 233, 420, 183);
//40
strokeWeight(1);
fill(0);
quad(411, 267, 431, 298, 468, 270, 450, 240);
//41
fill(216, 106, 42);
quad(273, 280, 395, 482, 404, 483, 289, 270);
//42
fill(216, 106, 42);
quad(253, 359, 333, 482, 352, 483, 274, 347);
//43
fill(216, 106, 42);
quad(275, 438, 304, 482, 319, 482, 289, 425);


//TEXTURES

//square 6
noSmooth();
strokeWeight(2);
int x = 150;
int y = 185;
line(x, y, x + 2, y + 3);
line(x + 8, y + 13, x + 4, y + 6);
line(x + 16, y + 26, x + 9, y + 13);
line(x + 6, y - 3, x + 12, y + 8);
line(x + 12, y - 6, x + 24, y + 16);
line(x + 20, y - 10, x + 33, y + 15);
line(x, y, x + 23, y - 10);
line(x + 3, y + 7, x + 23, y - 3);
line(x + 5, y + 14, x + 29, y + 3);
line(x + 10, y + 21, x + 32, y + 8);
line(x + 15, y + 25, x + 35, y + 13);

//square 30
smooth();
stroke(0);
strokeWeight(.9);
line(228, 310, 243, 332);
line(230, 308, 245, 329);
line(232, 306, 247, 327);
line(234, 304, 249, 325);
line(236, 303, 251, 323);
line(239, 302, 254, 321);
line(243, 301, 256, 320);

//square 28
fill(0);
quad(180, 340, 195, 365, 220, 350, 203, 325);

//square32
fill(0);
quad(234, 375, 250, 362, 235, 338, 220, 348);

//
fill(188, 55, 38);
quad(192, 482, 211, 484, 250, 457, 245, 443);

//square 26
smooth();
stroke(0);
strokeWeight(2);
point(200, 300); point(202, 302); 
point(204, 304); point(206, 306); 
point(208, 308); point(210, 310);
point(212, 312); point(214, 314);
point(200, 301); point(193, 302);
point(196, 302); point(205, 302);
point(208, 302); point(212, 302);
point(193, 306); point(196, 309);
point(199, 312); point(207, 312);
point(206, 309); point(202, 311);
point(212, 311); point(209, 311);
point(205, 311); point(201, 311); point(195, 312);
point(200, 305); point(200, 308); point(205, 314); point(206, 318);
point(209, 318); point(204, 321); point(201, 318); point(202, 315); 
point(218, 315); point(215, 310); point(212, 305); point(208, 295); 
point(205, 295); point(208, 298); point(205, 298); point(202, 296);

///square 15
smooth();
strokeWeight(3);
int a = 275;
int b = 156;
point(a, b); point(a + 2, b + 2); point(a + 5, b + 5); point(a + 8, b + 8);
point(a + 11, b + 11); point(a + 14, b + 14); point(a + 17, b + 17);
point(a - 1, b + 2); point(a - 3, b + 7);
point(a - 2, b + 4); point(a, b + 8); point(a + 3, b + 12);
point(a + 4, b + 16); point(a + 7, b + 19); point(a + 7, b + 12);
point(a + 8, b + 16); point(a + 11, b + 19); point(a + 14, b + 19);
point(a + 17, b + 19); point(a + 19, b + 19);
point(a + 20, b + 10); point(a + 23, b + 7);
point(a + 26, b + 4); point(a + 30, b + 4);
point(a + 30, b + 7); point(a + 35, b + 7);
point(a + 33, b + 7); point(a + 33, b + 3);
point(a + 33, b); point(a + 33, b - 3);
point(a + 33, b - 8); point(a + 33, b - 11);
point(a + 33, b - 13); point(a + 33, b - 17);
point(a + 28, b - 3); point(a + 27, b);
//
smooth();
point(290, 150); point(287, 157);
point(283, 157); point(283, 153);
point(290, 160); point(294, 164);
point(294, 169); point(295, 174);
point(293, 159); point(294, 156);
point(294, 150); point(298, 150);
point(294, 154); point(292, 147); point(294, 144);
point(300, 152); point(304, 153);
point(313, 155); point(317, 155);
point(313, 159); point(314, 148);
point(314, 144); point(300, 144);
point(318, 144); point(322, 148);
point(322, 152);

////top box
fill(238, 238, 240);
strokeWeight(3);
noStroke();
quad(369, 33, 388, 55, 420, 38, 402, 13);
stroke(55, 40, 45);
point(380, 35); point(385, 35); point(389, 35);
point(381, 36); point(384, 36); point(388, 37);
point(382, 37); point(385, 37); point(389, 38);
point(382, 40); point(385, 40); point(389, 40);
point(383, 44); point(387, 44);point(392, 43);

point(375, 30);
point(374, 34);

point(380, 32);
point(381, 28); point(384, 28);
point(382, 26);

point(394, 20); point(399, 19); point(404, 19);
point(394, 25); point(399, 26); point(404, 26);
point(394, 30); point(400, 32); point(404, 32);
point(394, 35); point(398, 37); point(404, 37);
point(394, 40); point(399, 43); point(404, 43);
point(394, 45); point(401, 45); point(404, 45);

point(390, 25);
point(389, 29);
point(390, 50);
point(390, 47);
point(387, 47);

point(409, 25);
point(409, 28);
point(409, 32);
point(409, 37); point(413, 37);

//square 22
stroke(0);
line(196, 264, 200, 268); 
line(200, 272, 215, 279);
line(203, 278, 214, 284);
line(205, 259, 211, 264);
line(204, 265, 216, 273);
line(212, 255, 229, 270);
line(215, 263, 225, 276);




//CIRCLES

fill(255, 255, 255, 0);

//circle in top left corner
smooth();
fill(231, 231, 207);
strokeWeight(2);
ellipse(33, 33, 62, 62);

strokeWeight(1);
ellipse(33, 33, 57, 57);

strokeWeight(1);
ellipse(33, 33, 51, 51);

strokeWeight(1);
fill(30, 73, 141);
ellipse(33, 33, 44, 44);

//bottom darker blue circle
fill(14, 73, 121, 230);
noStroke();
strokeWeight(0);
ellipse(288, 393.5, 119, 119);

stroke(0);

fill(0, 0);

//far right circle
fill(255);
strokeWeight(2.5);
ellipse(571, 108, 65, 65);

//light blue circle
fill(209, 182, 93);
strokeWeight(1.5);
ellipse(443, 75.3, 85, 85);
//
fill(63, 136, 179);
strokeWeight(.5);
ellipse(443, 75.3, 68, 68);

//below light blue circle
fill(180, 35, 48);
strokeWeight(1);
ellipse(448, 190, 87, 87);
//
fill(161, 149, 173);
strokeWeight(.5);
ellipse(446, 188, 79.5, 79.5);

//
fill(131, 93, 90);
noStroke();
quad(406, 192, 443, 229, 420, 184, 406, 190);
//
bezier(407, 192, 405, 211, 430, 228, 444, 229);


///black box on light blue circle
//
fill(78, 82, 120);
stroke(0);
strokeWeight(1);
quad(420, 108, 442, 120, 458, 112, 445, 94);
//
stroke(146, 75, 45);
strokeCap(SQUARE);
strokeWeight(8);
bezier(420, 106, 427, 115, 447, 119, 458, 110);





stroke(0);
strokeCap(ROUND);

strokeWeight(2.5);
line(265, 220, 585, 50);

line(260, 258, 585, 50);

strokeWeight(2.5);
line(130, 157, 430, 0);
line(130, 157, 319, 480);
line(147, 183, 495, -3);
line(163, 215, 560, -3);
line(178, 237, 445, 93);
line(445, 93, 460, 115);
line(265, 220, 193, 263);
line(193, 263, 152, 290);
line(150, 291, 268, 483);
line(157, 143, 353, 483);
line(193, 263, 335, 483);
line(173, 278, 305, 483);
line(183, 130, 395, 481);
line(205, 118, 405, 483);
line(233, 103, 282, 178);
line(263, 88, 334, 152);
line(370, 32, 386, 54);
line(403, 15, 420, 38);
line(274, 280, 420, 183);
line(167, 317, 231, 275);
line(181, 340, 244, 298);
line(196, 363, 258, 321);
line(211, 389, 282, 340);

fill(0, 0);
quad(195, 481, 548, 213, 555, 225, 213, 485);

fill(0);
quad(548, 213, 555, 225, 350, 380, 343, 368);




//lines in top left corner
strokeCap(SQUARE);
smooth();
stroke(0);
strokeWeight(2);
line(88, 0, 88, 84);
line(94, 0, 94, 84);

line(66, 60, 121, 60);
line(66, 64, 121, 64);
line(66, 68, 121, 68);


strokeCap(ROUND);
//STUFF in bottom left corner
//pink arc
noStroke();
fill(200, 96, 71);
ellipse(134, 437, 135, 135);
//between pink & yellow
fill(224, 210, 171);
stroke(0);
strokeWeight(.5);
ellipse(134, 437, 123, 123);
//yellow arc
fill(224, 180, 47);
noStroke();
ellipse(134, 437, 83, 83);
//pale blue arc
fill(211, 217, 229);
strokeWeight(.5);
stroke(109, 95, 94);
ellipse(134, 437, 75, 75);
//small black circle
fill(0);
noStroke();
ellipse(134, 437, 35, 35);
//dark green
fill(40, 69, 53);
noStroke();
quad(55, 360, 77, 481, 161, 481, 78, 345); 
//orange
fill(203, 134, 65);
quad(55, 360, 77, 481, 0, 480, 0, 395);

//lines and arcs on the left side
//carrot
stroke(0);
strokeWeight(1);
line(0, 130, 60, 170);
line(60, 170, 0, 143);
//
strokeCap(ROUND);
strokeWeight(2.5);
stroke(215, 111, 82);
line(-1, 240, 63, 205);
//
strokeWeight(1.5);
stroke(0);
line(-1, 243, 60, 208);
//green line
strokeCap(ROUND);
strokeWeight(4.5);
stroke(104, 112, 63);
line(-1, 281, 186, 384);
//yellow line
strokeCap(SQUARE);
strokeWeight(5);
stroke(227, 160, 16);
line(-1, 348, 117, 257);
//black line
strokeCap(ROUND);
strokeWeight(4);
stroke(0);
line(-1, 276, 180, 379);
//1st pink arc
strokeWeight(4);
stroke(194, 57, 49);
fill(0, 0);
bezier(-1, 295, 7, 295, 17, 300, 21, 308);
//2nd black arc
stroke(0);
strokeWeight(2);
bezier(21, 306, 0, 253, 51, 228, 81, 250);
//3rd black arc
bezier(86, 249, 73, 230, 93, 209, 113, 220);
//2nd & 3rd pink arcs
strokeWeight(4);
stroke(194, 57, 49);
bezier(21, 308, -5, 275, 36, 216, 83, 249);
bezier(83, 249, 70, 226, 94, 203, 116, 220);
//1st black arc
strokeWeight(3);
stroke(0);
noFill();
bezier(-1, 298, 6, 299, 13, 300, 20, 309);
strokeCap(ROUND);
stroke(0);
strokeWeight(3.5);
line(-1, 345, 115, 256);
//black line
stroke(0);
strokeCap(ROUND);
strokeWeight(3);
line(-1, 275, 114, 178);
//
strokeWeight(2);
line(-1, 305, 131, 181);
//
strokeWeight(3);
stroke(0);
line(-1, 169, 62, 392);

//circle in bottom left corner
strokeWeight(2);
fill(0);
ellipse(40, 440, 108, 108);

fill(255);
ellipse(40, 440, 88, 88);

fill(0);
ellipse(49, 439, 16, 16);

strokeWeight(2);
stroke(0);
fill(255);
bezier(126, 422, 105, 432, 123, 465, 142, 452);

///arcs around circle
//1st blue
fill(25, 75, 144);
noStroke();
quad(10, 398, 16, 403, 25, 399, 21, 391);
//yellow line
stroke(210, 177, 126);
strokeWeight(2);
line(25, 391, 27, 396);
line(29, 389, 31, 394);
strokeWeight(8);
strokeCap(SQUARE);
line(83, 418, 86, 423);
//2nd & 3rd blue
noFill();
stroke(25, 75, 144);
bezier(35, 391, 44, 390, 51, 391, 60, 395);
bezier(89, 432, 90, 434, 90, 445, 87, 453);



////candy corns
///1st
noStroke();
fill(216, 67, 47);
quad(-1, 412, -1, 422, 31, 430, 31, 430);
///2nd
quad(62, 453, 83, 481, 91, 481, 62, 453);
///3rd
quad(58, 420, 75, 402, 72, 401, 58, 420);
//
fill(255);
quad(74, 397, 79, 400, 92, 388, 86, 382);
//
fill(216, 67, 47);
quad(92, 388, 86, 382, 106, 358, 114, 365);
//
fill(0);
quad(113, 350, 122, 358, 158, 320, 149, 309);

///
quad(198, 467, 240, 482, 267, 482, 200, 459);



////tictacto
///quads
//
fill(219, 221, 233);
stroke(0);
strokeWeight(1);
quad(521, 339, 520, 380, 563, 381, 565, 339);
quad(563, 381, 563, 428, 609, 430, 610, 385);
//
fill(210, 158, 147);
quad(520, 380, 518, 426, 563, 428, 563, 381);
fill(191, 78, 80);
quad(565, 339, 563, 381, 610, 385, 610, 340);
///lines
stroke(0);
strokeWeight(3);
line(450, 337, 641, 340);
line(442, 380, 641, 385);
line(442, 423, 641, 430);
///
line(524, 278, 518, 481);
line(568, 278, 562, 481);
line(610, 278, 609, 481);

//
stroke(0);
strokeWeight(2);
line(445, 233, 420, 183);





