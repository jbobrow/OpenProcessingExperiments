
//miro move moon
//chiming lu
//the moon shape will follow the mouse,and the sun keep beating
//the ellipse will follow the mouse rotate  
//if pressed mouse will clean some color and bold some line
//references : http://www.openprocessing.org/sketch/106193(a moving ball) 
//adding structure 
// some part moving with time & color change too



//background setup 


void setup( )
{
  size(400, 500);
  background(255);
  smooth();
}

int constant = 75;
float angle = 0.05;
int scalar = 2;
float speed = 1;
float m=minute();

void draw() {
  background(255-2*m);

  drawLines();

  drawCurve();

  drawColorshape();

  drawIfelse();
}


/////////////////////////////////////////////////////////////////////////////////////////
void drawLines() {
  int s=second();
  //line right down
  stroke(0);
  strokeWeight(2);
  //line(340, 296, 342, 385);
  line(377+s, 298-s, 290-s, 383+s);
  line(305, 290, 387, 395);
  line(290, 340, 381, 333);
  line(156, 134, 120, 167);
  //time
  pushMatrix();
  translate(341, 337);
  rotate(-PI/s*30);
  line(341-340, 337-296, 341-342, 337-385);
  popMatrix();

  //line  color part
  stroke(0);
  strokeWeight(2);
  line(142-s, 312, 250+s, 312);
  line(195, 339, 270, 339);
  line(227, 279, 227, 486);
  line(200, 298, 195, 339);
  line(195, 339, 180, 475);
  line(373, 171, 400, 147);
}


/////////////////////////////////////////////////////////////////////////////////////////
void drawCurve() {
  float s=second();
  noFill();
  //curve 1
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(75, 55);
  bezierVertex(43-0.5*s, 15+0.5*s, 2-0.5*s, 40+0.5*s, 20-0.5*s, 70+0.5*s);
  endShape();

  //curve 2
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(67, 64);
  bezierVertex(18-0.5*s, 47+0.5*s, 18-0.5*s, 74+0.5*s, 31-0.5*s, 107+0.5*s);
  endShape();

  //curve 3 
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(64, 71);
  bezierVertex(40-0.5*s, 65+0.5*s, 38-0.5*s, 95+0.5*s, 59-0.5*s, 119+0.5*s);
  endShape();

  //long curve
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(156, 134);
  bezierVertex(232-s, 66, 246-s, 43, 251-s, 0);
  endShape();

  //curve u
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(120, 167);
  bezierVertex(-40, 380, 42, 491, 148, 396);
  endShape();

  //curve u ^
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(109, 354);
  bezierVertex(152, 298, 200, 337, 148, 396);
  endShape();

  //curve u
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(153, 312);
  bezierVertex(100, 470, 290, 486, 265, 339);
  endShape();
  //curve-

  beginShape();
  vertex(301, 471);
  bezierVertex(279, 498, 242, 498, 197, 474);

  endShape();
  //time minute
  float m=minute();
  pushMatrix();
  beginShape();
  noFill();
  translate(301, 471);
  rotate(-m*6);
  line(301-301, 471-471, 309-301, 426-471);
  endShape();
  popMatrix();

  //curve /
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(153, 312);
  bezierVertex(158, 296, 165, 274, 221, 198);
  endShape();

  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(221, 198);
  bezierVertex(229, 190, 227, 190, 247, 180);
  endShape();
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(247, 180);
  bezierVertex(268, 167, 308, 157, 365, 151);
  endShape();

  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(265, 339);
  bezierVertex(249-s, 284, 249-s, 242, 268, 212);
  endShape();

  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(268, 212);
  bezierVertex(272, 200, 281, 190, 296, 185);
  endShape();

  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(296, 185);
  bezierVertex(306, 177, 315, 174, 365, 161);
  endShape();

  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(294, 120);
  bezierVertex(273, 120, 279, 85, 338, 88);
  endShape();

  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(294, 120);
  bezierVertex(371, 125, 377, 183, 323, 248);
  endShape();

  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(323, 248);
  bezierVertex(305, 276, 319, 289, 347, 282);
  endShape();

  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(395, 150);
  bezierVertex(401, 189, 398, 214, 390, 235);
  endShape();
}

/////////////////////////////////////////////////////////////////////////////////////////

void drawIfelse() {
  int s=second();
  if (mousePressed) {
    //u shape
    fill(random(255));
    stroke(0);
    strokeWeight(random(10));
    beginShape();
    vertex(153, 312);
    bezierVertex(100, 470, 290, 486, 265, 339);
    vertex(265, 339);
    vertex(228, 340);
    vertex(227, 313);
    vertex(153, 312);
    endShape();

    //line right down
    stroke(0);
    strokeWeight(5);
    line(340, 296, 342, 385);
    line(227, 279-2*s, 227, 486);
    line(200, 298, 195, 339);
    line(195, 339, 180-s, 475+s*0.5);
    line(142, 312, 250, 312);
    line(290, 340, 381, 333);
  }
}



