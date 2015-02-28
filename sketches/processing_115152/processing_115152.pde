
// prcatice to give strcture on Assignment1 
// add new functions of star-making with position, size and color 
// by chen-hsin chang

// make some random number
float delta1= random(3, 6);
float delta2= random(5, 10);



void setup() {
  size(500, 500);
  background(208, 175, 140);
}

void draw() {
  if (mousePressed) {
    background(0);
    drawOneStar(160, 20, 34, 20, mouseX/2);
    drawOneStar(119, 119, 34, 34, mouseX/2);
    drawOneStar(34, 323, 30, 25, mouseX/2);
    drawOneStar(260, 471, 43, 37, mouseX/2);
    drawOneStar(453, 284, 34, 40, mouseX/2);
    drawOneStar(450, 28, 21, 30, mouseX/2);
    ballsGrowing(35, 33);
    ballsGrowing(200, 50);
    ballsGrowing(350, 65);
    ballsGrowing(230, 200);
    ballsGrowing(380, 180);
    ballsGrowing(25, 400);
    
    // longest curve
  noFill();
  stroke(mouseX,mouseY,100,mouseX/5);
  beginShape();
  vertex(34, 0); // first point
  bezierVertex(-25, 118, -12, 230, 107, 330);
  bezierVertex(221, 427, 319, 475, 429, 474);
  bezierVertex(538, 473, 592, 362, 592, 348);
  endShape();
    
    
    
    
  }
  else {

    drawBlackLines();
    drawCurves();
    drawBlackBalls();
    drawGreenBalls();
    drawBlueBalls();
    drawBlackBalls2();
    drawBlackTriangles();
    drawBlueTriangles();

    //black lines
    line(74, 206, 111, 204);
    line(93, 189, 93, 225);
    line(227, 294, 210, 310);
    line(210, 310, 235, 325);
    line(235, 325, 216, 342);
    line(216, 342, 243, 357);
    line(243, 357, 221, 379);
    line(221, 379, 238, 392);
    line(124, 457, 178, 428);
    line(269, 285, 269, 305);
    line(452, 376, 482, 376);
    line(463, 356, 463, 395);
    line(469, 50, 482, 37);
    line(482, 37, 494, 56);
    line(494, 56, 500, 50);
    line(305, 38, 327, 28);

    // bottom organic
    fill(58, 58, 140, 80);
    stroke(0);

    beginShape();
    vertex(131, 421); // first point
    bezierVertex(137, 421, 147, 430, 154, 441);
    vertex(143, 448);
    bezierVertex(140, 440, 135, 431, 126, 430);
    vertex(131, 421);
    endShape();

    fill(0);
    stroke(0);

    beginShape();
    vertex(154, 441); // first point
    bezierVertex(162, 451, 175, 455, 187, 471);
    bezierVertex(198, 487, 193, 494, 194, 500);
    vertex(119, 500);
    bezierVertex(119, 497, 121, 492, 130, 482);
    bezierVertex(138, 473, 148, 461, 143, 448);
    vertex(154, 441);
    endShape();

    // overlay color change
    // blue >black
    /*
  fill(0);
     stroke(0);
     
     beginShape();
     vertex(39, 99);// first point
     bezierVertex(41, 97, 55, 91, 67, 95);
     vertex(59, 111);
     bezierVertex(49, 109, 42, 101, 39, 99);
     endShape();
     
     beginShape();
     vertex(33, 246); // first point
     bezierVertex(10, 262, 29, 289, 55, 276);
     vertex(33, 246);
     endShape();
     
     beginShape();
     vertex(93, 318); // first point
     bezierVertex(111, 294, 147, 322, 130, 350);
     vertex(93, 318);
     endShape();
     
     beginShape();
     vertex(143, 360); // first point
     vertex(129, 375);
     bezierVertex(145, 379, 162, 378, 167, 378);
     vertex(143, 360);
     endShape();
     
     
     beginShape();
     vertex(229, 420); // first point
     bezierVertex(238, 400, 258, 413, 252, 430);
     vertex(229, 420);
     endShape();
     
     
     beginShape();
     vertex(365, 470); // first point
     bezierVertex(367, 437, 415, 441, 413, 474);
     vertex(365, 470);
     endShape();
     
     //green >black
     fill(0);
     stroke(0);
     
     beginShape();
     vertex(181, 126); // first point
     bezierVertex(188, 132, 203, 136, 210, 136);
     bezierVertex(210, 117, 190, 113, 181, 126);
     endShape();
     
     beginShape();
     vertex(266, 87); // first point
     bezierVertex(250, 96, 246, 113, 246, 124);
     bezierVertex(256, 117, 267, 98, 266, 87);
     endShape();
     
     beginShape();
     vertex(257, 158); // first point
     bezierVertex(266, 172, 295, 188, 318, 174);
     bezierVertex(300, 157, 273, 148, 257, 158);
     endShape();
     
     beginShape();
     vertex(334, 89); // first point
     bezierVertex(343, 93, 354, 119, 352, 128);
     bezierVertex(335, 118, 333, 99, 334, 89);
     endShape();
     
     beginShape();
     vertex(256, 272); // first point
     bezierVertex(260, 253, 286, 251, 285, 275);
     bezierVertex(278, 278, 263, 274, 256, 272);
     endShape();
     
     beginShape();
     vertex(339, 217); // first point
     bezierVertex(341, 243, 318, 263, 301, 270);
     bezierVertex(295, 245, 310, 225, 339, 217);
     endShape();
     
     beginShape();
     vertex(360, 214); // first point
     bezierVertex(383, 215, 395, 222, 404, 236);
     bezierVertex(389, 238, 371, 232, 360, 214);
     endShape();
     
     beginShape();
     vertex(44, 23); // first point
     bezierVertex(71, 31, 86, 31, 99, 22);
     bezierVertex(82, 11, 63, 9, 44, 23);
     endShape();
     
     beginShape();
     vertex(101, 407); // first point
     bezierVertex(87, 418, 95, 441, 119, 434);
     bezierVertex(118, 424, 109, 409, 101, 407);
     endShape();
     
     //black >red
     fill(195, 59, 21);
     noStroke();
     
     beginShape();
     vertex(442, 84); // first point
     bezierVertex(420, 86, 427, 109, 433, 110);
     bezierVertex(437, 107, 442, 99, 442, 84);
     endShape();
     
     //black >yellow
     fill(255, 240, 0);
     noStroke();
     
     beginShape();
     vertex(451, 168); // first point
     bezierVertex(453, 168, 450, 192, 449, 195);
     bezierVertex(442, 194, 434, 175, 451, 168);
     endShape();
     */
  }
}

