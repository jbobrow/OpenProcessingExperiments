
// Chun Yi Wu  / Study From MIRO
// reorganize the construction of data
// adding the funtion and changing position of data

///
int constant = 258;
float angle = 0.05;
int scalar = 4;
float speed = 0.05;
///
int mmm = 289;
float iii = 0.02;
int nnn = 8;
float ooo = 0.07;
int k = 100;
int w ;
// debug by Chen Hsin "int">>>"float"
float h ;
// time condition
int time1 = 60000;
int time2 = 20000;
int time3= 10000;
float u = 119;
float z = 289; 

void setup() {
  size(330, 356);
  smooth();
}

void draw() {
  background(220, 220, 220);
 
  drawLeftblock();
  drawTopblock();
  drawAllLine();
  drawSeparatePart();  
  drawChanging();
  drawWithMouse();
  drawDownblock();
}
//===========================================================
void drawWithMouse() {
  // left-top conner & curve
  if (w>44){
    noFill();
    stroke(113, 142, 87);
    strokeWeight(1.5);
  }
  else{
  noFill();
  stroke(random(180, 230), 240, 255);
  strokeWeight(1.5);
  }
  beginShape();
  curveVertex(9, 8); 
  curveVertex(9, 8);  
  curveVertex(12, 57); 
  curveVertex(56, 51);
  curveVertex(mouseX-99, mouseY-117);
  curveVertex(mouseX-81, mouseY-75);
  curveVertex(mouseX-29, mouseY-60);
  curveVertex(mouseX-9, mouseY-39);
  curveVertex(mouseX, mouseY); 
  curveVertex(mouseX, mouseY); 
  endShape();
  //strokeWeight with mouse
  strokeWeight(mouseX/50);
  noFill();
  stroke(0);  
  beginShape();
  curveVertex(16, 356); 
  curveVertex(16, 356);  
  curveVertex(74, 241); 
  curveVertex(142, 172);
  curveVertex(186, 125);
  curveVertex(186, 125);
  endShape();
  fill(0);
  ellipse(191, 119, 15, 13);
}

