
//draw joan miro the melancholic singer
//reestablish all
//17 Oct. 2013 by Kang-Yu,Liu

/*float JumpR = random(0, 2);//for redShape
 float JumpB = random(30, 80);//for blueShape
 float JumpG = random(20, 150);//for greenShape
 */
void setup() {
  size(390, 488);
  smooth();
}

void draw() {
  background(233, 241, 244);

  int s =second();
  int m = minute();
  int h = hour(); 
  int y = year();
  String T=(y+" /"+h+" /"+m+" /"+s);
  textSize(10);
  fill(10, 0, 0);
  text(T, mouseX+50, mouseY+50, -30);


  drawGreenShapeI(149.5, 82);

  noStroke();
  fill(199, 64, 9);
  ellipse(88, 74, 54, 49);
  //top left corner

  if (mousePressed) {
    noFill();
    stroke(0);
    strokeWeight(1);
    beginShape();
    vertex(mouseX, mouseY);
    /*
  vertex(75, 53);
     */
    bezierVertex(75, 53, 52, 20, 23, 37);
    bezierVertex(23, 37, 7, 60, 23, 68);
    endShape();
  }
  else { 
    noFill();
    stroke(0);
    strokeWeight(1);
    beginShape();

    vertex(75, 53);

    bezierVertex(75, 53, random(52), random(20), 23, 37);
    bezierVertex(23, 37, random(7), random(60), 23, 68);
    endShape();
  }
  if (mousePressed) {
    stroke(5);
    beginShape();
    vertex(mouseX, mouseY);
    bezierVertex(66, 63, 43, 42, 32, 77);
    bezierVertex(32, 77, 22, 82, 31, 105);
    endShape();
  }
  else {
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

  beginShape();//line
  vertex(195, 288);
  bezierVertex(195, 288, 195, 330, 187, 350);
  bezierVertex(187, 350, 177, 464, 177, 464);
  endShape();

  beginShape();//line
  vertex(221, 274);
  bezierVertex(221, 274, 228, 336, 221, 354);
  bezierVertex(221, 354, 221, 475, 221, 475);
  endShape();

  if (mousePressed) {
    beginShape();
    vertex(mouseX+20, mouseY+20);//line
    bezierVertex(302, 416, 306, 438, 293, 470);
    bezierVertex(293, 470, 276, 496, 191, 464);
    endShape();
  }
  else {
    beginShape();
    vertex(302, 416);//line
    bezierVertex(302, 416, 306, 438, 293, 470);
    bezierVertex(293, 470, 276, 496, 191, 464);
    endShape();
  }

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

  noStroke();
  fill(0);
  beginShape();
  vertex(153, 130);
  bezierVertex(153, 130, 150, 180, 166, 189);
  bezierVertex(166, 189, 156, 198, 113, 175);
  bezierVertex(113, 175, 126, 150, 153, 130);
  endShape();

  fill(0);
  beginShape();
  vertex(107, 343);
  bezierVertex(107, 343, 120, 356, 100, 371);
  bezierVertex(100, 371, 80, 390, 66, 371);
  bezierVertex(66, 371, 56, 362, 76, 347);
  bezierVertex(76, 347, 92, 330, 107, 343);
  endShape();

  if (mousePressed) {

    drawDot(mouseX+20, mouseY+20);//black
  }
  else {
    drawDot(308.4, 404.5);
  }
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
  vertex(349, 107);
  bezierVertex(349, 107, 358, 100, 358, 100);
  bezierVertex(358, 100, 382, 120, 386, 147);
  bezierVertex(386, 147, 390, 143, 390, 143);
  bezierVertex(390, 143, 390, 131, 390, 131);
  bezierVertex(390, 131, 349, 107, 349, 107);
  endShape();


  fill(0);
  beginShape();
  vertex(260, 207);
  bezierVertex(260, 207, 279, 183, 289, 181);
  bezierVertex(289, 181, 336, 204, 289, 260);
  bezierVertex(289, 260, 303, 237, 278, 218);
  bezierVertex(278, 218, 270, 213, 260, 207);
  endShape();

  fill(0);
  beginShape();
  vertex(339, 274);
  bezierVertex(339, 274, 336, 216, 381, 229);
  bezierVertex(381, 229, 408, 249, 381, 284);
  bezierVertex(381, 284, 354, 303, 339, 274);
  endShape();


  fill(0, 2, 0);//half moon
  beginShape();
  vertex(113, 57);
  bezierVertex(113, 57, 130, 93, 85, 99);
  bezierVertex(85, 99, 84, 88, 113, 57);
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



  strokeWeight(1);
  line(139, 305, 244, 305);
  line(191, 332, 265, 332);
  line(239, 323, 239, 385);
  line(334, 288, 334, 375);
  line(285, 332, 372, 326);
  line(298, 284, 378, 385);
  line(369, 291, 283, 375);


  drawRedShapeI(362, 259.5);
  drawRedShapeII(228, 195);
  drawRedShapeIII(351.5, 98.5);
  drawRedShapeIV(200.5, 413.5);
  drawRedShapeV(165, 383);
  drawRedShapeVI(241, 394.5);
  drawRedShapeVII(250.5, 337);
  drawRedShapeVIII(208, 320);

  drawBlueShape(359.5, 256);
  drawBlueShapeI(274.5, 194);
  drawBlueShapeII(204.5, 368.5);
  drawBlueShapeIII(152.5, 352);
  drawBlueShapeIV(222, 331);
  drawBlueShapeV(201, 312);

  drawGreenShapeII(230.5, 364);
  drawGreenShapeIII(175, 350);
  drawGreenShapeIV(198, 337.5);

  drawYellowShape(206, 332);

  drawOrangeShape(170, 324.5);
}

void drawDot(float x, float y) {
  fill(0);//circle,i want to this move
  beginShape();
  // center at (308.5, 404.5);
  float cX = x;
  float cY = y;
  vertex(cX-18.5, cY+0.5);
  bezierVertex(cX-18.5, cY+0.5, cX-19.5, cY-12.5, cX+1.5, cY-12.5);
  bezierVertex(cX+1.5, cY-12.5, cX+18.5, cY-15.5, cX+18.5, cY+0.5);
  bezierVertex(cX+18.5, cY+0.5, cX+20.5, cY+16.5, cX-2.5, cY+12.5);
  bezierVertex(cX-2.5, cY+12.5, cX-18.5, cY+13.5, cX-18.5, cY+0.5);
  endShape();
}
////////////////////////////red////////////////////////////////
void drawRedShapeI(float x, float y) {
  fill(224, 54, 6);//red
  beginShape();
  //center(362,259.5)
  float cX=x;
  float cY=y;
  vertex(cX-11, cY+8.5);
  bezierVertex(cX-11, cY+8.5, cX-1, cY+5.5, cX+8, cY-11.5);
  bezierVertex(cX+8, cY-11.5, cX+20, cY-5.5, cX+11, cY+12.5);
  bezierVertex(cX+11, cY+12.5, cX, cY+20.5, cX-11, cY+8.5);
  endShape();
}
void drawRedShapeII(float x, float y) {
  fill(224, 54, 6);//red
  beginShape();
  //center(228,195)
  float cX=x;
  float cY=y;
  vertex(cX-12, cY-2);
  bezierVertex(cX-12, cY-2, cX-8, cY+7, cX+2, cY+2);
  bezierVertex(cX+2, cY+2, cX+18, cY-3, cX+12, cY-20);
  bezierVertex(cX+12, cY-20, cX+3, cY-16, cX-12, cY-2);
  endShape();
}

void drawRedShapeIII(float x, float y) {
  //center(351.5,98.5)
  fill(224, 54, 6);//red
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-20.5, cY-13.5);
  bezierVertex(cX-20.5, cY-13.5, cX-3.5, cY-12.5, cX+5.5, cY+1.5);
  bezierVertex(cX+5.5, cY+1.5, cX-5.5, cY+13.5, cX-15.5, cY+4.5);
  bezierVertex(cX-15.5, cY+4.5, cX-23.5, cY+1.5, cX-20.5, cY-13.5);
  endShape();
}

