
// a crop of zaha hadid's `malevich's tektonik`

// colours
//    blue 1 (24, 36, 108)
//    black (7, 7, 7)
//    blue 2 (89, 102, 137)
//    red (193, 5, 10)
//    blue 3 (110, 140, 168)
//    blue 4 (78, 109, 150)
//    blue 5 (27, 59, 83)
//    blue 6 (66, 96, 123)
//    blue 7 (75, 113, 145)
//    blue 8 (24, 60, 84)
//    white (218, 237, 235)

size(640, 480);
background(24, 36, 108);
smooth();
strokeWeight(.75);

// blue 8
fill(24, 60, 84);
noStroke();
beginShape();
  vertex(0, 258);
  vertex(2, 256);
  vertex(153, 318);
  vertex(181, 334);
  vertex(124, 341);
  vertex(0, 290);
endShape();

//blue 2
fill(89, 102, 137);
noStroke();


//beziers from bottom of curve up
bezier(408, 479, 413, 473, 429, 448, 433, 445);
quad(598, 208, 617, 188, 620, 192, 601, 212);

beginShape();
vertex(452, 404);
bezierVertex(450, 394, 449, 350, 449, 341);
bezierVertex(455, 331, 462, 318, 465, 315);
bezierVertex(468, 307, 485, 253, 502, 236);
bezierVertex(520, 214, 525, 206, 528, 198);
bezierVertex(534, 188, 542, 182, 543, 179);
bezierVertex(544, 176, 555, 169, 555, 165);
bezierVertex(566, 168, 567, 182, 568, 179);
bezierVertex(575, 172, 610, 166, 623, 130);
bezierVertex(622, 127, 626, 119, 611, 106);
bezierVertex(618, 100, 618, 81, 640, 70);
vertex(640, 480);
vertex(408, 480);

endShape();



//black
fill(7, 7, 7);
stroke(0);
strokeWeight(2);
beginShape();
vertex(460, 480);
bezierVertex(468, 463, 549, 227, 640, 171);
endShape();
triangle(460, 480, 640, 171, 640, 480);

strokeWeight(0.5);
// blue 6
fill(66, 96, 123);
beginShape();
  vertex(120, 354);
  vertex(244, 325);
  vertex(318, 365);
  vertex(270, 447);
  vertex(263, 448);
  vertex(280, 411);
  vertex(131, 360);
endShape();

//small blue 2 cover up


//blue 2
fill(89, 102, 137);
noStroke();
quad(598, 208, 617, 188, 620, 192, 601, 212);

beginShape();
vertex(563, 157);
bezierVertex(570, 152, 569, 147, 572, 142);
bezierVertex(575, 137, 586, 133, 593, 120);
bezierVertex(600, 111, 603, 115, 607, 115);
vertex(559, 69);
vertex(514, 114);
endShape();


//black
fill(7, 7, 7);
stroke(7, 7, 7);

beginShape();
  vertex(488, 126);
  vertex(519, 92);
  vertex(530, 105);
  vertex(521, 117);
  vertex(577, 170);
  vertex(616, 129);
  vertex(559, 74);
  vertex(546, 88);
  vertex(538, 79);
  vertex(566, 51);
  vertex(575, 58);
  vertex(567, 67);
  vertex(625, 121);
  vertex(630, 115);
  vertex(637, 116);
  vertex(637, 123);
  vertex(612, 151);
  vertex(636, 175);
  vertex(622, 185);
  vertex(599, 162);
  vertex(573, 190);
  vertex(565, 191);
  vertex(563, 182);
  vertex(568, 178);
  vertex(513, 123);
  vertex(499, 135);
endShape();


stroke(0);
// white
fill(218, 237, 235);
noStroke();
quad(549, 0, 617, 0, 536, 79, 503, 45);
quad(185, 346, 188, 339, 193, 340, 190, 348);

stroke(0, 255);
quad(495, 39, 548, 92, 533, 105, 479, 53);
quad(521, 20, 546, 46, 532, 59, 507, 33);
quad(630, 480, 515, 480, 354, 413, 373, 373);

