
PFont font;
float rot = 0;
int rotChange = 4;
float xPos;
int state = 0;
int fontSize = 60;
float eRot = 0;
float vRot = 0;
float evFont = 0;
float lFont = 0;
float lY = 0;
float vY = 0;
float laX = -40;
float lbX = -40;
float iX = -20;
float vX = 3;
float eX = 30;
float lFontCh;
float evFontCh;
float vRotCh;
float eRotCh;
float lYCh;
float vYCh;
float laXCh;
float lbXCh;
float iXCh;
float vXCh;
float eXCh;
float rotCh;


void setup() {
  size(640, 120);
  smooth();
  xPos = width / 2;
}
void draw() {
  background(255);
  fill(0);
  print(lFontCh);
  font = loadFont("AbadiMT-CondensedExtraBold-60.vlw");
  textAlign(CENTER, CENTER);
  if(state == 1) {
    makeHuman();
  }
  if(state == 2) {
    rot += rotChange;
    if(rot >= 20 || rot <= -20) {
      rotChange = -rotChange;
    }
    xPos += 4;
    if(xPos >= width + 30) {
      xPos = -30;
    }
  }
  if(state == 3) {
    returnLetters();
  }
  textFont(font, fontSize - lFont);
  pushMatrix();
  translate(xPos + laX - rot / 1.4, height / 2 + lY);
  rotate(radians(rot));
  text("L", 0, 0);
  popMatrix();
  pushMatrix();
  translate(xPos + lbX - rot / 1.4, height / 2 + lY);
  rotate(radians(rot));
  text("L", 0, 0);
  popMatrix();
  textFont(font, fontSize - evFont);
  pushMatrix();
  translate(xPos + vX - rot / 2.5, height / 2 + vY);
  rotate(radians(vRot + rot));
  text("V", 0, 0);
  popMatrix();
  textFont(font, 60);
  pushMatrix();
  translate(xPos + iX, height / 2);
  rotate(radians(rot));
  text("i", 0, 0);
  popMatrix();
  textFont(font, fontSize - evFont);
  pushMatrix();
  translate(xPos + eX, height / 2);
  rotate(radians(eRot + rot));
  text("E", 0, 0);
  popMatrix();
}
void mouseClicked() {
  state ++;
  if(state == 1) {
    lFontCh = (30 - lFont) / 20;
    evFontCh = (15 - evFont) / 20;
    vRotCh = (180 - vRot) / 20;
    eRotCh = (90 - eRot) / 20;
    lYCh = (40 - lY) / 20;
    vYCh = (25 - vY) / 20;
    laXCh = (-4.5 - laX) / 20;
    lbXCh = (9 - lbX) / 20;
    iXCh = (0 - iX) / 20;
    vXCh = (0 - vX) / 20;
    eXCh = (0 - eX) / 20;
  }
  if(state == 3) {
    lFontCh = (0 - lFont) / 20;
    evFontCh = (0 - evFont) / 20;
    vRotCh = (0 - vRot) / 20;
    eRotCh = (0 - eRot) / 20;
    lYCh = (0 - lY) / 20;
    vYCh = (0 - vY) / 20;
    laXCh = (-40 - laX) / 20;
    lbXCh = (-40 - lbX) / 20;
    iXCh = (-20 - iX) / 20;
    vXCh = (3 - vX) / 20;
    eXCh = (30 - eX) / 20;
    rotCh = (0 - rot) / 20;
  }
}
void makeHuman() {
  lFont += lFontCh;
  evFont += evFontCh;
  vRot += vRotCh;
  eRot += eRotCh;
  lY += lYCh;
  vY += vYCh;
  laX += laXCh;
  lbX += lbXCh;
  iX += iXCh;
  vX += vXCh;
  eX += eXCh;
  if(lY >= 40) {
    lFont = 30;
    evFont = 15;
    vRot = 180;
    eRot = 90;
    lY = 40;
    vY = 25;
    laX = -4.5;
    lbX = 9;
    iX = 0;
    vX = 0;
    eX = 0;
  }
}
void returnLetters() {
  lFont += lFontCh;
  evFont += evFontCh;
  vRot += vRotCh;
  eRot += eRotCh;
  lY += lYCh;
  vY += vYCh;
  laX += laXCh;
  lbX += lbXCh;
  iX += iXCh;
  vX += vXCh;
  eX += eXCh;
  rot += rotCh;
  if(lY == 0) {
    rot = 0;
    lFont = 0;
    evFont = 0;
    vRot = 0;
    eRot = 0;
    lY = 0;
    vY = 0;
    laX = -40;
    lbX = -40;
    iX = -20;
    vX = 3;
    eX = 30;
    state = 0;
  }
}