void drawRedShapeIV(float x, float y) {
  //center(200.5,413.5)
  fill(224, 54, 6);//red
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-18.5, cY-13.5);
  bezierVertex(cX-18.5, cY-13.5, cX+20.5, cY-11.5, cX+20.5, cY-11.5);
  bezierVertex(cX+20.5, cY-11.5, cX+21.5, cY+13.5, cX+21.5, cY+13.5);
  bezierVertex(cX+21.5, cY+13.5, cX+9.5, cY+18.5, cX-21.5, cY+13.5);
  bezierVertex(cX-21.5, cY+13.5, cX-18.5, cY-13.5, cX-18.5, cY-13.5);
  endShape();
}

void drawRedShapeV(float x, float y) {
  //center(165,383)
  fill(224, 54, 6);//red
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-8, cY-17);
  bezierVertex(cX-8, cY-17, cX+19, cY-8, cX+19, cY-8);
  bezierVertex(cX+19, cY-8, cX+17, cY+17, cX+17, cY+17);
  bezierVertex(cX+17, cY+17, cX-15, cY+17, cX-15, cY+17);
  bezierVertex(cX-15, cY+17, cX-19, cY+2, cX-19, cY+2);
  bezierVertex(cX-19, cY+2, cX-6, cY-5, cX-8, cY-17);
  endShape();
}