quad(56, 314, 77, 313, 71, 328, 51, 329); // stroke ?

noStroke();
quad(0, 318, 180, 394, 160, 438, 0, 372);
quad(0, 377, 11, 382, 17, 371, 0, 370);
quad(193, 359, 269, 391, 223, 479, 156, 450);
quad(252, 374, 337, 409, 294, 510, 212, 475);
stroke(0);
quad(236, 368, 245, 371, 242, 378, 234, 375);
noStroke();
quad(337, 409, 346, 413, 330, 448, 322, 444);

stroke(0);
triangle(0, 301, 9, 305, 0, 334);

line(5, 351, 22, 358);
line(3, 356, 19, 363);
line(1, 377, 6, 363);
line(6, 363, 17, 368);
line(0, 363, 8, 340);
line(8, 340, 26, 348);
line(26, 348, 12, 382);
line(12, 382, 0, 377);
line(4, 320, 180, 394);
line(180, 394, 160, 438);
line(160, 438, 14, 377);
line(168, 420, 156, 450);
line(156, 450, 223, 479);
line(232, 479, 235, 472);

quad(235, 472, 264, 401, 252, 396, 222, 467);
line(258, 413, 207, 391);

quad(241, 422, 237, 432, 230, 429, 234, 419);
quad(153, 398, 173, 406, 170, 415, 149, 407);
quad(165, 409, 209, 428, 206, 435, 162, 417);
line(209, 428, 234, 438);
quad(193, 421, 201, 404, 215, 410, 207, 427);
quad(208, 400, 212, 401, 208, 411, 204, 410);

line(208, 387, 248, 404);
line(335, 415, 307, 480);
line(322, 445, 330, 449);
line(330, 449, 346, 413);




// blue 6
fill(66, 96, 123);
noStroke();
beginShape();
    vertex(236, 369);
    vertex(234, 375);
    vertex(225, 370);
    vertex(220, 380);
    vertex(204, 374);
    vertex(203, 374);
    vertex(174, 364);
    vertex(219, 301);
endShape();




// blue 3
fill(110, 140, 168);
noStroke();
quad(22, 209, 2, 256, 170, 324, 188, 279);

stroke(0);
quad(31, 243, 46, 250, 36, 252, 20, 245);

quad(50, 229, 60, 204, 74, 210, 63, 234);

noStroke();

beginShape();
  vertex(161, 322);
  vertex(202, 339);
  vertex(191, 340);
  vertex(150, 322);
endShape();

quad(291, 375, 306, 372, 317, 377, 303, 380);



// blacks !
stroke(0);
fill(0);
beginShape();
  vertex(0, 212);
  vertex(21, 209);
  vertex(0, 257);
endShape();

beginShape();
  vertex(31, 243);
  vertex(47, 205);
  vertex(49, 206);
  vertex(39, 230);
  vertex(53, 237);
  vertex(47, 251);
endShape();

beginShape();
  vertex(73, 205);
  vertex(81, 209);
  vertex(77, 217);
  vertex(69, 213);
endShape();

beginShape();
  vertex(174, 290);
  vertex(161, 322);
  vertex(150, 322);
  vertex(162, 291);
endShape();

beginShape();
  vertex(192, 297);
  vertex(205, 268);
  vertex(193, 270);
  vertex(183, 292);
endShape();

beginShape();
  vertex(124, 341);
  vertex(175, 334);
  vertex(186, 339);
  vertex(184, 346);
  vertex(121, 353);
endShape();

quad(52, 330, 72, 328, 108, 344, 92, 347);

quad(150, 381, 158, 359, 210, 382, 201, 404);

// blue 8

fill(24, 60, 84);
noStroke();
quad(40, 231, 50, 229, 63, 235, 52, 237);
quad(141, 392, 142, 389, 132, 389, 132, 393);

fill(0);
quad(132, 393, 141, 392, 149, 397, 140, 397);