/////////////////////////////////////////////////////////////////////////////////////////
void drawColorshape() {
  int s=second();
  // Beating circle shape
  float x = 91;
  float y = constant + cos(angle) * scalar;
  //circle shape

  fill(210, 70, 0);
  ellipse(x, y, 52, 50); 
  endShape();
  angle = angle + speed*2;

  //moon shape
  noStroke();
  beginShape();
  fill(25, 70, 11);
  vertex(mouseX, mouseY);  //mouse point
  bezierVertex(mouseX-100, mouseY-24, mouseX-125, mouseY-138, mouseX+55, mouseY-187);
  bezierVertex(mouseX-20, mouseY-94, mouseX-10, mouseY-54, mouseX, mouseY);
  endShape();

  //mouse color
  beginShape();
  fill(mouseX+80);
  vertex(mouseX-80, mouseY-94);
  bezierVertex(mouseX-60, mouseY-89, mouseX-43, mouseY-114, mouseX-57, mouseY-132);
  bezierVertex(mouseX-50, mouseY-125, mouseX-68, mouseY-125, mouseX-76, mouseY-94);
  endShape();

  beginShape();
  fill(mouseX+80);
  vertex(mouseX-50, mouseY-27);
  bezierVertex(mouseX-45, mouseY-15, mouseX-18, mouseY+1, mouseX, mouseY);
  bezierVertex(mouseX-4, mouseY-8, mouseX-12, mouseY-49, mouseX-6, mouseY-64);
  bezierVertex(mouseX-29, mouseY-47, mouseX-43, mouseY-32, mouseX-50, mouseY-27);
  endShape();
  //time minute
  float m=minute();
  pushMatrix();
  translate(301, 471);
  rotate(-m*6);
  beginShape(); 
  fill(0);
  vertex(309-301, 426-471);
  bezierVertex(337-301, 430-471, 342-301, 403-471, 321-301, 401-471);
  bezierVertex(288-301, 403-471, 284-301, 423-471, 309-301, 426-471);
  endShape();
  popMatrix();


  pushMatrix();
  translate(109, 354);
  float A=PI*(mouseX+mouseY)/100;
  rotate(A);
  beginShape();
  fill(0);
  vertex(67-109, 381-354);
  bezierVertex(85-109, 402-354, 119-109, 375-354, 109-109, 354-354);
  bezierVertex(88-109, 337-354, 57-109, 364-354, 67-109, 381-354);
  endShape();
  popMatrix();

  //color orange+black

  fill(210, 70, 0);
  noStroke();
  beginShape();
  vertex(247, 180);
  bezierVertex(244, 197, 233, 206, 221, 198);
  bezierVertex(229, 190, 227, 190, 247, 180);
  endShape();

  fill(0);
  noStroke();
  beginShape();
  vertex(247, 180);
  bezierVertex(248, 131, 211, 123, 191, 174);
  bezierVertex(191, 186, 205, 189, 211, 179);
  bezierVertex(221, 150, 236, 153, 221, 198);
  bezierVertex(229, 190, 227, 190, 247, 180);
  endShape();

  //color bule+black
  fill(33, 61, 161);
  noStroke();
  beginShape();
  vertex(268, 212);
  bezierVertex(261, 197, 275, 182, 296, 186);
  bezierVertex(281, 190, 271, 200, 268, 212);
  endShape();

  fill(0);
  noStroke();
  beginShape();
  vertex(268, 212);
  bezierVertex(271, 200, 281, 190, 296, 186);
  bezierVertex(317, 196, 328, 224, 295-s, 265+s);
  bezierVertex(303, 241, 293, 224, 268, 212);
  endShape();

  //

  fill(0);
  noStroke();
  beginShape();
  vertex(338, 88);
  bezierVertex(357, 60, 378, 81, 363, 102);
  bezierVertex(358, 93, 350, 89, 338, 88);
  endShape();

  fill(210, 70, 0);
  noStroke();
  beginShape();
  vertex(338, 88);
  bezierVertex(335, 100, 346, 117, 363, 102);
  bezierVertex(358, 93, 350, 89, 338, 88);
  endShape();

  fill(0);
  noStroke();
  beginShape();
  vertex(363, 102);
  bezierVertex(374, 105, 379, 110, 387, 127);
  bezierVertex(371, 120, 365, 112, 350, 107);
  bezierVertex(359, 107, 363, 104, 363, 102);
  endShape();

  fill(0);
  noStroke();
  beginShape();
  vertex(387, 127); 
  vertex(400, 135); 
  vertex(400, 147);
  vertex(395, 150);
  endShape(CLOSE);

  fill(33, 61, 161);
  noStroke();
  beginShape();
  vertex(347, 282);
  bezierVertex(336, 248, 361, 221, 390, 235);
  bezierVertex(378, 263, 364, 278, 347, 282);
  endShape();

  fill(0);
  noStroke();
  beginShape();
  vertex(347, 282);
  bezierVertex(378, 323, 418, 271, 390, 235);
  bezierVertex(378, 263, 364, 278, 347, 282);
  endShape();

  fill(0);
  noStroke();
  beginShape();
  vertex(361, 275);
  bezierVertex(354, 254, 362, 246, 380, 254);
  bezierVertex(377, 261, 369, 271, 361, 275);
  endShape();

  fill(210, 70, 0);
  noStroke();
  beginShape();
  vertex(361, 275);
  bezierVertex(376, 292, 393, 256, 380, 254);
  bezierVertex(377, 261, 369, 271, 361, 275);
  endShape();
  //curve u color
  fill(0);
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(153, 312);
  bezierVertex(100, 470, 290, 486, 265, 339);
  vertex(265, 339);
  vertex(228, 340);
  vertex(227, 313);
  vertex(153, 312);
  endShape();


  //color bule

    fill(33+10*s, 61-10*s, 161); //fllow the second change color
  noStroke();
  beginShape();
  vertex(199, 313); 
  vertex(212, 313); 
  vertex(212, 327);
  vertex(197, 327);
  endShape(CLOSE);

  fill(33+10*s, 61-10*s, 161);
  noStroke();
  beginShape();
  vertex(229, 340); 
  vertex(244, 340); 
  vertex(243, 352);
  vertex(228, 352);
  endShape(CLOSE);

  fill(33+10*s, 61-10*s, 161);
  noStroke();
  beginShape();
  vertex(191, 367); 
  vertex(226, 367); 
  vertex(227, 390);
  vertex(190, 383);
  endShape(CLOSE);

  fill(33+10*s, 61-10*s, 161);
  noStroke();
  beginShape();
  vertex(147, 347); 
  vertex(166, 350); 
  vertex(161, 374);
  vertex(145, 371);
  bezierVertex(142, 362, 143, 353, 147, 347);
  endShape(CLOSE);  

  //color green

  fill(25, 70, 11);
  noStroke();
  beginShape();
  vertex(194, 340); 
  vertex(211, 340); 
  vertex(211, 352);
  vertex(192, 352);
  endShape(CLOSE);  

  fill(25, 70, 11);
  noStroke();
  beginShape();
  vertex(167, 350); 
  vertex(192, 352); 
  vertex(191, 367);
  vertex(164, 365);
  endShape(CLOSE);   

  fill(25, 70, 11);
  noStroke();
  beginShape();
  vertex(228, 352); 
  vertex(244, 352); 
  vertex(243, 394);
  vertex(228, 393);
  endShape(CLOSE);   

  //color orange         
  fill(210, 70, 0);
  noStroke();
  beginShape();
  vertex(212, 327); 
  vertex(227, 328); 
  vertex(228, 340);
  vertex(212, 340);
  endShape(CLOSE);  

  fill(210, 70, 0);
  noStroke();
  beginShape();
  vertex(245, 340); 
  vertex(264, 340); 
  vertex(267, 352);
  vertex(244, 352);
  endShape(CLOSE);  

  fill(210, 70, 0);
  noStroke();
  beginShape();
  vertex(228, 393); 
  vertex(263, 399); 
  vertex(255, 416);
  vertex(227, 411);
  endShape(CLOSE);   

  fill(210, 70, 0);
  noStroke();
  beginShape();
  vertex(186, 409); 
  vertex(227, 411); 
  vertex(227, 437);
  bezierVertex(215, 443, 200, 443, 183, 436);
  endShape(CLOSE);    

  fill(210, 70, 0);
  noStroke();
  beginShape();
  vertex(190, 383); 
  vertex(186, 409); 
  vertex(153, 410);
  bezierVertex(152, 406, 152, 403, 148, 395);
  bezierVertex(155, 390, 159, 381, 161, 374); 
  endShape(CLOSE); 

  //color yellow
  fill(255, 240, 5);
  noStroke();
  beginShape();
  vertex(212, 341); 
  vertex(227, 341); 
  vertex(226, 352);
  vertex(212, 352);
  endShape(CLOSE);
  //color orange+yellow
  fill(242, 135, 0);
  noStroke();
  beginShape();
  vertex(153, 313); 
  vertex(198, 313); 
  vertex(191, 351);
  vertex(167, 349);
  bezierVertex(167, 339, 158, 329, 149, 327);
  endShape(CLOSE);
}



