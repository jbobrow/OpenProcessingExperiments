
// prcatice to give strcture create a clock on Miro
// let sun and one star become a second hand
// lin wenyu  N76014118


//global variables
int constant = 380;
float angle = 0.05;
int scalar = 2;
float speed = 0.05;


void setup() {
  size(500, 620);
  background(235, 238, 232);
  //frameRate(8);
  smooth();
}

void draw() {

  background(235, 238, 232-mouseX/4);

//star become the second hand
  drawOneStar();

  //two points change color and move
  noStroke();
  fill(mouseX+random(50), mouseY-random(50), 0);
  float x = constant + cos(angle) * scalar;
  float y = 358;
  beginShape();//1
  vertex(x+12, y+138);
  bezierVertex(x+49, y+144, x+46, y+172, x+12, y+172);
  bezierVertex(x-15, y+172, x-15, y+139, x+12, y+138);
  endShape();

  noStroke();
  fill(mouseX+random(50), mouseY-random(50), 0);
  beginShape();//2
  vertex(x-244, y+80);
  bezierVertex(x-258, y+64, x-294, y+80, x-298, y+102);
  bezierVertex(x-292, y+142, x-230, y+106, x-244, y+80);
  endShape();
  angle = angle + speed;


  drawBlackLines();
  drawColors();

  /*
  if (mousePressed) {  //draw if moon move else sun moon   
   
   fill(28, 63, 13);//moon up
   beginShape();
   vertex(282, 4);
   bezierVertex(230, 18, 178, 40, 144, 72);
   bezierVertex(134, 78, 114, 104, 110, 120);//moon connect circle
   bezierVertex(98, 150, 120, 202, 144, 218);
   bezierVertex(182, 174, 145, 213, 197, 162);//moon connect triangle
   bezierVertex(200, 112, 244, 26, 282, 4);
   endShape();
   
   fill(0, 0, 0);//moon down
   beginShape();
   vertex(197, 162);
   bezierVertex(182, 174, 145, 213, 144, 218);
   bezierVertex(156, 226, 186, 238, 212, 238);
   bezierVertex(200, 232, 194, 200, 197, 162);
   endShape();
   
   noStroke();
   fill(mouseX+random(50), mouseY-random(50), 7);//circle up
   beginShape();
   vertex(mouseX, mouseY);
   bezierVertex(mouseX-10, mouseY+6, mouseX-30, mouseY+32, mouseX-34, mouseY+48);//moon connect circle
   bezierVertex(mouseX-94, mouseY+32, mouseX-52, mouseY-40, mouseX, mouseY);
   endShape();
   
   fill(0, 0, 0);
   beginShape();//circle down
   vertex(mouseX, mouseY);
   bezierVertex(mouseX-10, mouseY+6, mouseX-30, mouseY+32, mouseX-34, mouseY+48);
   bezierVertex(mouseX+2, mouseY+52, mouseX+17, mouseY+14, mouseX, mouseY);
   endShape();
   
   noFill();
   stroke(1);
   beginShape();//line 3
   vertex(mouseX-48, mouseY-6);
   bezierVertex(54, 16, 6, 46, 28, 84);
   endShape();
   
   beginShape();//line 4
   vertex(mouseX-58, mouseY+4);
   bezierVertex(54, 54, 28, 90, 42, 130);
   endShape();
   
   beginShape();//line 5
   vertex(mouseX-62, mouseY+14);
   bezierVertex(66, 76, 42, 102, 76, 146);
   endShape();
   }
   else {
   */

//three lines with the mouse movement
  noFill();
  stroke(1);
  beginShape();//line 3
  vertex(mouseX-20, mouseY+26);
  //bezierVertex(mouseX-30, mouseY+14, mouseX-40, mouseY+2, mouseX-48, mouseY-6);
  //bezierVertex(54, 16, 6, 46, 28, 84);
  bezierVertex(mouseX-90, mouseY-56, 6, 46, 28, 84);
  endShape();

  beginShape();//line 4
  vertex(mouseX-26, mouseY+36);
  //bezierVertex(mouseX-38, mouseY+24, mouseX-48, mouseY+14, mouseX-58, mouseY+4);
  bezierVertex(mouseX-90, mouseY-18, 28, 90, 42, 130);
  endShape();

  beginShape();//line 5
  vertex(mouseX-32, mouseY+43);
  //bezierVertex(mouseX-42, mouseY+32, mouseX-52, mouseY+22, mouseX-62, mouseY+14);
  bezierVertex(mouseX-78, mouseY+4, 42, 102, 76, 146);
  endShape();

//mouse control moon
  noStroke();
  fill(mouseX+random(50), mouseY-random(50), 13);//moon up
  beginShape();
  vertex(mouseX+138, mouseY-68);
  bezierVertex(mouseX+86, mouseY-54, mouseX+34, mouseY-32, mouseX, mouseY);
  bezierVertex(mouseX-10, mouseY+6, mouseX-30, mouseY+32, mouseX-34, mouseY+48);//moon connect circle
  bezierVertex(mouseX-46, mouseY+78, mouseX-24, mouseY+130, mouseX, mouseY+146);
  bezierVertex(mouseX+38, mouseY+102, mouseX+1, mouseY+141, mouseX+53, mouseY+90);//moon connect triangle
  bezierVertex(mouseX+56, mouseY+40, mouseX+100, mouseY-48, mouseX+138, mouseY-68);
  endShape();

  fill(0, 0, 0);//moon down
  beginShape();
  vertex(mouseX+53, mouseY+90);
  bezierVertex(mouseX+38, mouseY+102, mouseX+1, mouseY+141, mouseX, mouseY+146);
  bezierVertex(mouseX+12, mouseY+154, mouseX+42, mouseY+166, mouseX+68, mouseY+166);
  bezierVertex(mouseX+56, mouseY+160, mouseX+50, mouseY+128, mouseX+53, mouseY+90);
  endShape();

//sun become the second hand
  drawSun(235, 160);

  //}
}