// blue 4
stroke(78, 109, 150);
fill(78, 109, 150);
beginShape();
  vertex(161, 322);
  vertex(174, 290);
  vertex(192, 297);
  vertex(205, 268);
  vertex(287, 303);
  vertex(284, 310);
  vertex(271, 315);
  vertex(202, 339);
endShape();

quad(40, 230, 49, 206, 59, 204, 50, 229);

quad(60, 215, 63, 206, 72, 205, 69, 213);



// white
fill(255);
noStroke();
quad(60, 216, 71, 215, 77, 217, 67, 219);
quad(256, 310, 306, 331, 294, 362, 243, 342); // stroke ?

// blue 7
fill(75, 113, 145);
noStroke();
quad(123, 385, 151, 381, 200, 403, 173, 407);

quad(264, 448, 272, 446, 287, 409, 281, 409);

//blue 8
fill(24, 60, 84);
quad(141, 392, 142, 389, 132, 389, 132, 393);

// red
fill(193, 5, 10);
stroke(193, 5, 10);
quad(72, 328, 110, 343, 115, 328, 77, 313);
quad(19, 244, 35, 206, 46, 205, 31, 243);
quad(133, 361, 158, 359, 150, 381, 123, 385);
beginShape();
  vertex(192, 340);
  vertex(203, 339);
  vertex(213, 316);
  vertex(255, 313);
  vertex(244, 342);
  vertex(190, 347);
endShape();

quad(306, 371, 334, 304, 348, 308, 318, 377);

quad(340, 398, 368, 410, 326, 413, 303, 404);

quad(270, 445, 294, 457, 285, 460, 263, 448);

quad(141, 393, 143, 388, 152, 393, 150, 396);
noStroke();
quad(521, 20, 531, 30, 521, 38, 511, 28);


//black
fill(0);
noStroke();
quad(521, 49, 536, 34, 539, 38, 525, 52);

stroke(0);
quad(216, 350, 219, 343, 249, 355, 246, 362);
quad(232, 310, 237, 304, 255, 312, 239, 313);

beginShape();
  vertex(291, 373);
  vertex(306, 372);
  vertex(335, 304);
  vertex(319, 306);
endShape();

quad(259, 329, 281, 325, 296, 333, 276, 336);

beginShape();
    vertex(335, 302);
    vertex(339, 293);
    vertex(385, 288);
    vertex(339, 398);
    vertex(325, 400);
    vertex(300, 391);
    vertex(298, 392);
    vertex(296, 392);
    vertex(302, 380);
    vertex(317, 378);
    vertex(349, 309);
    endShape();

//white
noStroke();
fill(255);
quad(302, 342, 311, 341, 305, 338, 298, 340);

//blue 4
fill(78, 109, 150);
quad(311, 341, 305, 338, 308, 332, 314, 334);
quad(281, 325, 285, 312, 302, 320, 297, 333);

quad(259, 446, 265, 448, 257, 449, 254, 447);

//blue 8
fill(24, 60, 84);
noStroke();
quad(305, 338, 308, 332, 300, 333, 297, 339); 
quad(259, 329, 281, 325, 285, 312, 264, 314);

//blue 5
fill(27, 59, 83);
quad(341, 397, 369, 411, 414, 299, 387, 287);

quad(259, 446, 275, 410, 281, 410, 265, 448);
  

//black
fill(0);
stroke(0);
line(266, 480, 278, 457);
line(275, 480, 285, 460);
line(239, 399, 243, 390);
line(243, 390, 204, 374);
line(220, 392, 224, 382);
line(220, 379, 224, 371);
line(224, 371, 268, 391);

beginShape();
   vertex(269, 391);
   vertex(315, 411);
   vertex(294, 457);
   vertex(271, 446);
   vertex(288, 407);
   vertex(267, 398);
endShape();

quad(259, 446, 254, 447, 269, 411, 275, 410);

//blue 3
fill(110, 140, 168);
beginShape();
  vertex(259, 414);
  vertex(267, 398);
  vertex(294, 409);
endShape();


//blue 6
noStroke();
fill(66, 96, 123);
quad(300, 391, 330, 403, 327, 409, 297, 397);

