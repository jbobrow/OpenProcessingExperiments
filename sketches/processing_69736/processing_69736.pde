
// Assignment 1
// Name: Sandra Tamarin
// E-mail: stamarin@haverford.edu
// Course: CS 110-Section 001
// Submitted: 9/11/12


// box of chocolates


void setup() {
  size(500,650);
  smooth();
}

void draw() {
  background(150);

  rectMode(CENTER);
  ellipseMode(CENTER);


  // box
  noStroke();
  fill(50, 40, 35);
  rect(250, 325, 450, 600);
  fill(0);
  rect(250, 325, 425, 575);
  
  
  // row 1
  // chocolate 1.1
  rectMode(CORNER);
  fill(100, 40, 35);
  noStroke();
  rect(57, 57, 35, 65);
  arc(57, 57, 15, 15, PI, TWO_PI-PI/2);
  arc(92, 57, 15, 15, TWO_PI-PI/2, TWO_PI);
  arc(57, 122, 15, 15, PI/2, PI);
  arc(92, 122, 15, 15, 0, PI/2);
  rect(57, 50, 36, 10);
  rect(57, 120, 36, 10);
  rect(50, 57, 10, 68);
  rect(90, 57, 10, 68);
  
  // division 1.1
  stroke(55, 40, 35);
  strokeWeight(3);
  line(110,38, 110,140);
  
  // chocolate 1.2
  noStroke();
  fill(76, 43, 11);
  ellipse(150, 91, 60, 80);
  // decoration
  stroke(0);
  strokeWeight(2);
  fill(40, 15, 5);
  ellipse(150, 91, 22, 32);
  
  // division 1.2
  stroke(50, 40, 35);
  strokeWeight(3);
  line(187,38, 187,140);
  
  // chocolate 1.3
  noStroke();
  fill(50, 30, 30);
  rect(199, 63, 60, 60);
  
  // division 1.3
  stroke(50, 40, 35);
  strokeWeight(3);
  line(272,38, 272,140);
  
  // chocolate 1.4
  noStroke();
  fill(140, 100, 90);
  triangle(283,128, 345,128, 314,55);
  
  // division 1.4
  stroke(50, 40, 35);
  strokeWeight(3);
  line(354,38, 354,140);
  
  // chocolate 1.5
  noStroke();
  fill(80, 40, 35);
  beginShape();
  vertex(390, 50);
  vertex(425, 50);
  vertex(450, 70);
  vertex(450, 105);
  vertex(425, 130);
  vertex(390, 130);
  vertex(365, 105);
  vertex(365, 70);
  endShape();
  
  //division 1 vs 2
  stroke(50, 40, 35);
  strokeWeight(6);
  line(37,144, 460,144);
  
  
  // row 2
  // chocolate 2.1
  noStroke();
  fill(40, 20, 20);
  rect(53, 160, 85, 62);
  // decoration
  stroke(220, 215, 190);
  strokeWeight(2);
  line(70,160, 70,221);
  line(121,160, 121,221);
  line(52,175, 138,175);
  line(52,206, 138,206);
  
  // division 2.1
  stroke(50, 40, 35);
  strokeWeight(3);
  line(156,145, 156,238);
  
  // chocolate 2.2
  noStroke();
  fill(76, 45, 25);
  quad(195,189, 205,156, 215,189, 205,225);
  quad(170,189, 205,179, 240,189, 205,199);
  
  // division 2.2
  stroke(50, 40, 35);
  strokeWeight(3);
  line(250,145, 250,238);
  
  // division 2.3
  stroke(50, 40, 35);
  strokeWeight(3);
  line(361,145, 361,238);

  // chocolate 2.3
  noStroke();
  fill(150, 0, 0);
  ellipse(415, 192, 70, 70);
  // decoration
  stroke(0);
  strokeWeight(2);
  noFill();
  arc(415, 170, 70, 70, 0, PI);
  arc(415, 218, 70, 70, PI, TWO_PI);
  
  // division 2 vs 3
  stroke(50, 40, 35);
  strokeWeight(6);
  line(37,237, 460,237);
  
  
  // row 3
  // chocolate 3.1
  noStroke();
  fill(30,15,10);
  beginShape();
  rect(57, 250, 36, 80);
  rect(50, 257, 50, 66);
  arc(57, 257, 15, 15, PI, TWO_PI-PI/2);
  arc(92, 257, 15, 15, TWO_PI-PI/2, TWO_PI);
  arc(57, 322, 15, 15, PI/2, PI);
  arc(92, 322, 15, 15, 0, PI/2);
  endShape();
  
  // division 3.1
  stroke(50, 40, 35);
  strokeWeight(3);
  line(110,238, 110,340);
  
  // chocolate 3.2
  noStroke();
  fill(100, 45, 43);
  ellipse(150, 291, 60, 80);
  // decoration
  fill(250, 250, 218);
  stroke(0);
  strokeWeight(1);
  ellipse(130, 300, 4, 5);
  ellipse(135, 287, 5, 4);
  ellipse(160, 260, 5, 4);
  ellipse(148, 270, 4, 5);
  ellipse(145, 320, 5, 4);
  ellipse(155, 300, 4, 5);
  ellipse(160, 313, 5, 4);
  ellipse(144, 306, 4, 5);
  ellipse(162, 275, 5, 4);
  ellipse(170, 290, 4, 5);
  ellipse(151, 286, 5, 4);
  ellipse(132, 274, 4, 5);
  ellipse(140, 259, 5, 4);
  ellipse(170, 305, 5, 4);
  
  // division 3.2
  stroke(50, 40, 35);
  strokeWeight(3);
  line(187,238, 187,340);
  
  // chocolate 3.3 
  noStroke();
  fill(235, 228, 197);
  rect(199, 263, 60, 60);
  // decoration
  stroke(80, 45, 35);
  strokeWeight(2);
  line(199,302, 220,323);
  line(238,263, 259,284);
  line(199,323, 259,263);
  
  // division 3.3
  stroke(50, 40, 35);
  strokeWeight(3);
  line(272,238, 272,340);
  
  // chocolate 3.4
  noStroke();
  fill(136, 73, 48);
  triangle(283,328, 345,328, 314,255);
  
  // division 3.4
  stroke(50, 40, 35);
  strokeWeight(3);
  line(354,238, 354,340);
  
  // chocolate 3.5
  noStroke();
  fill(100, 55, 42);
  beginShape();
  vertex(390, 250);
  vertex(425, 250);
  vertex(450, 270);
  vertex(450, 305);
  vertex(425, 330);
  vertex(390, 330);
  vertex(365, 305);
  vertex(365, 270);
  endShape();
  // decoration
  stroke(0);
  strokeWeight(2);
  fill(70, 0, 0);
  ellipse(407, 290, 30, 30);
  
  // division 3 vs 4
  stroke(50, 40, 35);
  strokeWeight(6);
  line(37,342, 460,342);
  
  
  // row 4
  // chocolate 4.1
  noStroke();
  fill(94, 66, 44);
  ellipse(85, 390, 75, 75);
  fill(0);
  ellipse(103, 390, 65, 65);
  
  // division 4.1
  stroke(50, 40, 35);
  strokeWeight(3);
  line(117,341, 117,440);
  
  // chocolate 4.2
  noStroke();
  fill(255, 220, 200);
  beginShape();
  triangle(160, 425, 130, 385, 190, 385);
  ellipse(145, 377, 34, 34);
  ellipse(174, 377, 34, 34);
  endShape();
  
  // division 4.2
  stroke(50, 40, 35);
  strokeWeight(3);
  line(201,341, 201,440);
  
  // chocolate 4.3
  noStroke();
  fill(50,15,10);
  rect(214, 380, 47, 43);
  ellipse(237, 380, 47, 47);
  // decoration
  stroke(0);
  strokeWeight(2);
  noFill();
  arc(237, 381, 37, 37, PI, TWO_PI);
  line(218,381, 218,418);
  line(218,418, 256,418);
  line(256,418, 256,381);
  
  // division 4.3
  stroke(50, 40, 35);
  strokeWeight(3);
  line(274,341, 274,440);
  
  // chocolate 4.4
  noStroke();
  fill(100, 60, 50);
  quad(352,391, 318,425, 283,391, 318,357);
  // decoration
  stroke(0);
  strokeWeight(2);
  fill(55, 30, 25);
  quad(337,391, 318,410, 298,391, 318,372);
  
  // division 4.4
  stroke(50, 40, 35);
  strokeWeight(3);
  line(361,341, 361,440);
  
  // division 4 vs 5
  stroke(50, 40, 35);
  strokeWeight(6);
  line(37,439, 460,439);
  
  
  // row 5
  // chocolate 5.1
  noStroke();
  fill(245, 192, 210);
  rect(57, 457, 35, 65);
  arc(57, 457, 15, 15, PI, TWO_PI-PI/2);
  arc(92, 457, 15, 15, TWO_PI-PI/2, TWO_PI);
  arc(57, 522, 15, 15, PI/2, PI);
  arc(92, 522, 15, 15, 0, PI/2);
  rect(57, 450, 36, 10);
  rect(57, 520, 36, 10);
  rect(50, 457, 10, 68);
  rect(90, 457, 10, 68);
  // decoration
  stroke(255);
  strokeWeight(4);
  line(60,485, 88,465);
  line(60,510, 88,490);
  
  // division 5.1
  stroke(50, 40, 35);
  strokeWeight(3);
  line(110,438, 110,540);
  
  // chocolate 5.2
  strokeCap(SQUARE);
  noStroke();
  fill(40, 20, 20);
  ellipse(150, 491, 60, 80);
  // decoration
  stroke(85, 40, 35);
  strokeWeight(2);
  line(130,461, 132,465);
  line(132,465, 137,455);
  line(137,455, 142,465);
  line(142,465, 147,455);
  line(147,455, 152,465);
  line(152,465, 157,455);
  line(157,455, 162,465);
  line(162,465, 167,457);
  line(125,472, 130,482);
  line(130,482, 135,472);
  line(135,472, 140,482);
  line(140,482, 145,472);
  line(145,472, 150,482);
  line(150,482, 155,472);
  line(155,472, 160,482);
  line(160,482, 165,472);
  line(165,472, 170,482);
  line(170,482, 175,472);
  line(122,491, 127,501);
  line(127,501, 132,491);
  line(132,491, 137,501);
  line(137,501, 142,491);
  line(142,491, 147,501);
  line(147,501, 152,491);
  line(152,491, 157,501);
  line(157,501, 162,491);
  line(162,491, 167,501);
  line(167,501, 172,491);
  line(172,491, 177,501);
  line(127,514, 129,510);
  line(129,511, 134,521);
  line(134,521, 139,511);
  line(139,511, 144,521);
  line(144,521, 149,511);
  line(149,511, 154,521);
  line(154,521, 159,511);
  line(159,511, 164,521);
  line(164,521, 169,511);
  line(169,511, 172,518);
  
  // division 5.2
  stroke(50, 40, 35);
  strokeWeight(3);
  line(187,438, 187,540);
  
  // chocolate 5.3
  noStroke();
  fill(60,25,25);
  rect(199, 463, 60, 60);
  
  // division 5.3
  stroke(50, 40, 35);
  strokeWeight(3);
  line(272,438, 272,540);
  
  // chocolate 5.4
  noStroke();
  fill(223, 221, 183);
  triangle(283,528, 345,528, 314,455);
  // decoration
  stroke(40,25,25);
  strokeWeight(2);
  noFill();
  arc(288, 528, 30, 30, TWO_PI-PI/2, TWO_PI);
  arc(339, 528, 31, 31, PI, TWO_PI-PI/2);
  arc(313, 474, 18, 18, 0, PI);
  
  // division 5.4
  stroke(50, 40, 35);
  strokeWeight(3);
  line(354,438, 354,540);
  
  // chocolate 5.5
  noStroke();
  fill(70, 40, 35);
  beginShape();
  vertex(390, 450);
  vertex(425, 450);
  vertex(450, 471);
  vertex(450, 505);
  vertex(425, 530);
  vertex(390, 530);
  vertex(365, 505);
  vertex(365, 470);
  endShape();
  // decoration
  stroke(40, 20, 20);
  strokeWeight(10);
  line(378,518, 436,459);
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(406, 489, 15, 15);
  
  // division 5 vs 6
  strokeCap(ROUND);
  stroke(50, 40, 35);
  strokeWeight(6);
  line(37,539, 460,539);
  
  
  // row 6
  // division 6.1
  stroke(50, 40, 35);
  strokeWeight(3);
  line(117,538, 117,615);
  
  // chocolate 6.1
  noStroke();
  fill(85, 40, 35);
  triangle(130,565, 150,580, 130,595);
  rect(143, 575, 30, 10);
  ellipse(180, 565, 30, 30);
  ellipse(200, 578, 30, 30);
  ellipse(180, 592, 30, 30);
  
  // division 6.2
  stroke(50, 40, 35);
  strokeWeight(3);
  line(226,538, 226,615);
  
  // chocolate 6.2
  noStroke();
  fill(60, 30, 22);
  ellipse(265, 578, 53, 53);
  // decoration
  stroke(0);
  strokeWeight(2);
  fill(220, 215, 190);
  ellipse(265, 578, 35, 35);
  fill(30,15,10);
  ellipse(265, 578, 26, 26);
  fill(220, 215, 190);
  ellipse(265, 578, 14, 14);
  
  // division 6.3
  stroke(50, 40, 35);
  strokeWeight(3);
  line(307,538, 307,615);
  
  // chocolate 6.3
  noStroke();
  fill(145, 90, 75);
  rect(320, 552, 130, 52);
  // decoration
  stroke(80, 45, 35);
  strokeWeight(4);
  arc(341, 572, 30, 30, PI, TWO_PI);
  line(355,574, 330,595);
  line(330,595, 355,595);
  ellipse(377, 577, 23, 40);
  line(400,559, 400,595);
  line(396,595, 404,595);
  line(400,559, 396,565);
  arc(427, 572, 30, 30, PI, TWO_PI);
  line(441,574, 413,595);
  line(413,595, 441,595);
}

