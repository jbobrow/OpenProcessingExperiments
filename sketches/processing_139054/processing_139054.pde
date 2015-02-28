

size (600,600);
background (60);
ellipseMode(CENTER);
rectMode(CENTER);

//Bottom Circles
noFill();
stroke(39, 169, 225, 95);
strokeWeight(5);
ellipse(307, 497, 117, 21);
ellipse(307, 511, 104, 21);
ellipse(307, 524, 80, 21);

//white background body
int y = 0;
fill(255); 
noStroke();
beginShape();
vertex(144, 245+y);
vertex(469, 245+y);
bezierVertex(507, 268+y, 469, 295+y, 470, 296+y);
bezierVertex(400, 350+y, 379, 491+y, 307, 491+y);
bezierVertex(235, 491+y, 214, 350+y, 144, 296+y);
bezierVertex(106, 268+y, 144, 245+y, 144, 245+y);
endShape();

//Left Arm
fill (39, 169, 225);
stroke (240, 176, 28);
strokeWeight(3);
ellipse(135, 433, 36, 36);
fill (27, 117, 187);
noStroke();
rect(135,346, 17, 173);
ellipse(135, 433, 17, 17);

//Shoulder circles
fill (27, 117, 187);
stroke (240, 176, 28);
strokeWeight(5);
ellipse(470, 260, 83, 83);
ellipse(144, 260, 83, 83);

//yellow body
y = y-8;
fill(240, 176, 28);
noStroke();
beginShape();
vertex(144, 245+y);
vertex(469, 245+y);
bezierVertex(507, 268+y, 469, 295+y, 470, 296+y);
bezierVertex(400, 350+y, 379, 491+y, 307, 491+y);
bezierVertex(235, 491+y, 214, 350+y, 144, 296+y);
bezierVertex(106, 268+y, 144, 245+y, 144, 245+y);
endShape();

//Body rect block
noStroke();
fill(21, 75, 135);
rect(307, 232, 326, 10);

//Neck & head
noStroke();
fill(210, 210, 210);
rect(307, 165, 13, 145); 
rect(307, 102, 145, 40);
//Right arm
ellipse(480, 327, 50, 50 );
ellipse(480, 387, 18, 18 );
//right arm middle
fill (27, 117, 187);
stroke (240, 176, 28);
strokeWeight(3);
ellipse(480, 363, 30, 30);

//Left eye
fill(255);
noStroke();
ellipse(235, 102, 125, 125);

fill (27, 117, 187);
stroke(21, 75, 135);
strokeWeight(8);
ellipse(235, 102, 91, 91);

fill(210, 210, 210);
noStroke();
ellipse(235, 102, 77, 30);

//wire
noFill();
stroke(21, 75, 135);
strokeWeight(4);
beginShape();
vertex(352, 101);
bezierVertex(351, 101, 316, 91, 329, 144);
bezierVertex( 342, 197, 276, 156, 288, 193);
bezierVertex(300, 230, 365, 182, 348, 230);
endShape();

//neck cover
noStroke();
fill(210, 210, 210);
rect(307, 207, 13, 35);

//Right eye
fill(255);
noStroke();
ellipse(378, 102, 70, 70);

fill (27, 117, 187);
stroke(21, 75, 135);
strokeWeight(5);
ellipse(378, 102, 40, 40);

for (int i = 260; i < 465; i += 24) {
  fill (39, 169, 225);
  stroke(255);
  strokeWeight(3);
  rect(307, i, (i/3)-210, 12);
}