void drawColors() {
  noStroke();
  //fill(28,63,13);//moon up
  //beginShape();
  //vertex(282,4);
  //bezierVertex(230,18,178,40,144,72);
  //bezierVertex(134,78,114,104,110,120);//moon connect circle
  //bezierVertex(98,150,120,202,144,218);
  //bezierVertex(182,174,145,213,197,162);//moon connect triangle
  //bezierVertex(200,112,244,26,282,4);
  //endShape();
  //
  //fill(0,0,0);//moon down
  //beginShape();
  //vertex(197,162);
  //bezierVertex(182,174,145,213,144,218);
  //bezierVertex(156,226,186,238,212,238);
  //bezierVertex(200,232,194,200,197,162);
  //endShape();
  //
  //beginShape();//circle down
  //vertex(144,72);
  //bezierVertex(134,78,114,104,110,120);
  //bezierVertex(146,120,158,86,144,72);
  //endShape();
  //
  //fill(197,62,7);//circle up
  //beginShape();
  //vertex(144,72);
  //bezierVertex(134,78,114,104,110,120);//moon connect circle
  //bezierVertex(50,104,92,32,144,72);
  //endShape();

  fill(0, 0, 0);
  beginShape();//ca
  vertex(488, 290);
  bezierVertex(486, 296, 480, 306, 476, 312);//a
  bezierVertex(466, 322, 458, 334, 450, 338);//b
  bezierVertex(447, 342, 438, 346, 436, 345);//c
  bezierVertex(470, 386, 526, 330, 488, 290);//ca
  endShape();

  fill(43, 54, 157);
  beginShape();//cd
  vertex(488, 290);
  bezierVertex(486, 296, 480, 306, 476, 312);//a
  bezierVertex(466, 322, 458, 334, 450, 338);//b
  bezierVertex(447, 342, 438, 346, 436, 345);//c
  bezierVertex(422, 306, 462, 274, 488, 290);//cd
  endShape();

  fill(0, 0, 0);
  beginShape();//cc
  vertex(476, 312);
  bezierVertex(466, 322, 458, 334, 450, 338);//b
  bezierVertex(438, 314, 464, 302, 476, 312);//cc
  endShape();

  fill(197, 62, 7);
  beginShape();//cb
  vertex(476, 312);
  bezierVertex(466, 322, 458, 334, 450, 338);//b
  bezierVertex(472, 356, 490, 326, 476, 312);//cb
  endShape();

  fill(0, 0, 0);
  beginShape();//cf
  vertex(426, 106);
  bezierVertex(434, 88, 466, 98, 456, 122);//cf
  bezierVertex(474, 138, 480, 148, 486, 156);//i
  bezierVertex(489, 161, 493, 173, 495, 183);//j
  bezierVertex(530, 138, 530, 202, 486, 156);//ch
  bezierVertex(474, 146, 460, 138, 446, 132);//cg
  bezierVertex(450, 130, 455, 125, 455, 123);//cg
  bezierVertex(448, 114, 436, 110, 426, 106);//cf
  endShape();

  fill(197, 62, 7);
  beginShape();
  vertex(426, 106);
  bezierVertex(436, 110, 448, 114, 455, 123);
  bezierVertex(455, 125, 450, 130, 446, 132);
  bezierVertex(434, 136, 416, 128, 426, 106);//ce
  endShape();

  fill(0, 0, 0);//comma
  beginShape();//ba
  vertex(368, 328);
  bezierVertex(402, 274, 401, 248, 370, 228);
  bezierVertex(362, 232, 342, 246, 336, 260);//zb
  bezierVertex(362, 272, 380, 294, 368, 328);
  endShape();

  fill(43, 54, 157);
  beginShape();//bb
  vertex(370, 228);
  bezierVertex(362, 232, 342, 246, 336, 260);//zb
  bezierVertex(322, 238, 352, 220, 370, 228);
  endShape();

  fill(0, 0, 0);//horseshoe
  beginShape();//bd
  vertex(310, 220);
  bezierVertex(299, 226, 286, 234, 277, 244);//zq
  bezierVertex(278, 239, 278, 232, 280, 230);
  bezierVertex(283, 223, 286, 215, 288, 208);
  bezierVertex(292, 196, 278, 186, 270, 204);
  bezierVertex(259, 240, 226, 230, 245, 196);
  bezierVertex(258, 156, 325, 156, 310, 220);
  endShape();

  fill(197, 62, 7);
  beginShape();//bc
  vertex(310, 220);
  bezierVertex(299, 226, 286, 234, 277, 244);//zq
  bezierVertex(286, 258, 308, 250, 310, 220);
  endShape();

  fill(0, 0, 0);//bag
  beginShape();
  vertex(332, 418);
  bezierVertex(334, 423, 335, 428, 336, 434);//zd
  bezierVertex(343, 451, 342, 479, 336, 492);//ze
  bezierVertex(334, 500, 328, 511, 324, 514);//zf
  bezierVertex(318, 525, 299, 540, 286, 541);//zg
  bezierVertex(272, 546, 244, 546, 228, 541);//zh
  bezierVertex(211, 536, 196, 524, 191, 508);//zi
  bezierVertex(189, 504, 186, 496, 186, 488);//zj
  bezierVertex(184, 480, 182, 471, 183, 460);//zk
  bezierVertex(182, 450, 183, 435, 185, 427);//zl
  bezierVertex(184.5, 418, 187, 411.5, 188, 407);//zm
  bezierVertex(189, 398, 190, 392, 192, 385);//zn
  bezierVertex(224, 385, 258, 385, 288, 385);
  bezierVertex(287, 398, 287, 410, 287, 418);
  bezierVertex(302, 418, 320, 418, 332, 418);
  endShape();


  noStroke();
  fill(197, 62, 7);
  beginShape();//r1
  vertex(286, 418);
  bezierVertex(272, 418, 270, 418, 265, 418);
  bezierVertex(265, 415, 266, 409, 267, 404);
  bezierVertex(272, 404, 279, 404, 286, 404);
  bezierVertex(286, 409, 286, 415, 286, 418);
  endShape();

  beginShape();//r2
  vertex(332, 418);
  bezierVertex(334, 423, 335, 428, 336, 434);//zd
  bezierVertex(325, 434, 316, 435, 307, 435);
  bezierVertex(307, 428, 307, 423, 308, 419);
  bezierVertex(316, 419, 325, 418, 332, 418);
  endShape();

  beginShape();//r3
  vertex(336, 492);
  bezierVertex(334, 500, 328, 511, 324, 514);//zf
  bezierVertex(312, 511, 300, 509, 287, 508);
  bezierVertex(287, 501, 287, 493, 287, 485);
  bezierVertex(312, 487, 318, 490, 336, 492);
  endShape();

  beginShape();//r4
  vertex(286, 541);
  bezierVertex(272, 546, 244, 546, 231, 541);//zh
  bezierVertex(232, 531, 233, 517, 234, 507);
  bezierVertex(251, 507, 269, 508, 284, 510);
  bezierVertex(285, 517, 286, 531, 286, 541);
  endShape();

  beginShape();//r5
  vertex(191, 508);
  bezierVertex(189, 504, 186, 496, 188, 488);//zj
  bezierVertex(194, 482, 201, 473, 204, 465);
  bezierVertex(214, 467, 224, 470, 237, 473);
  bezierVertex(235, 484, 234, 494, 233, 506);
  bezierVertex(220, 507, 205, 507, 191, 508);
  endShape();

  fill(28, 63, 13);
  beginShape();//g1
  vertex(264, 420);
  bezierVertex(264, 425, 263, 430, 263, 435);
  bezierVertex(257, 435, 251, 435, 244, 434.5);
  bezierVertex(244, 429, 246, 425, 246, 420);
  bezierVertex(252, 420, 258, 420, 264, 420);
  endShape();

  beginShape();//g2
  vertex(305, 435);
  bezierVertex(305, 451, 306, 470, 306, 488);
  bezierVertex(299, 486, 293, 486, 287, 485);
  bezierVertex(286, 470, 286, 451, 286, 435);
  bezierVertex(294, 435, 299, 435, 305, 435);
  endShape();

  beginShape();//g3
  vertex(242, 435);
  bezierVertex(240, 441, 240, 448, 239, 453);
  bezierVertex(228, 453, 218, 452, 208, 451);
  bezierVertex(210, 445, 211, 439, 212, 433);
  bezierVertex(221, 434, 231, 434.5, 242, 435);
  endShape();

  fill(43, 54, 157);
  beginShape();//b1
  vertex(267, 387);
  bezierVertex(267, 393, 266, 398, 266, 403);
  bezierVertex(261, 403, 255, 403, 248, 403);
  bezierVertex(249, 398, 250, 393, 251, 387);
  bezierVertex(256, 387, 262, 387, 267, 387);
  endShape();

  beginShape();//b2
  vertex(306, 420);
  bezierVertex(306, 425, 305, 430, 305, 435);
  bezierVertex(299, 435, 293, 435, 286, 435);
  bezierVertex(285, 430, 287, 425, 287, 420);
  bezierVertex(293, 420, 299, 420, 306, 420);
  endShape();

  beginShape();//b3
  vertex(284, 454);
  bezierVertex(284, 462, 285, 472, 285, 482);
  bezierVertex(269, 479, 253, 476, 238, 473);
  bezierVertex(239, 466, 240, 460, 241, 454);
  bezierVertex(254, 454, 269, 454, 284, 454);
  endShape();

  beginShape();//b4
  vertex(210, 432);
  bezierVertex(209, 443, 207, 454, 202, 463);
  bezierVertex(197, 462, 191, 461, 184, 460);
  bezierVertex(182, 450, 183, 435, 186, 428);//zl
  bezierVertex(193, 430, 201, 431, 210, 432);
  endShape();

  fill(252, 241, 2);
  beginShape();//y1
  vertex(285, 420);
  bezierVertex(284, 425, 284, 430, 284, 435);
  bezierVertex(278, 435, 271, 435, 263, 435);
  bezierVertex(263, 430, 264, 420, 264, 420);
  bezierVertex(272, 420, 278, 420, 285, 420);
  endShape();

  fill(248, 138, 1);
  beginShape();//o1
  vertex(249, 386);
  bezierVertex(247, 404, 245, 421, 242, 435);
  bezierVertex(231, 434.5, 221, 434, 212, 433);
  bezierVertex(214, 420, 203, 405, 189, 406);
  bezierVertex(190, 398, 191, 392, 193, 386);//zn
  bezierVertex(212, 386, 231, 386, 249, 386);
  endShape();
}


