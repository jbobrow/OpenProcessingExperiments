
void setup() {
  setupAudio();
  size(512, 512);
}

void draw() {
  smooth();
  background(108, 180, 201);
  stroke(0,0,0,0);

  // Neck
  fill(245, 173, 106);
  beginShape();
  vertex(325, 230);
  vertex(300, 400);
  vertex(197, 400);
  vertex(200, 365);
  endShape(CLOSE);

  // Facial Structure!
  fill(247, 216, 152);
  line(180, 380, 310, 280);
  line(310, 280, 320, 210);

  beginShape();
  vertex(80, 160);
  vertex(80, 240);
  vertex(180, 380);
  vertex(310, 280);
  vertex(320, 210);
  vertex(320, 160);
  endShape(CLOSE);

  fill(108, 180, 201);
  curve(0, 240, 80, 160, 80, 240, 0, 120);
  fill(247, 216, 152);
  curve(140, 380, 80, 240, 180, 380, 180, 100);

  // Nose!
  fill(245, 173, 106);
  beginShape();
  curveVertex(140, 230);
  curveVertex(140, 230);
  curveVertex(125, 300);
  curveVertex(139, 303);
  curveVertex(139, 303);
  endShape();

  // Goggles(Part 1)!
  fill(60,111,175);
  ellipse(157, 103, 50, 80);
  fill(14, 37,67);
  ellipse(165, 100, 50, 80);
  fill(4, 12, 23);
  ellipse(170, 100, 50, 80);

  // Hair!
  fill(124, 26, 11);
  beginShape();
  vertex(80, 160);
  vertex(40, 170);
  vertex(80, 150);
  vertex(45, 140);
  vertex(90, 130);
  vertex(50, 115);
  vertex(100, 117);
  vertex(80, 95);
  vertex(120, 95);
  vertex(100, 75);
  vertex(300, 115);
  vertex(304, 105);
  vertex(308, 115);
  vertex(318, 111);
  vertex(312, 119);
  vertex(340, 160);
  vertex(327, 158);
  vertex(363, 230);
  vertex(320, 210);
  vertex(315, 230);
  vertex(300, 180);
  vertex(270, 220);
  vertex(255, 170);
  endShape(CLOSE);

  getVolume(); // call fetches the mic volume for the current frame.
  float Y = map(volume, 0, 100, 2, 120);  // now we can use it for something!

  // Eyes!
  fill(222, 110, 25);
  float X = 30 - Y/10;
  if (X < 0) X = 0;
  if (Y > 400) {
    stroke(0,0,0,255);
    strokeWeight(4);
    line(205, 180, 225, 200); 
    line(225, 180, 205, 200);
    line(91, 180, 111, 200);
    line(111, 180, 91, 200);
    stroke(0,0,0,0);
  }
  else {
    ellipse(215, 190, 20, X);
    ellipse(101, 190, 18, X);
  }

  // Mouth!
  fill(175, 64, 60);
  if (Y < 10) {
    bezier(133, 330, 143, 360, 220, 335, 220, 330);
  }
  else if (Y < 30) {
    beginShape();
    curveVertex(135, 332);
    curveVertex(135, 332);
    curveVertex(165, 334);
    curveVertex(170, 344);
    curveVertex(142, 346);
    curveVertex(142, 346);
    endShape(CLOSE);
  }
  else if (Y < 60) {
    beginShape();
    curveVertex(130, 325);
    curveVertex(130, 325);
    curveVertex(190, 330);
    curveVertex(190, 342);
    curveVertex(146, 350);
    curveVertex(146, 350);
    endShape();
  }
  else if (Y < 90) {
    beginShape();
    curveVertex(126, 320);
    curveVertex(126, 320);
    curveVertex(200, 320);
    curveVertex(200, 348);
    curveVertex(150, 354);
    curveVertex(150, 354);
    endShape();
  }
  else if (Y > 150)
  {
    beginShape();
    curveVertex(118, 308);
    curveVertex(118, 308);
    curveVertex(220, 317);
    curveVertex(215, 351);
    curveVertex(155, 367);
    curveVertex(155, 367);
    endShape();
  }
  else {
    beginShape();
    curveVertex(122, 314);
    curveVertex(122, 314);
    curveVertex(205, 317);
    curveVertex(205, 351);
    curveVertex(154, 360);
    curveVertex(154, 360);
    endShape();
  }
  
  // Goggles(Part 2)!
  fill(0,0,0);
  beginShape();
  vertex(217, 95);
  vertex(167, 85);
  //vertex(290, 155);
  //vertex(335, 220);
  vertex(349, 200);
  vertex(344, 190);
  endShape(CLOSE);
  
  translate(240,100);
  rotate(PI/4.0);
  
  fill(4, 12, 23);
  ellipse(10,5,80,100);
  
  fill(14, 37,67);
  ellipse(0,0,80,100);
  
  fill(60,111,175);
  ellipse(0, 0, 60, 80);
  
  // Ear!
  rotate(-PI/4.0);
  translate(-240, -100);
  fill(247, 216, 152);
  bezier(320, 210, 320, 170, 390, 210, 313, 262);
  line(320, 210, 314, 262);
}