void drawBlackLines() {
  // line:stars/cross
  stroke(0);
  background(208, 175, 140, 0);
  drawOneStar(160, 20, 34, 20, 0);
  drawOneStar(119, 119, 34, 34, 0);
  drawOneStar(34, 323, 30, 25, 0);
  drawOneStar(260, 471, 43, 37, 0);
  drawOneStar(453, 284, 34, 40, 0);
  drawOneStar(450, 28, 21, 30, 0);
  /* line(143, 0, 177, 0);
   line(143, 16, 160, 0);
   line(160, 0, 171, 14);
   line(160, 0, 160, 20);   
   line(124, 102, 115, 136);
   line(111, 108, 129, 129);
   line(107, 118, 136, 118);
   line(102, 129, 136, 108);   
   line(19, 321, 49, 321);
   line(34, 310, 34, 335);
   line(24, 310, 45, 330);
   line(24, 330, 45, 310);  
   line(238, 459, 278, 482);
   line(241, 471, 281, 467);
   line(243, 489, 269, 459);
   line(463, 356, 463, 395);
   line(443, 266, 465, 302);
   line(436, 284, 470, 284);
   line(436, 300, 470, 271);
   line(457, 262, 450, 302);
   line(441, 16, 457, 38);
   line(436, 28, 465, 28);
   line(439, 38, 457, 20);
   line(450, 14, 450, 44);
   line(305, 38, 327, 28);
   */
}

void drawCurves() {
  // longest curve
  noFill();
  beginShape();
  vertex(34, 0); // first point
  bezierVertex(-25, 118, -12, 230, 107, 330);
  bezierVertex(221, 427, 319, 475, 429, 474);
  bezierVertex(538, 473, 592, 362, 592, 348);
  endShape();

  // curve
  beginShape();
  vertex(157, 157); // first point
  bezierVertex(147, 184, 131, 195, 119, 212);
  bezierVertex(107, 228, 97, 238, 102, 257);
  bezierVertex(107, 273, 121, 284, 134, 284);
  bezierVertex(150, 284, 165, 278, 167, 257);
  bezierVertex(168, 236, 160, 231, 152, 230);
  bezierVertex(143, 228, 136, 237, 136, 242);
  endShape();

  // three curves
  beginShape();
  vertex(66, 387); // first point
  bezierVertex(67, 382, 96, 354, 107, 404);
  endShape();

  beginShape();
  vertex(82, 361); // first point
  bezierVertex(99, 354, 115, 384, 115, 403);
  endShape();

  beginShape();
  vertex(114, 364); // first point
  bezierVertex(126, 372, 123, 398, 121, 403);
  endShape();
}

