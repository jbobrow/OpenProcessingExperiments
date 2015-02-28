

size(640, 480);
background(217, 217, 183);
color red = color(215, 45, 58);

smooth();

strokeWeight(7);
stroke(194, 186, 157);
line(440, 78, 442, 286); //straight black line most left shadow --------
strokeWeight(.6);
stroke(0);
line(539, 187, 552, -1); //straight black line most right - A --------
strokeWeight(.4);
line(439, 78, 439, 286); //straight black line left of A --------

noStroke();
fill(190, 208, 184, 150);
quad(400, 147, 576, 153, 521, 217, 400, 217);

fill(22, 24, 27);
noStroke();
triangle(408, 116.6, 408, 292, 298, 273); //black shape top
quad(422, 294, 422, 326, 335, 388, 335, 294); //black shape bott

//BEGIN LINE PARTAYYY west side -------
strokeWeight(.6);
stroke(0);
line(123, 480, 123, 433);
line(90, 480, 90, 449);
line(70, 480, 70, 461);
line(39, 480, 39, 471);
line(44.7, 4, 161, 467);
noFill();
triangle(55, 464, 123, 458, 122, 428);
line(20, 472, 144, 472);

//begin line party midwest ------
stroke(0);
strokeWeight(.6);
line(318, 402, 319, 304);
line(299, 410, 299, 304);
line(288, 405, 289, 303);
line(234, 336, 334, 336);
line(243, 366, 243, 296);
line(266, 363, 266, 413);
line(356, 278, 356, 296); //teeny middle line under black shape
strokeWeight(1);
line(243, 299, 299, 299);
line(243, 363, 299, 363);
line(251, 406, 288, 406);

//3 bent black line -------
noFill();
strokeWeight(.6);
beginShape(); 
vertex(568, 153);
vertex(467, 138);
vertex(472, 268);
endShape();

fill(176, 187, 176);
noStroke();
bezier(0, 480, 225, 467, 500, 0, 812, -510 ); //left color gray field
triangle(0, 0, 448, 0, 0, 480); //fill up gray field






beginShape(POLYGON);
vertex(640, 53.1);
bezierVertex(640, 53.1, 431, 392, 161, 480); //right gray field
bezierVertex(436, 557, 521, 480, 640, 411); //right gray field curve 2
endShape();

//middle diagonal line
noFill();
stroke(0);
strokeWeight(3);
line(638, 210, -1, 276); 

stroke(23, 51, 125, 240);
strokeWeight(2.5);
fill(41, 76, 144, 253);
quad(270, 188, 407, 193, 334, 308, 219, 301); //blue quad in center
quad(0, 190, 0, 303, 61, 304, 97, 191); //blue quad on left

stroke(0);
strokeWeight(3);
line(556, 320, 551, 459); //slightly taller medium line - bottom right E
line(597, 322, 594, 458); //slightly taller medium line - bottom right F

//big green triangle
strokeWeight(2.5);
stroke(5, 43, 28);
fill(44, 80, 60);
triangle(514, 324, 577, 185, 608, 328); 

//bottom warmer gray block 
stroke(137, 140, 118);
strokeWeight(1); 
fill(151, 146, 132, 255);
beginShape();
vertex(270, 481);
vertex(272, 412);
vertex(163, 410);
vertex(162, 481);
endShape();

//red left corner rectangle - smaller 
noStroke(); 
fill(red);
beginShape();
vertex(436, 480);
vertex(436, 424);
vertex(522, 424);
vertex(522, 396);
vertex(404, 396);
vertex(401, 481);
endShape();

//red rectangle
beginShape(); 
vertex(218, 428);
vertex(338, 432);
vertex(338, 468);
vertex(218, 466);
endShape();

//red left corner rectangle - bigger
beginShape(); 
vertex(180, 471);
vertex(182, 412);
vertex(253, 414);
vertex(253, 373);
vertex(130, 369);
vertex(128, 468);
endShape();

