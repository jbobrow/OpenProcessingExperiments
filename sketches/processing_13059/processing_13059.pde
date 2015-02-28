
void draw_triangle(int xcoord, int ycoord) {

  triangle(xcoord,ycoord, xcoord+25,ycoord-6, xcoord+12,ycoord+45);
  return;
}



void setup() {
  size(640, 480);
  background(200, 208, 184);
  smooth();
  noStroke();

  color black_lines = color(10,7,0);
  color warm_gray = color(149, 149, 129);
  color cool_gray = color(168, 177, 167);

  //lines
  stroke(black_lines);
  strokeWeight(2);
  line(226,262, 640,136);
  noStroke();

  //gray upper left quad
  fill(cool_gray);
  quad(35,0, 285,0, 0,240, 0,49);
  
  //top left blue line
  stroke(9,61,145);
  strokeWeight(2);
  line(0,19, 38,0);
  noStroke();
  
  //yellow top left quad
  fill(245,186,48);
  quad(13,1, 88,-2, 89,12, 31,13);

  //lines
  stroke(black_lines);
  strokeWeight(2);
  line(0,78, 259,51);
  line(2,236, 6,149);
  line(30,235, 31,150);
  noStroke();

  //green upper left triangle
  fill(42,80,59);
  triangle(19,56, 41,151, -23,146);

  //yellow upper left ellipse
  fill(251,194,53);
  ellipse(61,148, 66, 31);
  
  //dots on yellow ellipse
  stroke(176,122,136);
  strokeWeight(2);
  noFill();
  point(50,146);
  point(62,145);
  point(56,149);
  point(50,152);
  point(62,152);
  noStroke();

  //white upper left rect
  fill(209,226,216, 235);
  rect(18,129, 77, 14);

  //blue upper left rect
  fill(85,124,181, 220);
  rect(19,156, 76, 12);

  //Dark thin upper left quad
  fill(90, 56, 44);
  quad(77,49, 236,0, 274,0, 80,55);

  //green upper right quad
  fill(23, 103, 67);
  quad(517,0, 640,0, 640,137, 510,160);

  //yellow curved quad
  fill(245,187,51);
  beginShape();
  vertex(232, 168);
  bezierVertex(315, 129, 365, 113, 442, 126);
  bezierVertex(442, 126, 432, 158, 432, 158);
  bezierVertex(432, 158, 359, 148, 278, 172);
  bezierVertex(278, 172, 234, 187, 234, 187);
  endShape();

  //lines
  stroke(black_lines);
  strokeWeight(2);
  line(314,75, 308,204);
  line(291,78, 286,206);
  line(392,181, 640,138);
  line(383,214, 381,29);
  line(0,166, 312,136);
  line(312,136, 640,73);
  line(289,130, 312,129);
  noStroke();

  //yellow circle upper left
  fill(185,151,54);
  ellipse(319,44, 66,66);

  //White upper left quad
  fill(221,232,226);
  quad(161,26, 446,0, 446,22, 161,55);

  //Red middle upper triangle
  fill(208,57,62);
  triangle(404,33, 436,8, 437,60);


  //middle left gray quad
  fill(cool_gray);
  quad(0,281, 71,240, 74,316, 0,353);

  //lines
  stroke(black_lines);
  strokeWeight(2);
  line(0,322, 46,321);

  noStroke();


  //magenta curved hump thing
  fill(190,90,120);
  beginShape();
  vertex(485, 10);
  bezierVertex(485, 10, 640, -21, 640, -21);
  bezierVertex(640, -21, 640, 11, 640, 11);
  bezierVertex(635, 11, 610, 9, 580, 37);
  bezierVertex(555, 19, 515, 21, 483, 54);
  endShape();

  //top right blue line
  stroke(41,78,156);
  strokeCap(SQUARE);
  strokeWeight(6);
  line(459,58, 640,4);
  noStroke();
  
  //triangle point top right
  fill(42,65,132);
  triangle(620,11, 617,0, 624,0);


  //warm gray middle left quad
  fill(warm_gray);
  rect(71,188, 72, 64);

  //orange left circle
  fill(237, 130, 67);
  arc(78,291, 88,88, 0, TWO_PI);
  
    //orange leftmost circle
  fill(237, 130, 67);
  ellipse(-34,292, 89, 89);

  //yellow long thin quad
  fill(250,186,55);
  quad(91,249, 97,243, 97,306, 91,306);

  //yellow short thin quad
  fill(250,186,55);
  quad(80,243, 86,249, 86,259, 80,257);

  //warm gray lower left quad
  fill(warm_gray);
  rect(95,292, 24, 77);

  //warm gray upper left quad
  fill(warm_gray);
  rect(209,93, 30, 90);

  //warm gray middle center quad
  fill(warm_gray);
  rect(330,206, 36, 103);
  
  //star
  fill(213,107,65);
  beginShape();
  vertex(92,232);
  vertex(93,236);
  vertex(97,238);
  vertex(92,240);
  vertex(92,246);
  vertex(90,242);
  vertex(85,242);
  vertex(86,238);
  vertex(83,233);
  vertex(89,235);
  endShape(CLOSE);
  
  //blue left line
  fill(35,81,158);
  rect(0,311, 115, 10);

  //lines
  stroke(black_lines);
  strokeWeight(2);
  line(0,270, 563,233);
  noStroke();

  //yellow upper left line
  fill(248,182,44);
  quad(230,117, 230,110, 301,63, 305,63);
  quad(305,63, 305,67, 237,117, 230,117);


  //lines
  stroke(black_lines);
  strokeWeight(2);
  line(564,231, 640,219);
  line(591,254, 579,235);
  line(596,189, 596,179);
  line(195,385, 640,239);
  line(541,417, 578,399);
  line(435,432, 554,385);
  line(339,439, 471,385);
  noStroke();

  //red white and green quads on right
  fill(200, 48, 49);
  quad(640,207, 637,382, 618, 392, 620,225);
  fill(209,218,215);
  quad(620,225, 618,392, 597,401, 600,243);
  fill(45,81,55);
  quad(600,243, 597,401, 576,411, 579,262);


  //semi ellipse bottom right
  fill(201, 62, 65);
  arc(487,437, 72,102, -PI/15, 14*PI/15);

  //gray quad on right
  fill(cool_gray);
  quad(530,139, 554,139, 543,328, 518,327);

  //red and white bottom right trapezoid
  fill(217,226,225);
  quad(485,408, 485,353, 541,310, 541,388);
  fill(201,47,49);
  quad(485,408, 541,388, 541,426, 485,442);

  //red left rect on top of red and white trapezoid
  fill(209,59,61);
  rect(523,359, 18, 41);

  //red right rect on top of red and white trapezoid
  fill(209,59,61);
  rect(581,359, 18, 41);



  //white bottom right parallelagram
  fill(224,224,224);
  quad(514,438, 551,438, 484,480, 452,480);

  //bottom left white quad
  fill(218,228,217);
  quad(155,479, 206,434, 220,434, 176,479);

  //bottom leftmost white quad
  fill(218,228,217);
  quad(0,439, 18,438, 1,462, 0,462);

  //bottom left blue rect
  fill(41,84,163);
  rect(177,435, 27, 45);

  //row of green-blue rectangles bottom left
  fill(53,81,59);
  rect(6,390, 93, 14); 
  rect(220,388, 124, 16); 
  fill(82,85,128);
  rect(118,392, 85, 12); 

  //long middle blue stripe
  fill(10,103,164);
  quad(98,270, 640,305, 640,308, 98,292);

  //lines
  stroke(black_lines);
  strokeWeight(2);
  line(94,321, 640,293); 
  line(0,428, 21,400);
  line(24,472, 53,446);
  line(125,349, 124,367);
  line(35,352, 36,369);
  line(148,399, 110,436);
  line(109,436, 115,465); 
  line(615,331, 640,325);
  noStroke();

  //middle blue quad
  fill(6,100,161);
  quad(290,255, 408,267, 267,323, 201,323);



  //white quad on right
  fill(216,223,215);
  quad(574,192, 624,186, 538,250, 500,247);

  //blue line going to right
  strokeWeight(5);
  stroke(31,79,161);
  line(277,295, 600,217);
  noStroke();

  //lower left blue rectangle
  fill(35,82,160);
  rect(177,434, 28, 46);

  //bottom left line
  stroke(black_lines);
  strokeWeight(2);
  line(0,462, 216,457);
  noStroke();

  //lower left line
  stroke(black_lines);
  strokeWeight(2);
  line(0,370, 221,363);
  noStroke();

  //lower long left line
  stroke(black_lines);
  strokeWeight(1);
  line(0,364, 413,350);
  noStroke();

  //lower long right line
  stroke(black_lines);
  strokeWeight(1);
  line(410,350, 579,326);
  noStroke();

  //left middle line
  stroke(black_lines);
  strokeWeight(2);
  line(0,217, 343,187);
  noStroke();

  //blue upper left rectangle
  fill(36,78,154);
  rect(205,176, 24,57);


  //bottom right curved hump thing
  fill(85,68,58, 220);
  beginShape();
  vertex(598, 420);
  bezierVertex(598, 420, 598, 401, 598, 401);
  bezierVertex(604, 382, 623, 387, 624, 398);
  bezierVertex(624, 401, 626, 402, 626, 398);
  bezierVertex(628, 386, 640, 391, 640, 391);
  vertex(640,411);
  endShape();
  
  //bottom red quad
  fill(202,47,51);
  quad(302,447, 328,440, 326,470, 300,471);
  
  //bottom red-yellow-blue quads
  fill(202,47,51);
  quad(348,454, 378,452, 377,464, 348,465);
  fill(251,192,54);
  quad(378,452, 348,454, 347,444, 378,436);
  fill(30,102,174);
  quad(348,432, 378,419, 378,436, 347,444);
  
  //bottom right white quad
  fill(216,228,226);
  quad(413,406, 438,392, 436,457, 412,461);
  
  //red circle on white quad
  fill(217,33,31);
  ellipse(425,419, 12, 20);
  
    //blue line bottom right
  fill(42,80,161);
  quad(427,417, 640,417, 640,426, 425,426);
  
  //bottom right triangular thing
  beginShape();
  fill(193,199,199);
  vertex(598,420);
  vertex(647,427);
  vertex(598,437);
  vertex(651,444);
  vertex(597,446);
  endShape(CLOSE);
  
  //triangles coming in from right
  stroke(black_lines);
  strokeWeight(1);
  fill(41,46,42);
  triangle(541,179, 557,187, 552,194);
  triangle(602,242, 617,249, 612,254);
  triangle(631,270, 640,276, 640,279);
  noStroke();  

  //lines
  stroke(black_lines);
  strokeWeight(2);
  line(417,282, 413,342);
  line(249,394, 215,436);
  line(239,413, 208,434);
  noStroke();

  //1st row of triangles
  for(int i=0; i<2; i++) {
    int xchange=24*i;
    int ychange=6*i;
    if(i==0) {
      fill(223, 235, 233);
    }
    else {
      fill(200, 50, 50);
    }
    draw_triangle(632-xchange, 41+ychange);
  }

  //2nd row of triangles
  for(int i=0; i<5; i++) {
    int xchange=24*i;
    int ychange=6*i;
    if(i==0 || i==4) {
      fill(39, 66, 133);
    }
    else {
      fill(200, 50, 50);
    }
    draw_triangle(615-xchange, 113+ychange);
  }

  //3rd row of triangles
  for(int i=0; i<5; i++) {
    int xchange=24*i;
    int ychange=6*i;
    if(i==0) {
      fill(39, 66, 133);
    }
    else if(i==3) {
      fill(223, 235, 233);
    }
    else {
      fill(200, 50, 50);
    }
    draw_triangle(613-xchange, 193+ychange);
  }

  //4th row of triangles
  for(int i=0; i<12; i++) {
    int xchange=24*i;
    int ychange=6*i;
    if(i==0 || i==7 || i==11) {
      fill(39, 66, 133);
    }
    else if(i==4) {
      fill(223, 235, 233);
    }
    else {
      fill(200, 50, 50);
    }
    draw_triangle(533-xchange, 287+ychange);
  }

  //5th row of triangles
  for(int i=0; i<8; i++) {
    int xchange=24*i;
    int ychange=6*i;
    if(i==0 || i==3) {
      fill(39, 66, 133);
    }
    else if(i>=4 && i<=6) {
      fill(223, 235, 233);
    }
    else {
      fill(200, 50, 50);
    }
    draw_triangle(434-xchange, 388+ychange);
  }

  // left middle line rectangle
  stroke(black_lines);
  strokeWeight(2);
  noFill();
  rect(249,159, 53, 42);
  noStroke();

  //top right thick line
  strokeWeight(6);
  stroke(96,58,47);
  line(281,188, 640,97); 
  noStroke();

  //Blue "L" top right
  fill(83,75,134, 220);
  beginShape();
  vertex(583,53);
  vertex(600,52);
  vertex(600,90);
  vertex(621,90);
  vertex(621,128);
  vertex(584,128);
  endShape(CLOSE);

  //Blue middle trapezoid
  fill(1,111,164, 245);
  quad(337,179, 410,178, 396,197, 349,197);
  
  //left squiggle
  fill(41,49,34);
  beginShape();
  vertex(9,280);
  bezierVertex(11,282, 12,284, 12,287);
  bezierVertex(19,286, 27,289, 30,289);
  bezierVertex(32,290, 36,291, 37,289);
  bezierVertex(39,288, 42,289, 45,290);
  bezierVertex(47,291, 47,292, 44,294);
  bezierVertex(41,296, 37,295, 33,294);
  bezierVertex(28,291, 15,287, 11,289);
  bezierVertex(7,290, 9,290, 7,289);
  bezierVertex(5,288, 3,288, 3,285);
  endShape(CLOSE);
  
  
  //left brown thick curve
  stroke(124,57,49, 250);
  strokeWeight(13);
  noFill();
  ellipse(-43,228, 132, 138);
  noStroke();


  //yellow thing with curve bottom left
  fill(247,190,47);
  beginShape();
  vertex(87,404);
  vertex(86,454);
  vertex(72,454);
  vertex(72,399);
  bezierVertex(77,408, 81,415, 84,404);
  endShape();
  
  //middle square outlines
  stroke(black_lines);
  strokeWeight(2);
  noFill();
  rect(307,222, 56, 59);
  rect(378,219, 50, 60);
  rect(441,217, 53, 64);

  //ellipse outlines
  ellipse(139,424, 58, 29);  
  ellipse(-20,425, 68, 42);

  //lines
  stroke(black_lines);
  strokeWeight(2);
  line(204,478, 432,474);
  line(577,480, 626,463);
  line(624,462, 640,451);
  line(147,102, 143,228);
  line(173,100, 168,225);
  line(226,140, 221,344);
  line(215,48, 210,130);
  line(210,130, 202,147);
  line(202,147, 199,344);
  line(209,290, 523,278);
  line(314,335, 315,286);
  
  beginShape();
  vertex(207,432);
  bezierVertex(214,439, 229,438, 234,437);
  endShape();
  
  beginShape();
  vertex(42, 441);
  bezierVertex(82,450, 114,473, 115,480);
  endShape();
  
  beginShape();
  vertex(386,142);
  vertex(534,146);
  bezierVertex(582,144, 589,141, 640,173);
  endShape();
  
  beginShape();
  vertex(615,336);
  vertex(559,347);
  bezierVertex(549,349, 544,352, 544,365);
  endShape();
  
  beginShape();
  vertex(602,348);
  bezierVertex(608,333, 603,331, 599,324);
  bezierVertex(596,297, 619,290, 623,290);
  bezierVertex(626,289, 628,290, 640,283);
  endShape();
  

  //big red lines
  stroke(144,36,23);
  strokeWeight(2);
  noFill();
  beginShape();
  vertex(0,140);
  bezierVertex(340,221, 428,354, 376,459);
  endShape();
  
  beginShape();
  vertex(107,0);
  bezierVertex(340,106, 454,245, 250,480);
  endShape();
  noStroke();
  
  //Canadian leaf
  fill(209,57,69);
  beginShape();
  vertex(561,395);
  vertex(561,387);
  vertex(555,389);
  vertex(554,384);
  vertex(549,380);
  vertex(550,378);
  vertex(548,375);
  vertex(552,375);
  vertex(554,373);
  vertex(557,375);
  vertex(557,369);
  vertex(560,369);
  vertex(561,365);
  vertex(564,368);
  vertex(568,368);
  vertex(566,376);
  vertex(570,373);
  vertex(571,374);
  vertex(575,374);
  vertex(575,378);
  vertex(576,379);
  vertex(570,385);
  vertex(569,388);
  vertex(563,387);
  vertex(563,395);
  endShape(CLOSE);
  
  //yellow middle quad
  fill(249,188,48);
  quad(467,283, 525,281, 525,295, 449,295);
}