void drawBlackLines() {
  noFill();
  stroke(1);
  //beginShape();//line 3
  //vertex(96,66);
  //bezierVertex(54,16,6,46,28,84);
  //endShape();
  //
  //beginShape();//line 4
  //vertex(86,76);
  //bezierVertex(54,54,28,90,42,130);
  //endShape();
  //
  //beginShape();//line 5
  //vertex(82,86);
  //bezierVertex(66,76,42,102,76,146);
  //endShape();

  beginShape();//line 6
  vertex(488, 290);
  bezierVertex(486, 296, 480, 306, 476, 312);//a
  bezierVertex(466, 322, 458, 334, 450, 338);//b
  bezierVertex(447, 342, 438, 346, 436, 345);//c
  bezierVertex(402, 352, 384, 328, 415, 288);//d
  bezierVertex(442, 260, 456, 232, 454, 198);//e
  bezierVertex(456, 168, 432, 148, 400, 148);//f
  bezierVertex(326, 154, 350, 96, 426, 106);//g
  bezierVertex(436, 108, 448, 112, 456, 122);//h
  bezierVertex(474, 138, 480, 148, 486, 156);//i
  bezierVertex(489, 161, 493, 173, 495, 183);//j
  bezierVertex(502, 207, 498, 258, 488, 290);//k
  endShape();

  beginShape();//line 1
  vertex(246, 586);
  bezierVertex(281, 612, 361, 613, 378, 596);
  bezierVertex(385, 583, 386, 540, 387, 530);
  endShape();

  beginShape();
  vertex(316, 0);//line 2
  bezierVertex(317, 50, 232, 120, 197, 162);
  bezierVertex(182, 174, 145, 213, 144, 218);//moon connect triangle
  bezierVertex(106, 265, 39, 382, 40, 460);
  bezierVertex(40, 486, 60, 532, 96, 532);
  bezierVertex(129, 532, 162, 514, 186, 488);
  bezierVertex(223, 452, 211, 406, 188, 407);//color center
  bezierVertex(162, 408, 144, 422, 136, 438);
  endShape();

  beginShape();
  vertex(495, 183);//line 7
  bezierVertex(484, 192, 474, 202, 468, 210);
  endShape();

  beginShape();
  vertex(456, 196);
  bezierVertex(422, 205, 386, 218, 370, 228);//za
  bezierVertex(362, 232, 342, 246, 336, 260);//zb
  bezierVertex(308, 302, 318, 334, 332, 418);//zc
  bezierVertex(334, 423, 335, 428, 336, 434);//zd
  bezierVertex(343, 451, 342, 479, 336, 492);//ze
  bezierVertex(334, 500, 328, 511, 324, 514);//zf
  bezierVertex(318, 525, 299, 540, 286, 541);//zg
  bezierVertex(272, 546, 244, 546, 228, 541);//zh
  bezierVertex(211, 536, 196, 524, 191, 508);//zi
  bezierVertex(189, 504, 186, 496, 186, 488);//zj
  bezierVertex(184, 480, 182, 471, 183, 460);//zk
  bezierVertex(182, 450, 183, 435, 185, 427);//zl
  bezierVertex(184.5, 418, 187, 411.5, 188, 407);//zm
  bezierVertex(189, 398, 190, 392, 192, 385);//zn
  bezierVertex(201, 343, 221, 308, 242, 282);//zo
  bezierVertex(254, 268, 266, 252, 277, 244);//zp
  bezierVertex(286, 234, 299, 226, 310, 220);//zq
  bezierVertex(352, 200, 398, 193, 458, 184);//zr
  endShape();

  beginShape();//line 8
  vertex(251, 363);
  bezierVertex(252, 380, 248, 415, 244, 434);
  bezierVertex(236, 480, 228, 530, 224, 590);
  endShape();

  beginShape();//line 9
  vertex(286, 342);
  bezierVertex(287, 380, 287, 421, 284, 454);
  bezierVertex(288, 490, 288, 548, 286, 602);
  endShape();

  beginShape();//line 10
  vertex(308, 407);
  bezierVertex(306, 438, 306, 467, 307, 486);
  endShape();

  line(178, 385, 312, 385);//line 11
  line(244, 418, 339, 418);//line 12
}

