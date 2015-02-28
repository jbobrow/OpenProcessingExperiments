
//Parametric Face
int dimCanvas = 400;
//eye

float eyeRightX = dimCanvas/2+50;
float eyeRightY = 100;
float eyeLeftX = dimCanvas/2-(eyeRightX-dimCanvas/2);
float eyeLeftY = eyeRightY;
float eyeH = 50;
float eyeW = 20;
float pupilD = 10;

//NOse
boolean hasNostrils = true;
float noseStartX = dimCanvas/2;
float noseStartY = eyeRightY+random(-10, 20);
float noseEndX = noseStartX;
float noseEndY = noseStartY+random(30, 100);
float nosX = 10;
float nosY = 4;
float nosOffsetX = 20;
float nosOffsetY = 14;

//Mouth
float mouthX = noseEndX;
float mouthY = noseEndY+nosOffsetY + random(20, 40);
float cornerX = mouthX+random(10, 90);
float cornerY = mouthY+random(-10, 30);



void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  fill(0, 0, 0, 100);
  rect(0, 0, width, height);
  noFill();
  stroke(255);
  drawEyes();
  drawNose();
  drawMouth();
}

void mousePressed() {
  eyeRightX = dimCanvas/2+random(10, dimCanvas/3);
  eyeRightY = random(30, dimCanvas/2);
  eyeLeftX = dimCanvas/2-(eyeRightX-dimCanvas/2);
  eyeLeftY = eyeRightY;
  eyeH = random(10, 90);
  eyeW = random(10, 90);
  pupilD = random(2, 20);

  //NOse
  int bool = (int)random(0, 2);
  if (bool == 0) {
    hasNostrils = false;
  } 
  else {
    hasNostrils = true;
  }
  noseStartX = dimCanvas/2;
  noseStartY = eyeRightY+random(-10, 20);
  noseEndX = noseStartX;
  noseEndY = noseStartY+random(10, 100);
  nosX = random(3, 15);
  nosY = random(3, 18);
  ;
  nosOffsetX = random(10, 20);
  nosOffsetY = random(-4, 30);

  //Mouth
  mouthX = noseEndX;
  mouthY = noseEndY+nosOffsetY + random(20, 40);
  cornerX = mouthX+random(10, 90);
  cornerY = mouthY+random(-40, 30);
}

void drawEyes() {
  noFill();
  stroke(255);
  strokeWeight(2);
  //eye
  ellipse(eyeRightX, eyeRightY, eyeH, eyeW);
  ellipse(eyeLeftX, eyeLeftY, eyeH, eyeW);
  //pupil
  ellipse(eyeRightX, eyeRightY, pupilD, pupilD);
  ellipse(eyeLeftX, eyeLeftY, pupilD, pupilD);
}

void drawNose() {
  line(noseStartX, noseStartY, noseEndX, noseEndY);
  if (hasNostrils == true) {
    ellipse(noseEndX+nosOffsetX, noseEndY+nosOffsetY, nosX, nosY);
    ellipse(noseEndX-nosOffsetX, noseEndY+nosOffsetY, nosX, nosY);
  }
}

void drawMouth() {
  beginShape();
  curveVertex(dimCanvas/2-(cornerX-dimCanvas/2), cornerY);
  curveVertex(dimCanvas/2-(cornerX-dimCanvas/2), cornerY);
  curveVertex(mouthX, mouthY);
  curveVertex(cornerX, cornerY);
  curveVertex(cornerX, cornerY);
  endShape();
}