//left most red rectangle
beginShape(); 
vertex(0, 423);
vertex(79, 424);
vertex(76, 429);
vertex(76, 450);
vertex(0, 451);
endShape();

//most bottom black curve
noFill();
stroke(0);
strokeWeight(3);
bezier(-229.3, 436, 229.3, 451.3, 481, 443.6, 846.2, 404.6); 

//thick left curve
noFill();
stroke(0);
strokeWeight(6);
bezier(-245.3, 627, 255, 303, 254, 322, -36, -524); 

//right red triangle
fill(195, 40, 49);
noStroke();
triangle(606, 102, 641, 85, 641, 102);

//main blue curve
noFill();
stroke(26, 63, 142);
strokeWeight(4);
bezier(0, 329, 341, 248, 640, 81, 928, -60); 

//red stake left
noStroke();
fill(red);
beginShape(); 
vertex(359, 19);
vertex(360, 12);
vertex(370, 12);
vertex(469, 82);
vertex(469, 90);
vertex(458, 90);
endShape();

//red stake right
noStroke();
fill(red);
beginShape(); 
vertex(398, 53);
vertex(360, 81);
vertex(360, 89);
vertex(373, 89);
vertex(406, 64);
endShape();

//top red circle
noStroke();
fill(red);
ellipse(413, 48, 41.5, 44); 

//upper right red quad
noStroke();
fill(red);
quad(415, 42, 476, -1, 498, -1, 438, 42);


noStroke();
fill(202, 216, 216);
rect(36, 0, 25, 116); //top left pale rect - right
rect(-17, 0, 25, 116);//top left pale rect - left


//upper right bent black line -------
stroke(0);
strokeWeight(.6);
noFill();
beginShape(); 
vertex(460, 49);
vertex(580, 74);
vertex(578, 140);
endShape();



//2 bent black line -------
noFill();
beginShape(); 
vertex(401, 143);
vertex(503, 129);
vertex(503, 223);
endShape();

//upper right thin black curves begin
bezier(640, 5, 640, 0, 508, 49, 441, 174);
bezier(521, 0, 543, 36, 563, 94, 563, 94);
bezier(694, 15, 640, 47, 577, 84, 542, 127);

line(631, 480, 608, 427); //bottom right thin diagonal -------
line(620, 480, 622, 427); //bottom right thin straight line -------

//BEGIN LINE PARTAYYY east side -------
line(591.5, 480, 640, 454);
line(597, 445, 640, 449);
line(596, 436, 640, 454);
line(640, 468, 620, 470);
line(563, 480, 552, 461);
line(545, 480, 552, 461);
line(529, 473, 565, 480);
line(441, 187, 499, 232);
line(403, 160, 444, 182);
line(480, 218, 524, 208);
line(403, 203, 427, 211);



//BEGIN LINE PARTAYYY midwest -------
//line(319.5, 397, 319.5, 308.5);
//line(298, 411, 299, 309);
//beginShape(); 
//vertex(289, 313);
//vertex(287, 404);
//vertex(251, 406);
//endShape();
//line(265, 408, 266, 364);
//line(245, 339, 331, 339);
//line(256, 362, 298, 339);
//line(357, 290, 357, 282);


stroke(43, 42, 27);
strokeWeight(3);
line(0, 92, 594, 23); //diagonal line that doesn't reach the end
stroke(0);
line(151, 322, 147, 478); //medium line - bottom left A
line(188, 316, 186, 481); //slightly taller medium line - bott left B
line(152, 344, 187, 345); //line that connects ^ A & B

line(350, 303, 347, 478); //slightly taller medium line - bottom right C
line(384, 472, 388, 307); //medium line - bottom right D
line(352, 332, 387, 331); //line that connects ^ C & D

//little aqua triangle
fill(0, 146, 110);
noStroke();
triangle(361, 329, 404, 300, 404, 357); 

//brown curve
noFill();
stroke(117, 61, 50);
strokeWeight(20);
bezier(426, 373, 616, 317, 578, 480, 552, 651); 

