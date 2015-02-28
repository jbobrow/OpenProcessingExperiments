
//global variables
float turnX = 45;
boolean ningen = true;
float eyeRad = 160;
float pupilRad = 90;
float topReflectRad = 30;

boolean ocean = false;
float oceanFill = 0;

void setup() {
  size(700, 500);
  smooth();
}

void draw() {
  background(#E0C29C);
  if (mousePressed == true&&ocean == false) {
    oceanFill +=5;
  }

  if (!ocean) {
    noStroke();
    fill(0, 0, 255, 20);
    rect(0, 500-oceanFill, 700, 500);
  }
  if (oceanFill >= 500) {
    fill(0, 0, 255, 10);
    rect(0, 500-oceanFill, 700, 500);
    ningen = false;
    ocean = true;
  }

  if (ningen) {
    //left eye
    drawNingenEye(180, height/2);
    //right eye
    drawNingenEye(530, height/2);
  }
  else {

    //left eye
    drawSakanaEye(100, height/2);
    //right eye
    drawSakanaEye(600, height/2);
  }
}

void mouseReleased() {
  if (ocean == true) {
    oceanFill = 0;
    ningen = true;
    ocean = false;
  }
}

void drawNingenEye(int posX, int posY) {
  // function variables
  float d = dist(mouseX, mouseY, posX, posY);
  float x, y;

  float offsetX = map(mouseX, 0, width, -20, 20);
  float offsetY = map(mouseY, 0, width, -20, 20);
  float offsetR1x = .5;
  float offsetR1y = .5;
  x = posX+offsetX;
  y = posY+offsetY;

  turnX =offsetX/30;


  noStroke();
  fill(255);
  //outer eye
  ellipse(posX, posY, eyeRad, eyeRad+20);

  //pupil
  fill(35, 31, 32);
  ellipse(x, y, pupilRad, pupilRad+20);

  //specularthing
  fill(255, 240);
  pushMatrix();
  translate(x, y);
  rotate(turnX);
  translate(25, -15);

  ellipse(0, 0, topReflectRad, topReflectRad);
  popMatrix();


  //lid top Arch
  stroke(0);
  noFill();
  float temp;
  for (temp = 20; temp < 40; temp++) {
    arc(posX, posY, eyeRad, eyeRad+temp, radians(170), radians(370));
  }

  //lid bottom arch
  stroke(0);
  noFill();
  arc(posX, posY, eyeRad, eyeRad+20, radians(80), radians(100));
}

void drawSakanaEye(int posX, int posY) {
  // function variables
  float d = dist(mouseX, mouseY, posX, posY);
  float x, y;

  float offsetX = map(mouseX, 0, width, -10, 10);
  float offsetY = map(mouseY, 0, width, -30, 20);
  float offsetR1x = 0.5;
  float offsetR1y = 0.5;
  x = posX+offsetX;
  y = posY+offsetY;
  turnX =offsetX/30;


  noStroke();
  fill(255);
  //outer eye
  ellipse(posX, posY, eyeRad, eyeRad+10);

  //pupil
  fill(35, 31, 32);
  ellipse(x, y, pupilRad, pupilRad+5);
}



