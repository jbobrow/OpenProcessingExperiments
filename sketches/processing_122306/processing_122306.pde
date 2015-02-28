
PImage bitLine;
PShader blur;
float speed  = 4;
float easing = 2; 
color m;
color s1 = color(163, 150, 195);
color s2 = color(219, 132, 53);
color[] kenzo = { 
  #A9D4CC, #EBBCAC, color(208, 77, 88), color(207, 74, 142), color(217, 133, 77), color(208, 77, 88), 
  color(208, 77, 88), color(208, 77, 88), color(208, 77, 88), color(208, 77, 88), color(208, 77, 88)
  , color(208, 77, 88)
};


void setup() {
  size(424, 640);
  background(255);
  frameRate(4);
  noFill();
  noStroke();
  colorMode(RGB, 280);
  bitLine = loadImage("http://31.media.tumblr.com/d8c565f1d8a8d38143215fd0f117a2ce/tumblr_mwz6t6U4Ya1sabggqo1_250.png");
  

 
}

void draw() { 
 theShape();
  // image(bitLine, 80, 100);
  
}

void theShape() {
  fill(s1);
  rect(228, 0, 196, 404);
  fill(255);
  beginShape();
  vertex(0, 0);
  vertex(0, 442);
  vertex(228, 388);
  vertex(228, 0);
  vertex(0, 0);
  endShape(CLOSE);
  fill(s2);
  beginShape();
  vertex(0, 442);
  vertex(228, 388);
  vertex(424, 405);
  vertex(424, 640);
  vertex(0, 640);
  vertex(0, 442);
  endShape(CLOSE);
  //
  fill(101, 186, 146);
  beginShape();
  vertex(316, 535);
  bezierVertex(316, 535, 283, 536, 283, 528);
  bezierVertex(282, 521, 279, 531, 262, 537);
  bezierVertex(246, 542, 249, 550, 326, 536);
  vertex(322, 534);
  vertex(316, 535);
  endShape(CLOSE);
  //
  fill(0);
  beginShape();
  vertex(0, 443);
  vertex(0, 440);
  vertex(181, 396);
  vertex(181, 400);
  vertex(0, 443);
  endShape(CLOSE);
  //
  fill(101, 186, 146);
  beginShape();
  vertex(315, 395);
  vertex(424, 405);
  vertex(426, 407);
  vertex(315, 398);
  vertex(315, 395);
  endShape(CLOSE);
  //
  fill(109, 89, 160);
  beginShape();
  vertex(177, 259);
  vertex(178, 252);
  vertex(185, 251);
  vertex(186, 260);
  vertex(177, 259);
  endShape(CLOSE);
  //
  fill(m);
  //fill(33, 33, 30);
  beginShape();
  vertex(190, 251);
  bezierVertex(182, 249, 183, 258, 183, 261);
  bezierVertex(182, 300, 180, 479, 181, 486);
  bezierVertex(181, 492, 170, 497, 170, 497);
  vertex(45, 511);
  vertex(128, 564);
  vertex(264, 544);
  bezierVertex(284, 536, 281, 526, 281, 526);
  vertex(283, 273);
  bezierVertex(283, 273, 282, 258, 285, 256);
  bezierVertex(285, 256, 289, 253, 294, 257);
  vertex(288, 254);
  endShape(CLOSE);
  //
  fill(11, 13, 14);
  beginShape();
  vertex(282, 273);
  vertex(282, 255);
  bezierVertex(282, 255, 315, 251, 315, 281);
  bezierVertex(315, 311, 315, 523, 315, 523);
  bezierVertex(315, 523, 315, 535, 327, 535);
  bezierVertex(339, 536, 281, 540, 281, 525);
  bezierVertex(280, 510, 282, 273, 282, 273);
  endShape(CLOSE);
  //
  fill(240, 225, 53);
  beginShape();
  vertex(286, 267);
  vertex(358, 270);
  vertex(385, 278);
  vertex(287, 272);
  vertex(286, 267);
  endShape(CLOSE);
  //
  fill(205, 55, 58);
  beginShape();
  vertex(286, 257);
  vertex(358, 260);
  vertex(358, 270);
  vertex(286, 267);
  vertex(286, 257);
  endShape(CLOSE);
  //
  fill(0);
  beginShape();
  vertex(358, 260);
  vertex(385, 268);
  vertex(385, 278);
  vertex(358, 270);
  vertex(358, 260);
  endShape(CLOSE);
}

void mousePressed() {
  for (int i = 0 ; i < 11; i++) { 
    m=kenzo[int(random(0, 4))];
    s1 =kenzo[int(random(0, 4))];
    s2 = kenzo[int(random(0, 4))];
    if (i == 11) {
      i = 0;
    }
  }
//  if (mouseY > 251 && mouseY < 564) {
//    if (mouseX >190 && mouseX < 258) {
//      rect(mouseX, mouseY, 10, 10);
//    }
//  }
}