void drawRedShapeVI(float x, float y) {
  //center(241,394.5)
  fill(224, 54, 6);//red
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-18, cY-10.5);
  bezierVertex(cX-18, cY-10.5, cX+18, cY-6.5, cX+18, cY-6.5);
  bezierVertex(cX+18, cY-6.5, cX+17, cY+1.5, cX+9, cY+10.5);
  bezierVertex(cX+9, cY+10.5, cX-18, cY+6.5, cX-18, cY+6.5);
  bezierVertex(cX-18, cY+6.5, cX-18, cY-10.5, cX-18, cY-10.5);
  endShape();
}

void drawRedShapeVII(float x, float y) {
  //center(250.5,337)
  fill(224, 54, 6);//red
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-11.5, cY-6);
  bezierVertex(cX-11.5, cY-6, cX+9.5, cY-6, cX+9.5, cY-6);
  bezierVertex(cX+9.5, cY-6, cX+11.5, cY+6, cX+11.5, cY+6);
  bezierVertex(cX+11.5, cY+6, cX-11.5, cY+6, cX-11.5, cY+6);
  bezierVertex(cX-11.5, cY+6, cX-11.5, cY-6, cX-11.5, cY-6);
  endShape();
}

void drawRedShapeVIII(float x, float y) {
  //center215.5,325.5)
  fill(224, 54, 6);//red
  float cX=x;
  float cY=y;
  rect(cX, cY, 15, 11);
}
/////////////////////////blue///////////////////////////

void drawBlueShape(float x, float y) {
  //center(359.5,256)
  fill(26, 56, 155);//blue
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-20.5, cY+18);
  bezierVertex(cX-20.5, cY+18, cX-27.5, cY-10, cX-10.5, cY-23);
  bezierVertex(cX-10.5, cY-23, cX+2.5, cY-38, cX+22.5, cY-26);
  bezierVertex(cX+22.5, cY-26, cX+18.5, cY-17, cX+10.5, cY-8);
  bezierVertex(cX+10.5, cY-8, cX-0.5, cY-15, cX-6.5, cY-6);
  bezierVertex(cX-6.5, cY-6, cX-13.5, cY+3, cX-8.5, cY+12);
  bezierVertex(cX-8.5, cY+12, cX-12.5, cY+16, cX-20.5, cY+18);
  endShape();
}

void drawBlueShapeI(float x, float y) {
  //center(274.5,194)
  fill(26, 56, 155);//blue
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-14.5, cY+13);
  bezierVertex(cX-14.5, cY+13, cX-20.5, cY, cX-9.5, cY-9);
  bezierVertex(cX-9.5, cY-9, cX-0.5, cY-18, cX+14.5, cY-13);
  bezierVertex(cX+14.5, cY-13, cX+1.5, cY-11, cX-14.5, cY+13);
  endShape();
}

void drawBlueShapeII(float x, float y) {
  //center(204.5,368.5)
  fill(26, 56, 155);//blue
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-16.5, cY-10.5);
  bezierVertex(cX-16.5, cY-10.5, cX+16.5, cY-10.5, cX+16.5, cY-10.5);
  bezierVertex(cX+16.5, cY-10.5, cX+16.5, cY+10.5, cX+16.5, cY+10.5);
  bezierVertex(cX+16.5, cY+10.5, cX-18.5, cY+4.5, cX-18.5, cY+4.5);
  bezierVertex(cX-18.5, cY+4.5, cX-16.5, cY-10.5, cX-16.5, cY-10.5);
  endShape();
}

void drawBlueShapeIII(float x, float y) {
  //center(152.5,352)
  fill(26, 56, 155);//blue
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-7.5, cY-14);
  bezierVertex(cX-7.5, cY-14, cX+9.5, cY-10, cX+9.5, cY-10);
  bezierVertex(cX+9.5, cY-10, cX+10.5, cY+2, cX+4.5, cY+14);
  bezierVertex(cX+4.5, cY+14, cX-9.5, cY+11, cX-9.5, cY+11);
  bezierVertex(cX-9.5, cY+11, cX-9.5, cY-6, cX-7.5, cY-14);
  endShape();
}