//bottom left blue circle
noStroke();
fill(59, 116, 144);
ellipse(6, 398, 18, 18); 

//right yellow ellipse
fill(252, 208, 60);
ellipse(640, 326.75, 97, 55);

//black curve second from bottom
noFill();
stroke(0);
strokeWeight(3);
bezier(-380, 359, 0, 373, 325, 384, 640, 347); 

//bottom right blue rectangle
noStroke();
fill(82, 128, 180, 240);
beginShape(); 
vertex(577, 338);
vertex(641, 338);
vertex(641, 359);
vertex(577, 359);
endShape();


//main red curve - above left blk curve and below right blk curve
noFill();
stroke(183, 50, 50);
strokeWeight(3.5);
bezier( -389, 183, -1, 225, 374, 263, 640, 339); 

//bottom right offwhite rectangle
noStroke();
fill(209, 225, 219);
beginShape(); 
vertex(576, 298);
vertex(640, 298);
vertex(640, 319);
vertex(576, 319);
endShape();

//thin red curve
noFill();
stroke(160, 41, 33);
strokeWeight(3.5);
bezier(374, -14, 446, 2, 597, 45, 640, 68); 


//thick right curve
noFill();
stroke(0);
strokeWeight(6);
bezier(393, -244, 474, 0, 551, 250, 405, 480); 

//top right yellow pointy
noStroke();
fill(245, 185, 48);
beginShape(); 
vertex(568, 102);
vertex(641, 102);
vertex(641, 120);
vertex(598, 120);
endShape();

//white stars
int xpos = 172;
int ypos = 436;
int sx = width/8;
noStroke();
fill(255);
beginShape();
translate(156, 390);
scale(.1);
vertex(xpos, ypos-sx/2);
vertex(xpos+sx/6, ypos-sx/6);
vertex(xpos+sx/2, ypos-sx/11);
vertex(xpos +sx/4, ypos+sx/8);
vertex(xpos+sx/3, ypos+sx/2);
vertex(xpos, ypos+sx/3);
vertex(xpos-sx/3, ypos+sx/2);
vertex(xpos-sx/4, ypos+sx/6);
vertex(xpos-sx/2, ypos-sx/9);
vertex(xpos-sx/6, ypos-sx/6);
endShape(CLOSE); 

int xpos2 = 183;
int ypos2 = 450;
int sz = width/8;
noStroke();
fill(255);
beginShape();
translate(110, 150);
scale(1);
vertex(xpos2, ypos2-sz/2);
vertex(xpos2+sz/6, ypos2-sz/6);
vertex(xpos2+sz/2, ypos2-sx/11);
vertex(xpos2 +sz/4, ypos2+sz/8);
vertex(xpos2+sz/3, ypos2+sz/2);
vertex(xpos2, ypos2+sz/3);
vertex(xpos2-sz/3, ypos2+sz/2);
vertex(xpos2-sz/4, ypos2+sz/6);
vertex(xpos2-sz/2, ypos2-sz/9);
vertex(xpos2-sz/6, ypos2-sz/6);
endShape(CLOSE); 

int xpos3 = 162;
int ypos3 = 452;
int sk = width/8;
noStroke();
fill(255);
beginShape();
translate(-210, 15);
scale(1);
vertex(xpos3, ypos3-sk/2);
vertex(xpos3+sk/6, ypos3-sk/6);
vertex(xpos3+sk/2, ypos3-sx/11);
vertex(xpos3 +sk/4, ypos3+sk/8);
vertex(xpos3+sk/3, ypos3+sk/2);
vertex(xpos3, ypos3+sk/3);
vertex(xpos3-sk/3, ypos3+sk/2);
vertex(xpos3-sk/4, ypos3+sk/6);
vertex(xpos3-sk/2, ypos3-sk/9);
vertex(xpos3-sk/6, ypos3-sk/6);
endShape(CLOSE);





