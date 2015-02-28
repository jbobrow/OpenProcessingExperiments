
void setup() {
  size(500, 468);
  background(245, 224, 197);
  smooth();

  noStroke();
  fill(239, 127, 81);
  ellipse(170, 70, 250, 100);
  fill(239, 127, 81, 60);
  ellipse(170, 70, 400, 200);
  fill(239, 127, 81, 30);
  ellipse(170, 70, 500, 400);
  fill(239, 127, 81, 60);
  ellipse(175, 420, 120, 100);

  noFill();
  stroke(0);
  strokeWeight(2);
  line(0, 30, 15, 20);
  line(0, 50, 15, 54);
  line(0, 80, 10, 95);
  line(90, 20, 150, 35);
  line(350, 55, 410, 75);
  line(5, 420, 50, 380);
  line(10, 380, 45, 422);
  line(5, 400, 55, 400);
  line(28, 380, 28, 430);
  line(310, 395, 308, 455);
  line(375, 455, 405, 470);
  line(408, 335, 465, 415);
  line(440, 320, 425, 400);
  line(395, 400, 475, 325);
  line(404, 362, 465, 370);

  beginShape();
  curveVertex(60, 468);
  curveVertex(60, 468);
  curveVertex(100, 413);
  curveVertex(112, 350);
  curveVertex(112, 350);
  endShape();

  beginShape();
  curveVertex(128, 468);
  curveVertex(128, 468);
  curveVertex(148, 413);
  curveVertex(168, 368);
  curveVertex(168, 368);
  endShape();

  beginShape();
  curveVertex(445, 115);
  curveVertex(445, 115);
  curveVertex(398, 145);
  curveVertex(380, 190);
  curveVertex(398, 228);
  curveVertex(435, 235);
  curveVertex(465, 220);
  curveVertex(492, 182);
  curveVertex(482, 156); 
  curveVertex(470, 152);
  curveVertex(450, 151);
  curveVertex(440, 173);
  curveVertex(440, 173);
  endShape();

  beginShape();
  curveVertex(60, 165);
  curveVertex(60, 165);
  curveVertex(60, 238);
  curveVertex(70, 284);   
  curveVertex(140, 360); 
  curveVertex(265, 345);
  curveVertex(330, 324);    
  curveVertex(385, 260);
  curveVertex(385, 240);
  curveVertex(365, 240);
  curveVertex(362, 220);
  curveVertex(350, 185);
  curveVertex(330, 200);
  curveVertex(310, 215);
  curveVertex(290, 210);
  curveVertex(285, 190);
  curveVertex(295, 160);
  curveVertex(285, 135);
  curveVertex(260, 158);
  curveVertex(230, 180);
  curveVertex(210, 160);
  curveVertex(230, 125);
  curveVertex(255, 85);
  curveVertex(235, 52);
  curveVertex(190, 90);
  curveVertex(150, 135);
  curveVertex(140, 140);
  curveVertex(120, 132);
  curveVertex(125, 95);
  curveVertex(125, 80);
  curveVertex(105, 80);
  curveVertex(80, 115);
  curveVertex(60, 165);
  curveVertex(60, 165);
  endShape();

  fill(244, 98, 80);
  stroke(170, 87, 47);
  ellipse(60, 165, 15, 15);
  ellipse(60, 238, 30, 25);
  ellipse(70, 284, 30, 20);
  ellipse(85, 437, 20, 20);
  ellipse(265, 345, 30, 30);
  ellipse(330, 324, 40, 40);
  ellipse(303, 470, 70, 40);
  ellipse(-5, 470, 20, 40);

  fill(0);  
  stroke(0);

  ellipse(83, 18, 30, 25);
  ellipse(160, 38, 20, 20);
  ellipse(350, 58, 40, 40);
  ellipse(422, 82, 30, 30);
  ellipse(430, 183, 30, 30);
  ellipse(165, 470, 30, 30);
  ellipse(366, 450, 30, 27);
  ellipse(480, 450, 35, 30);
  ellipse(425, 475, 20, 20);

  arc(60, 165, 15, 15, -PI/2, PI/2);
  arc(60, 238, 30, 25, PI/2, 2*PI - PI/2);
  arc(70, 284, 30, 20, -3*PI/4, PI/4);    
  arc(85, 437, 20, 20, -PI/4, 3*PI/4);
  arc(265, 345, 30, 30, -9*PI/8, -PI/8);
  arc(330, 324, 40, 40, -PI/6, 5*PI/6);
  arc(140, 360, 60, 60, -8*PI/9, PI/9.5);
  arc(500, 285, 100, 80, -3*PI/4, 6*PI/9);
  arc(480, 62, 120, 120, -5*PI/6.4, -PI/6);
  arc(480, 62, 100, 80, 3*PI/15, 3*PI/4);
  arc(303, 470, 70, 40, PI, 2*PI - 3*PI/7);

  fill(120, 114, 186);
  strokeWeight(2);
  stroke(106, 95, 131);
  arc(75, 348, 200, 200, 11*PI/12, 2*PI-11*PI/12);
}