void drawBlueShapeIV(float x, float y) {
  //center(222,331)
  fill(26, 56, 155);//blue
  float cX=x;
  float cY=y;
  rect(cX, cY, 15, 11);
}

void drawBlueShapeV(float x, float y) {
  //center(201,312)
  fill(26, 56, 155);//blue
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-6, cY-6);
  bezierVertex(cX-6, cY-6, cX+7, cY-6, cX+7, cY-6);
  bezierVertex(cX+7, cY-6, cX+7, cY+6, cX+7, cY+6);
  bezierVertex(cX+7, cY+6, cX-7, cY+6, cX-7, cY+6);
  bezierVertex(cX-7, cY+6, cX-6, cY+0, cX-6, cY-6);
  endShape();
}

//////////////////GREEN////////////////////////
void drawGreenShapeI(float x, float y) {
  //center(149.5,82)
  fill(49, 82, 20);//green,moon
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX+72, cY-74);
  bezierVertex(cX+71.5, cY-74, cX+33.5, cY-70, cX+3.5, cY+48);
  bezierVertex(cX+3.5, cY+48, cX-26.5, cY+93, cX-36.5, cY+93);
  bezierVertex(cX-36.5, cY+93, cX-71.5, cY+74, cX-64.5, cY+17);
  bezierVertex(cX-70.5, cY+17, cX-59.5, cY-40, cX+71.5, cY-74);
  endShape();
}

void drawGreenShapeII(float x, float y) {
  //center(230.5,364)
  fill(49, 82, 20);//green
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-7.5, cY-20);
  bezierVertex(cX-7.5, cY-20, cX+7.5, cY-20, cX+7.5, cY-20);
  bezierVertex(cX+7.5, cY-20, cX+7.5, cY+20, cX+7.5, cY+20);
  bezierVertex(cX+7.5, cY+20, cX-7.5, cY+19, cX-7.5, cY+19);
  bezierVertex(cX-7.5, cY+19, cX-7.5, cY-20, cX-7.5, cY-20);
  endShape();
}

void drawGreenShapeIII(float x, float y) {
  //center(175,350)
  fill(49, 82, 20);//green
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-11, cY-8);
  bezierVertex(cX-11, cY-8, cX+13, cY-7, cX+13, cY-7);
  bezierVertex(cX+13, cY-7, cX+11, cY+8, cX+11, cY+8);
  bezierVertex(cX+11, cY+8, cX-13, cY+7, cX-13, cY+7);
  bezierVertex(cX-13, cY+7, cX-10, cY+0, cX-11, cY-8);
  endShape();
}

void drawGreenShapeIV(float x, float y) {
  //center(198,337.5)
  fill(49, 82, 20);//green
  beginShape();
  float cX=x;
  float cY=y;
  vertex(cX-6, cY-5.5);
  bezierVertex(cX-6, cY-5.5, cX+8, cY-5.5, cX+8, cY-5.5);
  bezierVertex(cX+8, cY-5.5, cX+8, cY+6, cX+8, cY+6);
  bezierVertex(cX+8, cY+6, cX-8, cY+6, cX-8, cY+6);
  bezierVertex(cX-8, cY+6, cX-6, cY+0.5, cX-6, cY-5.5);
  endShape();
}

//////////////////////YELLOW//////////////////////

void drawYellowShape(float x, float y) {
  //center(206,332)
  fill(250, 243, 0);//yellow
  float cX=x;
  float cY=y;
  rect(cX, cY, 15, 11);
}
/////////////////////ORANGE///////////////////////
void drawOrangeShape(float x, float y) {
  //center(170,324.5)
  fill(249, 141, 2);//orange
  float cX=x;
  float cY=y;
  beginShape();
  vertex(cX-20, cY-18.5);
  bezierVertex(cX-20, cY-18.5, cX+23, cY-18.5, cX+23, cY-18.5);
  bezierVertex(cX+23, cY-18.5, cX+21, cY+7.5, cX+18, cY+18.5);
  bezierVertex(cX+18, cY+18.5, cX-6, cY+17.5, cX-6, cY+17.5);
  bezierVertex(cX-6, cY+17.5, cX-2, cY-2.5, cX-23, cY-3.5);
  bezierVertex(cX-23, cY-3.5, cX-22, cY-13.5, cX-20, cY-18.5);
  endShape();
}



