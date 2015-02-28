
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Min Kyung Kim
// ID: 201420065


float X, Y;
float angle; 

void setup() {
  size (600, 600);
  smooth() ;
  strokeWeight(2);
  textSize(25);
  X = width/2;
  Y = height/2;
}

void draw() {
  background(255);
  drawClock();
}

void drawClock() {

  fill(#FCF8A1);
  bezier(250, 302, 182, 250, 87, 243, 2, 299);
  bezier(2, 299, 57, 342, 150, 349, 250, 302);
  bezier(265, 262, 164, 244, 95, 185, 39, 87);
  bezier(39, 87, 168, 120, 235, 167, 265, 262);
  bezier(306, 257, 361, 181, 362, 97, 303, 1);
  bezier(303, 1, 262, 75, 259, 154, 306, 257);
  bezier(347, 265, 435, 264, 509, 219, 565, 109);
  bezier(565, 109, 469, 129, 396, 171, 347, 265);
  bezier(341, 314, 432, 276, 520, 299, 598, 352);
  bezier(598, 352, 491, 389, 414, 377, 341, 314);
  bezier(312, 347, 383, 380, 430, 484, 431, 577);
  bezier(431, 577, 334, 514, 300, 440, 312, 347);
  bezier(271, 335, 258, 428, 203, 503, 116, 543);
  bezier(116, 543, 135, 432, 170, 375, 271, 335);

  fill(#FA551E);
  bezier(247, 282, 189, 206, 122, 174, 7, 183);
  bezier(7, 183, 55, 248, 134, 274, 247, 282);
  bezier(273, 248, 192, 185, 156, 98, 157, 5); 
  bezier(157, 5, 249, 73, 280, 151, 273, 248); 
  bezier(328, 250, 395, 215, 450, 138, 450, 14);
  bezier(450, 14, 374, 73, 328, 149, 328, 250); 
  bezier(358, 299, 410, 233, 511, 207, 594, 225); 
  bezier(594, 225, 523, 301, 442, 327, 358, 301); 
  bezier(337, 336, 423, 355, 491, 423, 527, 511); 
  bezier(527, 511, 417, 484, 360, 431, 337, 336); 
  bezier(248, 323, 153, 315, 83, 351, 17, 441); 
  bezier(17, 441, 109, 444, 190, 409, 248, 323); 

  fill(#0B7C0C);
  quad(268, 362, 307, 369, 294, 599, 249, 598);




  if (mousePressed) {
    fill(random(255), random(255), random(255), random(255));  
    ellipse(X, Y, 200, 200);
  }


  textAlign(CENTER, CENTER);
  fill(0);
  text(second(), 150+(50*cos(X-PI)), 500+(50*sin(Y-PI)));
  text(minute(), 100+(70*cos(X-PI)), 450+(70*sin(Y-PI)));
  text(hour()%12, 50+(90*cos(X-PI)), 400+(90*sin(X-PI)));


  fill(255);
  stroke(#461A0C);
  ellipse(X, Y, 150, 150);


  float s_angle = map(second(), 0, 60, 0, TWO_PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(s_angle);
  stroke(0, 0, 0);
  strokeWeight(0);
  fill(255, 255, 50);
  bezier(250, 302, 182, 250, 87, 243, 2, 299);
  bezier(2, 299, 57, 342, 150, 349, 250, 302);
  popMatrix();

  float m_angle = map(minute(), 0, 60, 0, 2*PI);
  pushMatrix();
  translate(X, Y);
  noFill();
  rotate(m_angle);
  stroke(255, 0, 0);
  strokeWeight(6);
  line(0, 0, 0, -40);
  popMatrix();

  float h_angle = map(hour (), 0, 12, 0, 2*PI);
  pushMatrix();
  translate(X, Y);
  rotate(h_angle);
  stroke(255, 0, 0);
  strokeWeight(6);
  line(0, 0, 0, -30);
  popMatrix();


  stroke(255, 0, 0);
  strokeWeight(5);
  ellipse(X, Y, 200, 200);
  strokeWeight(3);
}

