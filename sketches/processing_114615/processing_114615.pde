
//draw joan miro the melancholic singer
//Kang-Yu,Liu

float speed = 0.05;



void setup() {
  size(390, 488);
  background(233, 241, 244);
  smooth();
}


void draw() {
  background(233, 241, 244);
  
  noStroke();
  fill(199, 64, 9);
  ellipse(88, 74, 54, 49);
  //top left corner
  noFill();
  stroke(0);
  strokeWeight(1);
  beginShape();
  vertex(75, 53);
  bezierVertex(75, 53, 52, 20, 23, 37);
  bezierVertex(23, 37, 7, 60, 23, 68);
  endShape();

if (mousePressed){
stroke(5);
  beginShape();
  vertex(mouseX, mouseY);
  bezierVertex(66, 63, 43, 42, 32, 77);
  bezierVertex(32, 77, 22, 82, 31, 105);
  endShape();
}
else{
   beginShape();
  vertex(66, 63);
  bezierVertex(66, 63, 43, 42, 32, 77);
  bezierVertex(32, 77, 22, 82, 31, 105);
  endShape();
}

  beginShape();
  vertex(63, 70);
  bezierVertex(63, 70, 57, 60, 44, 73);
  bezierVertex(30, 84, 57, 117, 58, 116);
  endShape();

  beginShape();
  vertex(246, 0);
  bezierVertex(246, 0, 252, 38, 195, 92);
  bezierVertex(138, 144, 90, 186, 51, 288);
  bezierVertex(51, 288, 7, 366, 47, 405);
  bezierVertex(84, 444, 144, 390, 130, 398);
  bezierVertex(126, 402, 192, 348, 150, 323);
  bezierVertex(150, 323, 126, 312, 105, 346);
  endShape();

  beginShape();
  vertex(357, 147);
  bezierVertex(357, 147, 253, 171, 253, 171);
  bezierVertex(253, 171, 222, 180, 205, 210);
  bezierVertex(205, 210, 167, 263, 167, 263);
  bezierVertex(167, 263, 141, 306, 143, 353);
  bezierVertex(143, 353, 135, 438, 195, 429);
  bezierVertex(195, 429, 247, 442, 264, 379);
  bezierVertex(264, 379, 268, 360, 254, 297);
  bezierVertex(254, 297, 228, 207, 300, 176);
  bezierVertex(300, 176, 357, 158, 357, 158);
  endShape();

  beginShape();
  vertex(195, 288);
  bezierVertex(195, 288, 195, 330, 187, 350);
  bezierVertex(187, 350, 177, 464, 177, 464);
  endShape();

  beginShape();
  vertex(221, 274);
  bezierVertex(221, 274, 228, 336, 221, 354);
  bezierVertex(221, 354, 221, 475, 221, 475);
  endShape();

  beginShape();
  vertex(302, 416);
  bezierVertex(302, 416, 306, 438, 293, 470);
  bezierVertex(293, 470, 276, 496, 191, 464);
  endShape();

  strokeWeight(2);
  beginShape();
  vertex(285, 96);
  bezierVertex(285, 96, 351, 52, 384, 141);
  bezierVertex(416, 230, 393, 162, 377, 239);
  bezierVertex(377, 239, 361, 270, 339, 274);
  bezierVertex(339, 274, 303, 274, 312, 250);
  bezierVertex(312, 250, 322, 225, 337, 213);
  bezierVertex(337, 213, 362, 182, 352, 141);
  bezierVertex(352, 141, 354, 126, 321, 120);
  bezierVertex(321, 120, 296, 116, 289, 119);
  bezierVertex(289, 119, 270, 112, 285, 96);
  endShape();



  strokeWeight(1);
  line(139, 305, 244, 305);
  line(191, 332, 265, 332);
  line(239, 323, 239, 385);
  line(334, 288, 334, 375);
  line(285, 332, 372, 326);
  // less two line//
  line(298, 284, 378, 385);
  line(369, 291, 283, 375);

  noStroke();
  fill(0);
  beginShape();
  vertex(153, 130);
  bezierVertex(153, 130, 150, 180, 166, 189);
  bezierVertex(166, 189, 156, 198, 113, 175);
  bezierVertex(113, 175, 126, 150, 153, 130);
  endShape();

  fill(30, 59, 13);
  beginShape();
  vertex(221, 8);
  bezierVertex(221, 8, 183, 12, 153, 130);
  bezierVertex(153, 130, 113, 175, 113, 175);
  bezierVertex(113, 175, 78, 156, 85, 99);
  bezierVertex(85, 99, 90, 42, 221, 8);
  endShape();
  ///////////////new//////////////////
  fill(0, 2, 0);
  beginShape();
  vertex(113, 57);
  bezierVertex(113, 57, 130, 93, 85, 99);
  bezierVertex(85, 99, 84, 88, 113, 57);
  endShape();

  fill(0);
  beginShape();
  vertex(107, 343);
  bezierVertex(107, 343, 120, 356, 100, 371);
  bezierVertex(100, 371, 80, 390, 66, 371);
  bezierVertex(66, 371, 56, 362, 76, 347);
  bezierVertex(76, 347, 92, 330, 107, 343);
  endShape();




  fill(0);//circle,i want to this move
  beginShape();
  vertex(290, 405);
  bezierVertex(290, 405, 289, 392, 310, 392);
  bezierVertex(310, 392, 327, 389, 327, 405);
  bezierVertex(327, 405, 329, 421, 306, 417);
  bezierVertex(306, 417, 290, 418, 290, 405);
  endShape();

  fill(0);
  beginShape();
  vertex(149, 305);
  bezierVertex(149, 305, 223, 305, 223, 305);
  bezierVertex(223, 305, 222, 331, 222, 331);
  bezierVertex(222, 331, 260, 331, 260, 331);
  bezierVertex(260, 331, 267, 360, 264, 376);
  bezierVertex(264, 376, 264, 432, 197, 430);
  bezierVertex(197, 430, 140, 435, 142, 368);
  bezierVertex(142, 368, 141, 356, 149, 305);
  endShape();

if (mousePressed){
  fill(0,55,55);
   beginShape();
  vertex(mouseX+50, mouseY+120);
  bezierVertex(339, 274, 336, 216, 381, 229);
  bezierVertex(381, 229, 408, 249, 381, 284);
  bezierVertex(381, 284, 354, 303, 339, 274);
  endShape();
  
}

else{
  fill(0);
  beginShape();
  vertex(339, 274);
  bezierVertex(339, 274, 336, 216, 381, 229);
  bezierVertex(381, 229, 408, 249, 381, 284);
  bezierVertex(381, 284, 354, 303, 339, 274);
  endShape();
}
  if (mousePressed) {
    fill(120, 2, 2);
    ellipse(mouseX, mouseY, 30, 32);
  }

  else {
    fill(20, 0, 2);
    ellipse(345, 91, 30, 32);
  }
  fill(0);
  beginShape();
  vertex(260, 207);
  bezierVertex(260, 207, 279, 183, 289, 181);
  bezierVertex(289, 181, 336, 204, 289, 260);
  bezierVertex(289, 260, 303, 237, 278, 218);
  bezierVertex(278, 218, 270, 213, 260, 207);
  endShape();



  fill(0);
  stroke(5);
  beginShape();
  vertex(216, 193);
  bezierVertex(216, 193, 225, 182, 240, 175);
  bezierVertex(240, 175, 248, 144, 226, 136);
  bezierVertex(226, 136, 200, 126, 189, 164);
  bezierVertex(189, 164, 183, 174, 193, 181);
  bezierVertex(193, 181, 204, 186, 209, 168);
  bezierVertex(209, 168, 214, 154, 224, 158);
  bezierVertex(224, 158, 230, 162, 219, 180);
  bezierVertex(219, 180, 213, 188, 216, 193);
  endShape();
  
noStroke();

  fill(26, 56, 155);//blue
  beginShape();
  vertex(339, 274);
  bezierVertex(339, 274, 332, 246, 349, 233);
  bezierVertex(349, 233, 362, 218, 382, 230);
  bezierVertex(382, 230, 378, 239, 370, 248);
  bezierVertex(370, 248, 359, 241, 353, 250);
  bezierVertex(353, 250, 346, 259, 351, 268);
  bezierVertex(351, 268, 347, 272, 339, 274);
  endShape();
//
  fill(224, 54, 6);//red
  beginShape();
  vertex(351, 268);
  bezierVertex(351, 268, 361, 265, 370, 248);
  bezierVertex(370, 248, 382, 254, 373, 271);
  bezierVertex(373, 271, 362, 280, 351, 268);
  endShape();

fill(26,56,155);//blue
beginShape();
vertex(260,207);
bezierVertex(260,207,254,194,265,185);
bezierVertex(265,185,274,176,289,181);
bezierVertex(289,181,276,183,260,207);
endShape();

fill(224,54,6);//red
 beginShape ();
vertex(216,193);
bezierVertex(216,193,220,202,230,197);
bezierVertex(230,197,246,192,240,175);
bezierVertex(240,175,231,179,216,193);
endShape();

fill(224,54,6);//red
 beginShape ();
vertex(331,85);
bezierVertex(331,85,348,86,357,100);
bezierVertex(357,100,346,112,336,103);
bezierVertex(336,103,328,100,331,85);
endShape();

fill(224,54,6);//red
 beginShape ();
vertex(182,400);
bezierVertex(182,400,221,402,221,402);
bezierVertex(221,402,222,427,222,427);
bezierVertex(222,427,210,432,179,427);
bezierVertex(179,427,182,400,182,400);
endShape();

fill(224,54,6);//red
 beginShape ();
vertex(157,366);
bezierVertex(157,366,184,375,184,375);
bezierVertex(184,375,182,400,182,400);
bezierVertex(182,400,150,400,150,400);
bezierVertex(150,400,146,385,146,385);
bezierVertex(146,385,159,378,157,366);
endShape();


}



