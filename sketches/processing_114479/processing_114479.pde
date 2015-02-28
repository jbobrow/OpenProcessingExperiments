
// Assignment 2: Miro movemove 10/09
// by chen-hsin chang


void setup() {
  size(500, 500);
  background(208, 175, 140);
}

void draw() {
  
if (mousePressed){
background(0);
noFill();
stroke(255);
  beginShape();
  vertex(mouseX, mouseY); // first point
  bezierVertex(-25, 118, -12, 230, 107, 330);
  bezierVertex(221, 427, 319, 475, 429, 474);
  bezierVertex(538, 473, 592, 362, 592, 348);
  endShape();
  
}
else{
background(208, 175, 140);
}
     
  
  // line:stars/cross
  stroke(0);
  line(143, 0, 177, 0);
  line(143, 16, 160, 0);
  line(160, 0, 171, 14);
  line(160, 0, 160, 20);
  line(124, 102, 115, 136);
  line(111, 108, 129, 129);
  line(107, 118, 136, 118);
  line(102, 129, 136, 108);
  line(74-mouseX, 206, 111+mouseX, 204);
  line(93, 189-mouseY, 93, 225+mouseY);
  line(19, 321, 49, 321);
  line(34, 310, 34, 335);
  line(24, 310, 45, 330);
  line(24, 330, 45, 310);
  line(227, 294, 210, 310);
  line(210, 310, 235, 325-mouseX/20);
  line(235, 325-mouseX/20, 216, 342-mouseX/18);
  line(216, 342-mouseX/18, 243, 357-mouseX/15);
  line(243, 357-mouseX/15, 221, 379-mouseX/12);
  line(221, 379-mouseX/12, 238, 392-mouseX/10);
  line(124, 457, 178, 428);
  line(269, 285, 269, 305);
  line(238, 459, 278, 482);
  line(241, 471, 281, 467);
  line(243, 489, 269, 459);
  line(255, 452, 261, 489);
  line(452-mouseX, 376, 482+mouseX, 376);
  line(463, 356-mouseY, 463, 395+mouseY);
  line(443, 266, 465, 302);
  line(436, 284, 470, 284);
  line(436, 300, 470, 271);
  line(457, 262, 450, 302);
  line(469, 50, 482, 37);
  line(482, 37, 494, 56);
  line(494, 56, 500, 50);
  line(441, 16, 457, 38);
  line(436, 28, 465, 28);
  line(439, 38, 457, 20);
  line(450, 14, 450, 44);
  line(305, 38, 327, 28);

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

  //black balls
  fill(0);
  stroke(0);
  beginShape();
  vertex(93, 189); // first point
  bezierVertex(78, 191, 63, 164, 83, 151);
  bezierVertex(106, 136, 128, 182, 93, 189);
  endShape();
  
  float i= mouseX/30;
  beginShape();
  vertex(147, 194+i); // first point
  bezierVertex(153, 182+i, 184, 180+i, 184, 204+i);
  bezierVertex(184, 231+i, 134, 224+i, 147, 194+i);
  endShape();

  float j= mouseX/20;
  beginShape();
  vertex(136, 242+j); // first point
  bezierVertex(147, 240+j, 150, 257+j, 138, 259+j);
  bezierVertex(126, 260+j, 125, 243+j, 136, 242+j);
  endShape();

  beginShape();
  vertex(226, 294+i); // first point
  bezierVertex(215, 289+i, 224, 275+i, 233, 280+i);
  bezierVertex(243, 284+i, 237, 300+i, 226, 294+i);
  endShape();

  beginShape();
  vertex(267, 304); // first point
  bezierVertex(288, 305, 285, 331, 267, 330);
  bezierVertex(249, 327, 254, 305, 267, 304);
  endShape();

  beginShape();
  vertex(266, 365+j); // first point
  bezierVertex(288, 365+j, 285, 393+j, 266, 391+j);
  bezierVertex(247, 389+j, 252, 365+j, 266, 365+j);
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

  //green balls
  fill(25, 60, 6, 90);
  stroke(25, 60, 6);

  ///make green ball the main object moved with mouse
  float oX = 71;
  float oY = 29;
  beginShape();
  vertex(mouseX, mouseY); // first point
  bezierVertex(mouseX-oX-24, mouseY-oY+22, mouseX-oX-22, mouseY-oY-88, mouseX-oX+67, mouseY-oY-82);
  bezierVertex(mouseX-oX+183, mouseY-oY-76, mouseX-oX+128, mouseY-oY+33, mouseX, mouseY);
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

  //blue balls


  fill(58, 58+mouseX/random(1, 5), 140+mouseX/3, 90);
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

  // colorful black ball
  fill(0);
  stroke(0);

  ellipse(254, 48, 9, 9);
  ellipse(442, 99, 28, 28);
  ellipse(455, 182, 28, 28);

  beginShape();
  vertex(198, 236); // first point
  bezierVertex(195, 220, 226, 215, 229, 231);
  bezierVertex(233, 245, 200, 253, 198, 236);
  endShape();

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

  // blue triangle
  fill(58, 58, 140, 80);
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
  //fill(0);
  //stroke(0);

  //beginShape();
  //vertex(181, 126); // first point
  //bezierVertex(188, 132, 203, 136, 210, 136);
  //bezierVertex(210, 117, 190, 113, 181, 126);
  //endShape();

  //beginShape();
  //vertex(266, 87); // first point
  //bezierVertex(250, 96, 246, 113, 246, 124);
  //bezierVertex(256, 117, 267, 98, 266, 87);
  //endShape();

  //beginShape();
  //vertex(257, 158); // first point
  //bezierVertex(266, 172, 295, 188, 318, 174);
  //bezierVertex(300, 157, 273, 148, 257, 158);
  //endShape();

  //beginShape();
  //vertex(334, 89); // first point
  //bezierVertex(343, 93, 354, 119, 352, 128);
  //bezierVertex(335, 118, 333, 99, 334, 89);
  //endShape();

  //beginShape();
  //vertex(256, 272); // first point
  //bezierVertex(260, 253, 286, 251, 285, 275);
  //bezierVertex(278, 278, 263, 274, 256, 272);
  //endShape();

  //beginShape();
  //vertex(339, 217); // first point
  //bezierVertex(341, 243, 318, 263, 301, 270);
  //bezierVertex(295, 245, 310, 225, 339, 217);
  //endShape();

  //beginShape();
  //vertex(360, 214); // first point
  //bezierVertex(383, 215, 395, 222, 404, 236);
  //bezierVertex(389, 238, 371, 232, 360, 214);
  //endShape();

  //beginShape();
  //vertex(44, 23); // first point
  //bezierVertex(71, 31, 86, 31, 99, 22);
  //bezierVertex(82, 11, 63, 9, 44, 23);
  //endShape();

  //beginShape();
  //vertex(101, 407); // first point
  //bezierVertex(87, 418, 95, 441, 119, 434);
  //bezierVertex(118, 424, 109, 409, 101, 407);
  //endShape();

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


  
  
  
}  