//star function
void drawOneStar() {
  int s=second();

  pushMatrix();
  translate(427, 418);
  rotate(PI/30*s);
  stroke(mouseX, mouseY, 0);
  strokeWeight(1);
  line(427-380, 418-358, 427-485, 418-490);//star
  line(427-362, 418-418, 427-476, 418-410);
  line(427-362, 418-472, 427-472, 418-368);
  line(427-425, 418-365, 427-429, 418-477);
  popMatrix();
}

//sun function
void drawSun(float posx, float posy) {
  int s=second();

  noStroke();
  fill(0, 0, 0);
  pushMatrix();
  translate(posx, posy);
  rotate(PI/30*s);
  beginShape();//sun down
  vertex(posx-144, posy-72);
  bezierVertex(posx-134, posy-78, posx-114, posy-104, posx-110, posy-120);
  bezierVertex(posx-146, posy-120, posx-158, posy-86, posx-144, posy-72);
  endShape();

  fill(197, 62, 7);//sun up
  beginShape();
  vertex(posx-144, posy-72);
  bezierVertex(posx-134, posy-78, posx-114, posy-104, posx-110, posy-120);//moon connect circle
  bezierVertex(posx-50, posy-104, posx-92, posy-32, posx-144, posy-72);
  endShape();
  popMatrix();

  /*
  noStroke();
   fill(0, 0, 0);
   beginShape();//circle down
   vertex(144, 72);
   bezierVertex(134, 78, 114, 104, 110, 120);
   bezierVertex(146, 120, 158, 86, 144, 72);
   endShape();
   
   fill(197, 62, 7);//circle up
   beginShape();
   vertex(144, 72);
   bezierVertex(134, 78, 114, 104, 110, 120);//moon connect circle
   bezierVertex(50, 104, 92, 32, 144, 72);
   endShape();
   */
}

void keyPressed() {
  saveFrame (" screen-####.jpg");
}