void drawBlackBalls() {
  //black balls
  fill(0);
  stroke(0);
  beginShape();
  vertex(93, 189); // first point
  bezierVertex(78, 191, 63, 164, 83, 151);
  bezierVertex(106, 136, 128, 182, 93, 189);
  endShape();

  beginShape();
  vertex(147, 194); // first point
  bezierVertex(153, 182, 184, 180, 184, 204);
  bezierVertex(184, 231, 134, 224, 147, 194);
  endShape();

  beginShape();
  vertex(136, 242); // first point
  bezierVertex(147, 240, 150, 257, 138, 259);
  bezierVertex(126, 260, 125, 243, 136, 242);
  endShape();

  beginShape();
  vertex(226, 294); // first point
  bezierVertex(215, 289, 224, 275, 233, 280);
  bezierVertex(243, 284, 237, 300, 226, 294);
  endShape();

  beginShape();
  vertex(267, 304); // first point
  bezierVertex(288, 305, 285, 331, 267, 330);
  bezierVertex(249, 327, 254, 305, 267, 304);
  endShape();

  beginShape();
  vertex(266, 365); // first point
  bezierVertex(288, 365, 285, 393, 266, 391);
  bezierVertex(247, 389, 252, 365, 266, 365);
  endShape();

  beginShape();
  vertex(401, 347); // first point
  bezierVertex(449, 347, 442, 410, 401, 405);
  bezierVertex(359, 400, 369, 347, 401, 347);
  endShape();

  beginShape();
  vertex(457, 327); // first point
  bezierVertex(483, 320, 482, 352, 464, 356);
  bezierVertex(441, 360, 440, 331, 457, 327);
  endShape();

  beginShape();
  vertex(558, 125); // first point
  bezierVertex(580, 196, 461, 188, 470, 125);
  bezierVertex(476, 80, 533, 47, 558, 125);
  endShape();

  beginShape();
  vertex(469, 50); // first point
  bezierVertex(478, 58, 465, 66, 460, 60);
  bezierVertex(455, 54, 463, 45, 469, 50);
  endShape();

  beginShape();
  vertex(327, 28); // first point
  bezierVertex(325, 13, 344, 16, 344, 27);
  bezierVertex(344, 38, 328, 38, 327, 28);
  endShape();

  beginShape();
  vertex(305, 38); // first point
  bezierVertex(315, 52, 300, 67, 290, 50);
  bezierVertex(283, 40, 296, 27, 305, 38);
  endShape();

  beginShape();
  vertex(13, 161); // first point
  bezierVertex(13, 178, -11, 178, -13, 162);
  bezierVertex(-15, 140, 13, 144, 13, 161);
  endShape();
}

void drawGreenBalls() {
  //green balls
  fill(25, 60, 6);
  stroke(25, 60, 6);

  beginShape();
  vertex(71, 29); // first point
  bezierVertex(-24, 22, -22, -88, 67, -82);
  bezierVertex(183, -76, 128, 33, 71, 29);
  endShape();

  beginShape();
  vertex(181, 126); // first point
  bezierVertex(190, 113, 210, 117, 210, 136);
  bezierVertex(210, 166, 160, 154, 181, 126);
  endShape();

  beginShape();
  vertex(265, 88); // first point
  bezierVertex(322, 40, 395, 134, 321, 173);
  bezierVertex(269, 200, 215, 131, 265, 88);
  endShape();

  beginShape();
  vertex(271, 257); // first point
  bezierVertex(288, 256, 293, 287, 269, 285);
  bezierVertex(250, 284, 254, 258, 271, 257);
  endShape();

  beginShape();
  vertex(301, 269); // first point
  bezierVertex(286, 220, 377, 192, 404, 236);
  bezierVertex(449, 310, 327, 349, 301, 269);
  endShape();

  beginShape();
  vertex(107, 404); // first point
  bezierVertex(130, 396, 143, 425, 119, 434);
  bezierVertex(96, 443, 83, 412, 107, 404);
  endShape();
}