//==========================================================
void drawLeftblock() {
  // blue block in shape
  fill(46, 35, 64);  
  noStroke( );  
  beginShape();
  curveVertex(67, 164); // the first control point
  curveVertex(67, 164);
  curveVertex(62, 151);
  curveVertex(51, 143);
  vertex(51, 143); 
  vertex(75, 115); 
  vertex(83, 121);
  vertex(94, 125);
  endShape(CLOSE);
  //big blue block
  fill(46, 39, mouseX*2);  
  noStroke( );  
  beginShape();
  curveVertex(5, 234);
  curveVertex(5, 234);
  curveVertex(34, 218);
  curveVertex(62, 224);
  curveVertex(74, 241);
  curveVertex(77, 281);
  curveVertex(38, 302);
  curveVertex(14, 295);
  curveVertex(0, 272);
  curveVertex(0, 272);
  endShape(CLOSE);
  // RED Block 
  fill(mouseX, 0, 0);  
  noStroke( );  
  beginShape();
  curveVertex(0, 140); // the first control point
  curveVertex(0, 140);
  curveVertex(27, 136);
  curveVertex(51, 143);
  curveVertex(62, 151);
  curveVertex(67, 164); 
  curveVertex(73, 193);
  curveVertex(58, 221);
  curveVertex(34, 218);
  curveVertex(18, 223);
  vertex(5, 234);
  vertex(0, 244);
  vertex(0, 244);
  endShape();
  // block slope block
  fill(240);  
  noStroke( );  
  beginShape();
  curveVertex(67, 164); // the first control point
  curveVertex(67, 164);
  curveVertex(62, 151);
  curveVertex(51, 143);
  vertex(51, 143);
  vertex(0, 205);
  vertex(0, 230); 
  vertex(5, 234);
  curveVertex(5, 234);
  curveVertex(18, 223);
  curveVertex(34, 218);
  curveVertex(34, 218);
  endShape(CLOSE); 
  // small yeollow part
  fill(244, 195, 56);  
  noStroke( );  
  beginShape();
  vertex(34, 218);
  vertex(18, 223);
  vertex(5, 234);
  vertex(22, 238);
  endShape(CLOSE);
  //small part
  fill(0);  
  noStroke( );  
  beginShape();
  vertex(0, 244);
  vertex(0, 272);
  vertex(22, 238);
  vertex(5, 234);
  endShape(CLOSE);
  // small part 2 change color
  fill(0, mouseX, mouseX);  
  noStroke( );  
  beginShape();
  curveVertex(22, 238);
  curveVertex(22, 238);
  curveVertex(42, 233);
  curveVertex(58, 221);
  curveVertex(34, 218);
  curveVertex(34, 218);
  endShape();
  // black part
  fill(0);  
  noStroke( );  
  beginShape();
  curveVertex(74, 241);
  curveVertex(74, 241);
  curveVertex(77, 283);
  curveVertex(43, 302);
  curveVertex(61, 259);
  curveVertex(61, 259);
  curveVertex(74, 241);
  endShape(CLOSE);
  // shrill shape
  fill(0);
  noStroke();  
  beginShape();
  vertex(94, 125);  
  vertex(162, 9);  
  vertex(128, 47);
  vertex(75, 115);
  vertex(83, 121);
  endShape(CLOSE);
}
//=============================================================
void drawDownblock() {
  ////////////// bird fly with time/////////////////
  int currentTime = millis();
  if ( currentTime > time1 ) {
    u += 0.3;
    z -= 0.1;
  } 
  else if ( currentTime > time2 ) {
    u -=  0.2 ;
    z -=  0.1 ;
  }
  else if ( currentTime > time3) {
    u +=  0.2 ;
    z +=  0.2 ;
  }
  // fly with 2 wings
  float c = u;
  float d = z + cos(iii) * nnn;
  fill(0);  
  stroke(255, 10);
  //green block
  noStroke();
  fill(85, 58,43);
  beginShape();
  curveVertex(182, 356);
  curveVertex(182, 356);
  curveVertex(156, 347);
  curveVertex(129, 350);
  curveVertex(129, 350);
  vertex(129, 356);
  vertex(138, 356);
  endShape(CLOSE);
  // left wing
  fill(0);
  beginShape();  
  curveVertex(c, d);
  curveVertex(c, d);
  curveVertex(c+4, d+18);
  curveVertex(c+24, d+20);
  vertex(c+24, d+20);
  vertex(u+58, z+7);
  curveVertex(u+58, z+7);
  curveVertex(u+58, z+7);
  curveVertex(u+56, z+22);
  curveVertex(u+48, z+34);
  curveVertex(u+48, z+34);
  vertex(u+48, z+34);
  curveVertex(c+32, d+32);
  curveVertex(c+2, d+30);
  curveVertex(c-5, d+23);
  curveVertex(c-7, d+12);
  curveVertex(c-7, d+12);
  endShape(CLOSE);
  // right wing
  fill(0);  
  stroke(0); 
  strokeWeight(5);
  beginShape();
  curveVertex(u+70, z+38);
  curveVertex(u+70, z+38);
  curveVertex(u+75, z+23);
  curveVertex(u+75, z+23);
  vertex(u+75, z+23);
  curveVertex(u+75, z+23);
  curveVertex(u+75, z+23);
  curveVertex(c+88, d+35);
  curveVertex(c+99, d+36);
  curveVertex(c+122, d+30);
  curveVertex(c+122, d+30);
  vertex(c+122, d+30);
  curveVertex(c+122, d+30);
  curveVertex(c+122, d+30);
  curveVertex(c+103, d+41);
  curveVertex(c+85, d+45);
  endShape(CLOSE);
  iii = iii + ooo; 
  // 3 curve bird hear
  stroke(0);
  strokeWeight(2);
  noFill();
  beginShape();
  curveVertex(u+106, z-9);
  curveVertex(u+106, z-9);
  curveVertex(u+111, z-4);
  curveVertex(u+119, z-3);
  curveVertex(u+119, z-3);
  endShape(); 
  beginShape();
  curveVertex(u+101, z-2);
  curveVertex(u+101, z-2);
  curveVertex(u+102, z-1);
  curveVertex(u+111, z+18);
  curveVertex(u+111, z+18);
  endShape();
  beginShape();
  curveVertex(u+85, z+4);
  curveVertex(u+85, z+4);
  curveVertex(u+85, z+14);
  curveVertex(u+90, z+21);
  curveVertex(u+90, z+21);
  endShape();
  // 2 leg of bird
  noFill();  
  stroke(0);
  strokeWeight(1);  
  beginShape();
  curveVertex(u+8, z+67);
  curveVertex(u+8, z+67);
  curveVertex(u+33, z+45);
  curveVertex(u+48, z+34);
  curveVertex(u+57, z+17);
  curveVertex(u+59, z+16);
  curveVertex(u+59, z+16);
  endShape(); 
  beginShape();
  curveVertex(u+31, z+67);
  curveVertex(u+31, z+67);
  curveVertex(u+42, z+59);
  curveVertex(u+52, z+54);
  curveVertex(u+68, z+39);
  curveVertex(u+75, z+26);
  curveVertex(u+76, z+12);
  curveVertex(u+76, z+12);
  endShape();
  // eye background color
  /*
  noFill();
   stroke(20);
   beginShape();
   curveVertex(u+130, z-228);
   curveVertex(u+130, z-228);
   curveVertex(u+137, z-211);
   curveVertex(u+151, z-208);
   curveVertex(u+151, z-208);
   endShape();
   */
  fill(0);
  noStroke();
  beginShape();
  curveVertex(u+44, z-25);
  curveVertex(u+44, z-25);
  curveVertex(u+58, z-14);
  curveVertex(u+72, z);
  curveVertex(u+93, z+3);
  curveVertex(u+106, z-9);
  curveVertex(u+104, z-21);
  curveVertex(u+104, z-21);
  endShape();
  // red block bird body
  fill(255-mouseX, 0, 0);  
  noStroke();  
  beginShape();
  curveVertex(u+58, z+7);
  curveVertex(u+58, z+7);
  curveVertex(u+56, z+22);
  curveVertex(u+48, z+34);
  curveVertex(u+48, z+34);
  vertex(u+48, z+34);
  curveVertex(u+48, z+34);
  curveVertex(u+70, z+38);
  vertex(u+70, z+38);
  curveVertex(u+70, z+38);
  curveVertex(u+75, z+23);
  vertex(u+75, z+23);
  vertex(u+75, z+23);
  endShape(CLOSE);
  // bird eye 
  fill(170); 
  noStroke();
  beginShape();
  curveVertex(u+44, z-25);
  curveVertex(u+44, z-25);
  curveVertex(u+58, z-27);
  curveVertex(u+79, z-35);
  curveVertex(u+91, z-32);
  curveVertex(u+104, z-21);
  curveVertex(u+104, z-21);
  endShape();
  fill(170);
  noStroke();
  beginShape();
  curveVertex(u+44, z-25);
  curveVertex(u+44, z-25);
  curveVertex(u+55, z-21);
  curveVertex(u+70, z-10);
  curveVertex(u+85, z-6);
  curveVertex(u+101, z-11);
  curveVertex(u+104, z-21);
  curveVertex(u+104, z-21);
  endShape(); 
  // eye blue part
  fill(46, 39, 66);
  noStroke();
  ellipse(u+79, z-23, 24, 24);
  fill(0);
  stroke(200);
  ellipse(random(u+76, u+81), random(z-27, z-20), 10, 10);
}
//================================================================
void drawAllLine() {
  // all line
  strokeWeight(1);
  stroke(random(10, 50), random(10, 40), 0);
  line(0, 86, 9, 76);
  line(0, 103, 22, 102);
  line(38, 72, 36, 109);
  line(28, 72, 47, 103);
  line(27, 88, 53, 84);
  line(28, 96, 48, 75);
  line(92, 1, 111, 44);
  line(105, 5, 97, 46);
  line(84, 19, 122, 26);
  line(117, 11, 84, 41);
  line(125, 91, 145, 127); 
  line(136, 88, 130, 127);
  line(154, 91, 116, 122);
  line(106, 239, 100, 275);
  line(95, 243, 119, 273);
  line(91, 255, 120, 255);
  line(122, 241, 89, 266);
  line(74, 304, 99, 302);
  line(85, 291, 85, 317);
  line(96, 294, 74, 314);
  line(79, 297, 98, 314);
  line(228, 356, 223, 348);
  line(232, 356, 233, 346);
  line(237, 356, 245, 348);
  line(242, 165, 242, 191);
  line(232, 168, 251, 186);
  line(255, 167, 232, 189);
  line(230, 182, 256, 176);
  line(179, 0, 194, 13);
  line(173, 6, 196, 1);
  line(173, 19, 186, 0);
  line(182, 0, 184, 18);
  //near bird head curve
  noFill();  
  stroke(0);  
  beginShape();
  curveVertex(177, 282);
  curveVertex(177, 282);
  curveVertex(157, 288);
  curveVertex(144, 282);
  curveVertex(144, 267);
  curveVertex(176, 200);
  curveVertex(176, 200);
  endShape();
  noFill();  
  stroke(0);  
  beginShape();
  curveVertex(272, 356);
  curveVertex(272, 356);
  curveVertex(272, 336);
  curveVertex(259, 304);
  curveVertex(213, 249);
  curveVertex(186, 218);
  curveVertex(176, 200);
  curveVertex(176, 200);
  endShape();
  // 6 Curve 
  noFill();  
  stroke(0);
  strokeWeight(1);  
  beginShape();
  curveVertex(192, 225);
  curveVertex(192, 225);
  curveVertex(219, 209);
  curveVertex(250, 201);
  curveVertex(250, 201);
  endShape();
  beginShape();
  curveVertex(179, 206);
  curveVertex(179, 206);
  curveVertex(194, 194);
  curveVertex(207, 184);
  curveVertex(224, 179);
  curveVertex(224, 179);
  endShape();
  beginShape();
  curveVertex(213, 249);
  curveVertex(213, 249);
  curveVertex(240, 234);
  curveVertex(265, 231);
  curveVertex(265, 231);
  endShape();
  beginShape();
  curveVertex(237, 278);
  curveVertex(237, 278);
  curveVertex(263, 269);
  curveVertex(283, 269);
  curveVertex(283, 269);
  endShape();
  beginShape();
  curveVertex(258, 302);
  curveVertex(258, 302);
  curveVertex(275, 294);
  curveVertex(293, 301);
  curveVertex(293, 301);
  endShape();
  beginShape();
  curveVertex(272, 336);
  curveVertex(272, 336);
  curveVertex(287, 344);
  curveVertex(295, 356);
  curveVertex(295, 356);
  endShape();
}
//=========================================================
void drawSeparatePart() {
  // 3 triangle
  fill(0);  
  noStroke( );  
  beginShape();
  vertex(93, 183);
  vertex(105, 194);
  vertex(102, 210);
  vertex(114, 198);
  vertex(107, 194);
  vertex(113, 164);
  vertex(101, 171);
  endShape(CLOSE); 
  fill(46, 39, 66);  
  noStroke( );  
  beginShape();
  curveVertex(95, 235);
  curveVertex(95, 235);
  curveVertex(117, 230);
  curveVertex(137, 220);
  curveVertex(137, 220);
  vertex(114, 198);
  vertex(102, 210);
  endShape(CLOSE);
  //left small triangle part
  fill(0);  
  noStroke( );  
  beginShape();
  vertex(0, 337);
  vertex(9, 342); 
  vertex(0, 349);
  endShape(CLOSE);
  // 2 half ball
  fill(0);  
  noStroke( );  
  beginShape();
  curveVertex(24, 339);
  curveVertex(24, 339);
  curveVertex(36, 315);
  curveVertex(15, 321);
  curveVertex(15, 321);
  endShape(CLOSE);
  fill(46, 39, 66);  
  noStroke( );  
  beginShape();
  curveVertex(36, 315);
  curveVertex(36, 315);
  curveVertex(43, 329);
  curveVertex(25, 337);
  curveVertex(25, 337);
  endShape(CLOSE);
  // 2 half ball
  fill(46, 39, 66);  
  noStroke( );  
  beginShape();
  curveVertex(94, 343);
  curveVertex(94, 343);
  curveVertex(80, 337);
  curveVertex(72, 350);
  curveVertex(72, 350);
  endShape(); 
  fill(0);  
  noStroke( );  
  beginShape();
  curveVertex(94, 343);
  curveVertex(94, 343);
  curveVertex(86, 355);
  curveVertex(72, 350);
  curveVertex(72, 350);
  endShape();
  //big ball
  fill(0);
  ellipse(226, 140, 42, 42);
  // 2 half ball
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(162, 151);
  curveVertex(162, 151);
  curveVertex(162, 139);
  curveVertex(175, 136);
  curveVertex(175, 136);
  endShape();
  fill(46, 39, 66);  
  noStroke();  
  beginShape();
  curveVertex(163, 153);
  curveVertex(163, 153);
  curveVertex(178, 152);
  curveVertex(175, 136);
  curveVertex(175, 136);
  endShape();
  //2 half ball
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(165, 221);
  curveVertex(165, 221);
  curveVertex(154, 225);
  curveVertex(158, 237);
  curveVertex(158, 237);
  endShape();
  fill(46, 39, 66);  
  noStroke();  
  beginShape();
  curveVertex(165, 221);
  curveVertex(165, 221);
  curveVertex(169, 234);
  curveVertex(158, 237);
  curveVertex(158, 237);
  endShape();
  // 2 half ball
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(197, 190);
  curveVertex(197, 190);
  curveVertex(202, 178);
  curveVertex(212, 183);
  curveVertex(212, 183);
  endShape();
  fill(46, 39, 66);  
  noStroke();  
  beginShape();
  curveVertex(197, 190);
  curveVertex(197, 190);
  curveVertex(208, 195);
  curveVertex(212, 183);
  curveVertex(212, 183);
  endShape();
  // 2 half ball
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(230, 239);
  curveVertex(230, 239);
  curveVertex(237, 228);
  curveVertex(246, 233);
  curveVertex(246, 233);
  endShape();
  fill(46, 39, 66);  
  noStroke();  
  beginShape();
  curveVertex(230, 239);
  curveVertex(230, 239);
  curveVertex(240, 245);
  curveVertex(246, 233);
  curveVertex(246, 233);
  endShape();
  // 2 ball each connected
  fill(0, random(100, 200));
  ellipse(293, 9, 16, 16);
  ellipse(253, 12, 16, 16);
  ellipse(310, 136, 24, 24);
  ellipse(307, 200, 16, 16);
}
//==========================================================
void drawTopblock() {
  // only black circle
  fill(0);
  ellipse(207, 64, 84, 84);
  // half yeollow block
  fill(240, 233, 92);  
  noStroke();  
  beginShape();
  curveVertex(232, 44);
  curveVertex(232, 44);
  curveVertex(210, 41);
  curveVertex(187, 47);
  curveVertex(178, 64);
  curveVertex(184, 85);
  curveVertex(184, 85);
  endShape();
  fill(240, 233, 92);  
  beginShape();
  curveVertex(184, 85);
  curveVertex(184, 85);
  curveVertex(203, 93);
  curveVertex(223, 85);
  curveVertex(233, 67);
  curveVertex(232, 44);
  curveVertex(232, 44);
  endShape();
  //nose part
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(170, 66);
  curveVertex(170, 66);
  curveVertex(176, 36);
  curveVertex(155, 55);
  curveVertex(147, 61);
  curveVertex(132, 71);
  curveVertex(132, 71);
  endShape();   
  beginShape();
  curveVertex(173, 89);
  curveVertex(173, 89);
  curveVertex(160, 80);
  curveVertex(147, 78);
  curveVertex(132, 71);
  curveVertex(170, 66);
  curveVertex(170, 66);
  endShape();
}
//============================================================
void drawChanging() {
  /////////part 2 changing ////////
  if (mousePressed) {
    if (k <= 0) {
      
       
      /////////////////////////////stop move//////////////////////////
      // 01 eye of only head 
      fill(0, 0, 0);
      stroke(255);
      strokeWeight(1);
      ellipse(205, 66, 28, 28);
      // 03 Moving
      fill(255, 255, 0);
      stroke(0);
      strokeWeight(1.5);
      float x = 258;
      float y = 58;
      ellipse(x, y, 12, 12);
      ellipse(x+18, y-24, 8, 8);
      ellipse(x+50, y-24, 15, 15);
      ellipse(x+64, y-3, 10, 10);
      ellipse(x+50, y+33, 6, 6);
      line(0, 29, x-202, y-29);
      ellipse(x-202, y-29, 16, 16);
      // nose part
      fill(0);
      ellipse(x-115, y+12, 28, 14);
      // four branch & 1 main branch
      noFill();
      stroke(0);
      line(x, y, x+33, y+10);
      line(x+18, y-24, x+33, y+10);
      line(x+64, y-3, x+33, y+10);
      line(x+50, y+33, x+33, y+10);
      line(293, 9, 253, 12);
      line(310, 136, 307, 200);
      noFill();  
      stroke(0);  
      strokeWeight(2);
      beginShape();
      curveVertex(315, 356);
      curveVertex(315, 356);
      curveVertex(x+42, y+212);
      curveVertex(x+28, y+139);
      curveVertex(x+17, y+82);
      curveVertex(x+21, y+33);
      curveVertex(x+50, y-22);
      curveVertex(x+50, y-22);
      endShape();
      // all of ball on tree
      fill(0);
      noStroke();
      ellipse(x+36, y+183, 35, 35);
      ellipse(x+44, y+229, 18, 18);
      ellipse(x+23, y+125, 36, 36);
      ellipse(x+16, y+73, 18, 18);
      fill(62, 62, 35);
      noStroke();
      beginShape();
      curveVertex(x+32, y+166);
      curveVertex(x+32, y+166);
      curveVertex(x+21, y+172);
      curveVertex(x+17, y+185);
      curveVertex(x+26, y+198);
      curveVertex(x+39, y+201);
      curveVertex(x+39, y+201);
      endShape();
      //04 Moving   
      float u = 119;
      float z = 289;
      fill(0);  
      stroke(255, 10);
      //05 shrill shape
      fill(0);
      noStroke();  
      beginShape();
      vertex(94, 125);  
      vertex(u+43, z-280);  
      vertex(u+9, z-242);
      vertex(75, 115);
      vertex(83, 121);
      endShape(CLOSE);
      //06 eye blue part
      fill(46, 39, 66);
      noStroke();
      ellipse(198, 266, 24, 24);
      fill(0);
      noStroke();
      ellipse(197, 265, 10, 10);
      //07 2 ball each connected
      fill(0);
      ellipse(293, 9, 16, 16);
      ellipse(253, 12, 16, 16);
      ellipse(310, 136, 24, 24);
      ellipse(307, 200, 16, 16);
      //08 white viewscreem
      noFill();
      stroke(255);
      strokeWeight(25);
      rectMode(CENTER);
      rect(330/2, 356/2, 500, 340);
      //09 show text
      textSize(9);
      text("2013.10.22", mouseX+78, mouseY+167); 
      //08 rotate line
    pushMatrix();
    translate(mouseX, mouseY+155);
    h = PI*w/30;
    rotate(h);
    noFill();
    stroke(113, 142, 87);
    float j = map (w, 0, 60, 5, 0);
    strokeWeight(j);
    line(0, 0, 2*w, 2*w);
    popMatrix();
      //////////////stop move///////////////////////
    }
    else {
      k --;
      //number 
      fill(0, 230);
      noStroke();
      rect(0, 0, 700, 800);
      textSize(10);
      fill(60, 175, 16);
      text("loading " + k, 135, 190);
      fill(60, 175, 16, 150);
      ellipse(mouseX, mouseY, 20, 20);
      stroke(60, 175, 16, 150);
      strokeWeight(1);
      line(30, 356, mouseX, mouseY);
    }
  }
  else {
    w = second();
    k=100;
    // 01 eye of only head 
    fill(0, 0, 0);
    stroke(255);
    strokeWeight(random(3));
    ellipse(205, 66, 28, 28);
    // 02 mouse circle & screem line
    if (w>44) {
      fill(113, 142, 87);
      stroke(60, 175, 16);
       strokeWeight(2);
    }
    else {
      fill(random(50, 250), 100);
      stroke(0, random(100, 250));
      strokeWeight(2);
    }
    noStroke();
    ellipse(mouseX+(2*w), mouseY+155-(2*w), 20, 20);
    line(mouseX-120, mouseY-110, mouseX-120, mouseY-120);
    line(mouseX-120, mouseY-120, mouseX-110, mouseY-120);
    line(mouseX-120, mouseY+110, mouseX-120, mouseY+120);
    line(mouseX-120, mouseY+120, mouseX-110, mouseY+120);
    line(mouseX+120, mouseY-110, mouseX+120, mouseY-120);
    line(mouseX+110, mouseY-120, mouseX+120, mouseY-120);
    line(mouseX+120, mouseY+110, mouseX+120, mouseY+120);
    line(mouseX+110, mouseY+120, mouseX+120, mouseY+120);
    // 03 Moving UP & DOWN
    fill(240, 233, 92, random(200, 250));
    stroke(0);
    strokeWeight(1.5);
    float x = constant + cos(angle) * scalar;
    float y = 58;
    ellipse(x, y, 12, 12);
    ellipse(x+18, y-24, 8, 8);
    ellipse(x+50, y-24, 15, 15);
    ellipse(x+64, y-3, 10, 10);
    ellipse(x+50, y+33, 6, 6);
    line(0, 29, x-202, y-29);
    ellipse(x-202, y-29, 16, 16);
    // 04 nose part
    fill(0);
    ellipse(x-115, y+12, 28, 14);
    // 05 four branch & 1 main branch
    noFill();
    stroke(0);
    line(x, y, x+33, y+10);
    line(x+18, y-24, x+33, y+10);
    line(x+64, y-3, x+33, y+10);
    line(x+50, y+33, x+33, y+10);
    line(293, 9, 253, 12);
    line(310, 136, 307, 200);
    noFill();  
    stroke(0);  
    strokeWeight(2);
    beginShape();
    curveVertex(315, 356);
    curveVertex(315, 356);
    curveVertex(x+42, y+212);
    curveVertex(x+28, y+139);
    curveVertex(x+17, y+82);
    curveVertex(x+21, y+33);
    curveVertex(x+50, y-22);
    curveVertex(x+50, y-22);
    endShape();
    // 06 all of ball on tree
    fill(0, 150);
    noStroke();
    ellipse(x+36, y+183, 35, 35);
    ellipse(x+44, y+229, 18, 18);
    ellipse(x+23, y+125, 36, 36);
    ellipse(x+16, y+73, 18, 18);
    fill(w, w, 0);
    noStroke();
    beginShape();
    curveVertex(x+32, y+166);
    curveVertex(x+32, y+166);
    curveVertex(x+21, y+172);
    curveVertex(x+17, y+185);
    curveVertex(x+26, y+198);
    curveVertex(x+39, y+201);
    curveVertex(x+39, y+201);
    endShape();
    angle = angle + speed;
    //07 black viewscreem
    noFill();
    stroke(250, 250);
    strokeWeight(230);
    rectMode(CENTER);
    rect(mouseX, mouseY, 890, 540);
    //08 rotate line
    pushMatrix();
    translate(mouseX, mouseY+155);
    rotate(PI/30*w);
    noFill();
    stroke(113, 142, 87);
    float j = map (w, 0, 60, 5, 0);
    strokeWeight(j);
    line(0, 0, 2*w, 2*w);
    popMatrix();
  }
}



