
void setup() {
  size(650, 450);
  smooth();
  noStroke();
}
/*
void mouseClicked() {
  //for designing etc:
  println(mouseX);
  println(mouseY);
}*/

void draw() {
  background(115, 205, 232);
  scale(0.8,0.8); //the canvas is too big for openprocessing by default.
  //general headshape.
  fill(201, 168, 132);  
  beginShape();
  vertex(238, 395);
  vertex(193, 277);
  vertex(220, 223);
  vertex(240, 134);
  vertex(285, 81);
  vertex(373, 73);
  vertex(482, 71);
  vertex(585, 94);
  vertex(642, 215);
  vertex(672, 261);
  vertex(607, 403);
  vertex(583, 506);
  vertex(493, 553);
  vertex(356, 554);
  vertex(268, 516);
  endShape(CLOSE);

  //hairstyles
  fill(64, 40, 13);
  beginShape();
  vertex(213, 211);
  vertex(230, 128);
  vertex(288, 66);
  vertex(345, 34);
  vertex(568, 78);
  vertex(596, 99);
  vertex(645, 191);
  vertex(673, 244);
  vertex(675, 271);
  vertex(658, 308);
  vertex(588, 244);
  vertex(398, 248);
  vertex(343, 194);
  vertex(201,343);
  vertex(185,273);
  endShape(CLOSE);
  
  //shadey bits
  
  //eyebrows
  fill(180,148,112);
  beginShape();
  vertex(627,311);
  vertex(545,276);
  vertex(492,285);
  vertex(480,301);
  vertex(540,293);
  vertex(605,311);
  endShape(CLOSE);
  
  beginShape();
  vertex(267,295);
  vertex(363,265);
  vertex(407,288);
  vertex(402,301);
  vertex(358,288);
  vertex(290,298);
  endShape(CLOSE);
  
  //nose
  beginShape();
  vertex(450,318);
  vertex(460,373);
  vertex(453,396);
  endShape(CLOSE);

  beginShape();
  vertex(425,328);
  vertex(415,388);
  vertex(400,388);
  vertex(412,370);
  endShape(CLOSE);
 
  beginShape();
  vertex(422,406);
  vertex(405,408);
  vertex(415,403);
  endShape(CLOSE); 
 
  beginShape();
  vertex(442,403);
  vertex(443,411);
  vertex(450,403);
  endShape(CLOSE); 
  
  //mouth
  beginShape();
  vertex(357,463);
  vertex(408,443);
  vertex(432,448);
  vertex(438,441);
  vertex(502,463);
  endShape(CLOSE);
  
  beginShape();
  vertex(360,465);
  vertex(497,465);
  vertex(443,475);
  vertex(420,475);
  endShape(CLOSE);
  
  //eyes
  fill(280,248,212);
  ellipse(357,315,50,30);
  ellipse(540,316,50,30);
  fill(80,48,12);
  ellipse(357,315,30,30);
  ellipse(540,316,30,30);
}