void drawBlueBalls() {
  //blue balls
  fill(58, 58, 140, 80);
  stroke(0);

  beginShape();
  vertex(35, 33); // first point
  bezierVertex(69, -16, 150, 33, 101, 95);
  bezierVertex(65, 141, -1, 84, 35, 33);
  endShape();

  beginShape();
  vertex(167, 42); // first point
  bezierVertex(212, -8, 289, 58, 259, 108);
  bezierVertex(215, 179, 115, 100, 167, 42);
  endShape();

  beginShape();
  vertex(283, -19); // first point
  bezierVertex(327, -14, 300, 10, 283, 11);
  bezierVertex(266, 13, 247, -22, 283, -19);
  endShape();

  beginShape();
  vertex(398, 25); // first point
  bezierVertex(443, 34, 453, 91, 431, 113);
  bezierVertex(408, 135, 364, 142, 344, 122);
  bezierVertex(315, 92, 354, 15, 398, 25);
  endShape();

  beginShape();
  vertex(441, 151); // first point
  bezierVertex(467, 167, 443, 225, 418, 233);
  bezierVertex(390, 242, 368, 230, 360, 214);
  bezierVertex(344, 180, 391, 120, 441, 151);
  endShape();

  beginShape();
  vertex(260, 157); // first point
  bezierVertex(306, 138, 388, 224, 301, 270);
  bezierVertex(238, 302, 168, 195, 260, 157);
  endShape();

  beginShape();
  vertex(365, 470); // first point
  bezierVertex(367, 437, 415, 441, 412, 474);
  bezierVertex(410, 504, 364, 510, 365, 470);
  endShape();

  beginShape();
  vertex(252, 430); // first point
  bezierVertex(245, 447, 221, 438, 229, 419);
  bezierVertex(238, 400, 258, 413, 252, 430);
  endShape();

  beginShape();
  vertex(93, 318); // first point
  bezierVertex(111, 294, 147, 322, 130, 349);
  bezierVertex(114, 372, 72, 345, 93, 318);
  endShape();

  beginShape();
  vertex(55, 276); // first point
  bezierVertex(29, 289, 10, 262, 33, 246);
  bezierVertex(67, 221, 84, 262, 55, 276);
  endShape();

  ellipse(0, 110, 11, 11);

  beginShape();
  vertex(15, 447); // first point
  bezierVertex(6, 378, 130, 381, 118, 447);
  bezierVertex(109, 502, 22, 500, 15, 447);
  endShape();
}

void drawBlackBalls2() {
  // colorful black ball
  fill(0, 100);
  stroke(0);

  ellipse(254, 48, 9, 9);
  ellipse(442, 99, 28, 28);
  ellipse(455, 182, 28, 28);

  beginShape();
  vertex(198, 236); // first point
  bezierVertex(195, 220, 226, 215, 229, 231);
  bezierVertex(233, 245, 200, 253, 198, 236);
  endShape();
}

void drawBlackTriangles() {
  // black triangle
  fill(0);
  stroke(0);

  triangle(464, 395, 506, 441, 415, 441);
  triangle(475, 17, 515, 15, 503, -17);

  beginShape();
  vertex(325, 374); // first point
  vertex(301, 352);
  bezierVertex(325, 337, 349, 338, 365, 343);
  vertex(325, 374);
  endShape();

  beginShape();
  vertex(325, 374); // first point
  vertex(357, 405);
  bezierVertex(343, 413, 325, 421, 288, 403);
  vertex(325, 374);
  endShape();

  beginShape();
  vertex(172, 331); // first point
  vertex(147, 299);
  bezierVertex(167, 290, 188, 293, 205, 299);
  vertex(172, 331);
  endShape();

  beginShape();
  vertex(40, 149); // first point
  vertex(63, 192);
  bezierVertex(49, 198, 27, 200, 16, 197);
  vertex(40, 149);
  endShape();
}

void drawBlueTriangles() {
  // blue triangle
  fill(58, 58, 140, 40);
  stroke(0);

  beginShape();
  vertex(40, 149); // first point
  vertex(19, 110);
  bezierVertex(35, 99, 49, 91, 67, 95);
  vertex(40, 149);
  endShape();

  beginShape();
  vertex(172, 331); // first point
  vertex(200, 368);
  bezierVertex(194, 373, 168, 383, 129, 375);
  vertex(172, 331);
  endShape();
}

// add new function for stars rotate with seconds
// refference from schien@mail.ncku.edu.tw

void drawOneStar(float posx, float posy, float swidth, float sheight, float c) {

  //set the environmental variables
  int s =second();

  stroke(c);
  strokeWeight(1);

  pushMatrix();
  translate(posx, posy);
  rotate(s);
  line(0, sheight/2, 0, -sheight/2);
  line(-swidth/2, 0, swidth/2, 0);

  float deltax1 =swidth/delta1;
  float deltay1 =sheight/delta1;
  float deltax2 =swidth/delta2;
  float deltay2 =sheight/delta2;  

  line(-swidth/2+deltax1, -sheight/2+deltay1, swidth/2-deltax1, sheight/2-deltay1);
  line(-swidth/2+deltax2, sheight/2-deltay2, swidth/2-deltax2, -sheight/2+deltay2);
  popMatrix();
}

// add new function for blueballs growing up
void ballsGrowing(float bposx, float bposy) {
  float y= 0;

  noStroke();
  fill(58, 58, 140, mouseY/10);
  pushMatrix();
  translate(bposx+36,bposy+27);
  rotate(random(mouseY));
  scale(random(mouseY/100));
  beginShape();
  vertex(-36, -27); // first point
  bezierVertex(+34-36, -51-27, +115-36, -2-27, +66-36, +60-27);
  bezierVertex(+30-36, +106-27, -36-36, +49-27, -36, -27);
  endShape();
  popMatrix();
}



