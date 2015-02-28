
//repeated colors

color red = color(204, 0, 23);
color navy = color(9, 15, 29);

//background

size(640, 480);
background(235, 246, 242);
smooth();

//background lines

stroke(193, 204, 199);
strokeWeight(3);
line(-1, 88, 641, 440);
line(-1, 147, 605, 481);

//red shape upper left corner

fill(red);
stroke(red);
beginShape();
vertex(59, 0);
vertex(48, 98);
vertex(28, 97);
vertex(26, 121);
vertex(114, 130);
vertex(116, 106);
vertex(105, 105);
vertex(106, 92);
vertex(112, 92);
vertex(115, 71);
vertex(110, 70);
vertex(118, 0);
endShape(CLOSE);

//navy dominant shape

fill(navy);
stroke(navy);
beginShape();
vertex(0, 272);
vertex(19, 263);
vertex(27, 280);
vertex(167, 216);
vertex(159, 197);
vertex(209, 174);
vertex(206, 165);
vertex(250, 144);
vertex(241, 124);
vertex(253, 118);
vertex(250, 109);
vertex(258, 105);
vertex(262, 113);
vertex(270, 110);
vertex(267, 101);
vertex(311, 80);
vertex(317, 91);
vertex(340, 80);
vertex(334, 66);
vertex(374, 48);
vertex(399, 106);
vertex(392, 110);
vertex(415, 160);
vertex(387, 174);
vertex(394, 196);
vertex(386, 201);
vertex(390, 213);
vertex(374, 221);
vertex(376, 227);
vertex(329, 247);
vertex(325, 238);
vertex(354, 224);
vertex(350, 217);
vertex(262, 256);
vertex(254, 241);
vertex(84, 316);
vertex(85, 323);
vertex(65, 332);
vertex(62, 327);
vertex(52, 331);
vertex(56, 342);
vertex(32, 353);
vertex(-1, 285);
endShape(CLOSE);

//right three blocks

fill(45, 77, 112);
stroke(45, 77, 112);
quad(475, 79, 597, 153, 577, 185, 456, 112); //gray blue top box
fill(red);
stroke(red);
quad(475, 126.5, 551, 172, 545, 183, 468, 138); //red shape
fill(navy);
stroke(navy);
quad(496, 157, 505, 162, 501, 169, 492, 164); //navy cube

//navy isolated rectangle on under above

fill(navy);
quad(485, 199, 523, 187, 565, 321, 529, 332);

//numbered misc. cluster, pieces 1-9

noStroke(); 
fill(navy);
beginShape();
vertex(399, 341);
vertex(462, 324);
vertex(463, 330);  // 1
vertex(401, 347);
endShape(CLOSE);
fill(red);
beginShape();
vertex(457, 306);
vertex(473, 306);
vertex(473, 399);  // 2
vertex(457, 399);
endShape(CLOSE);
fill(red);
beginShape();
vertex(504, 341);
vertex(514, 338);  // 3
vertex(518, 354);
vertex(508, 357);
endShape(CLOSE);
fill(134, 146, 179);
beginShape();
vertex(493, 382);
vertex(559, 357);
vertex(565, 372); // 4
vertex(500, 397);
endShape(CLOSE);
fill(red);
noStroke();
beginShape();
vertex(553, 394);
vertex(570, 394);
vertex(570, 404); // 5
vertex(553, 404);
endShape(CLOSE);
fill(45, 77, 112);
beginShape();
vertex(558, 394);
vertex(563, 394);
vertex(563, 404); // 5 as well
vertex(558, 404);
endShape(CLOSE);
fill(66, 89, 130);
beginShape();
vertex(510, 456);
vertex(538, 423);
vertex(585, 461); // 6
vertex(569, 481);
vertex(541, 481);
endShape(CLOSE);
fill(55, 67, 93);
beginShape();
vertex(489, 432);
vertex(498, 437);
vertex(475, 481); // 7
vertex(465, 477);
endShape(CLOSE);
fill(navy);
beginShape();
vertex(416, 355);
vertex(426, 356);
vertex(417, 481); // 8
vertex(408, 481);
endShape(CLOSE);
fill(red);
beginShape();
vertex(390, 362);
vertex(399, 362);
vertex(399, 371); // 9
vertex(390, 371);
endShape(CLOSE);

//numbered misc. cluster, pieces 10-16

fill(navy);
beginShape();
vertex(331, 394);
vertex(354, 394);
vertex(354, 417); // 10
vertex(331, 417);
endShape(CLOSE);
fill(red);
beginShape();
vertex(341, 387);
vertex(344, 387);
vertex(344, 400); // 10 as well
vertex(341, 400);
endShape(CLOSE);
fill(66, 89, 130);
beginShape();
vertex(277, 289);
vertex(300, 280); // 11
vertex(336, 361);
vertex(314, 371);
endShape(CLOSE);
fill(navy);
beginShape();
vertex(230, 391);
vertex(248, 377); // 12
vertex(275, 409);
vertex(258, 423);
endShape(CLOSE);
fill(red);
beginShape();
vertex(238, 400);
vertex(256, 386);
vertex(259, 391); // 12 as well
vertex(242, 405);
endShape(CLOSE);
fill(134, 146, 179);
beginShape();
vertex(253, 405);
vertex(264, 396); // 12 as well
vertex(275, 409);
vertex(264, 418);
endShape(CLOSE);
fill(red);
beginShape();
vertex(189, 417);
vertex(291, 417);
vertex(291, 450); // 13
vertex(189, 450);
endShape(CLOSE);
fill(navy);
beginShape();
vertex(277, 459);
vertex(287, 459);
vertex(287, 469); // 14
vertex(277, 469);
endShape(CLOSE);
fill(134, 146, 179);
beginShape();
vertex(260, 481);
vertex(260, 472); // 14
vertex(333, 474);
vertex(333, 481);
endShape(CLOSE);

//bottom left stacked shape

fill(134, 146, 179);
quad(115, 435, 152, 408, 188, 457, 153, 483);

fill(66, 89, 130);
triangle(83, 481, 152, 430, 192, 481);

fill(53, 69, 92);
quad(121, 443, 129, 437, 163, 481, 150, 481);

fill(navy);
quad(117, 456, 126, 450, 149, 480, 135, 480);

fill(53, 69, 92);
triangle(83, 481, 117, 456, 135, 480);

fill(navy);
quad(66, 480, 98, 457, 104, 466, 83, 481);



