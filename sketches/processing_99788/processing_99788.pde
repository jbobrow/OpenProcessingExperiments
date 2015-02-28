
//Creative Computing
//Fervido Frias
//March 11, 2013

color claust = #141212;
color azul = #1D243B;
color rojo = #450F0F;
color rojovivo = #FF0000;
color mosquito = #B30000;

void setup() {
  size(400, 400);
  strokeWeight(3);
  smooth();
}

float x = 2;
int y = 2;

int generateRandomColor() {
  int hexColorIndex = round( random(7) );
  int hexColor;

  if (hexColorIndex == 0) {
    hexColor = claust;
  }
  else if (hexColorIndex == 1) {
    hexColor = azul;
  }
  else if (hexColorIndex == 2) {
    hexColor = rojo;
  }
  else if (hexColorIndex == 3) {
    hexColor = rojovivo;
  }
  else {
    hexColor = mosquito;
  }
  return hexColor;
}


void draw() {
  
}

void mousePressed () {
  face();
}


//face
void face() {
  noStroke();
  fill(generateRandomColor());
  rectMode(CENTER);
  
  int faceX = round(random(2,width-2));
  int faceY = round(random(2,height-2));
  int mouthX = faceX;
  int mouthY = faceY+50;
  
  rect(faceX, faceY, 200, 200);
  righteye(faceX,faceY);
  lefteye(faceX,faceY);
  mouth(mouthX,mouthY);
  fill(generateRandomColor());
  rect((faceX-50)/0.8855, faceY-50, 10, 10); //left pupil
  fill(generateRandomColor());
  rect(((faceX-50)/1)+80, faceY-50, 10, 10); //right pupil
  nose(faceX,faceY);
}

//mouth
void mouth(int mox, int moy) {
  fill(0, 90, 0);
  rect(mox, moy, 40, 20);
}

//eyes
void righteye(int rex, int rey) {

  fill(generateRandomColor());
  rect(rex-50, rey-50, 50, 50);
}
//eyes
void lefteye(int lex, int ley) {
  fill(generateRandomColor());
  rect(lex+50, ley-50, 50, 50);
}

//nose
void nose(int nox, int noy) {
  fill(232, random (225), random (255));
  rect(nox, noy, 10, 10);
}


