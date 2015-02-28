
// draw a parametric face

boolean flipFlop = false;
String keyPrompt = "press any key";
float eyeLoc[] = {-20, 0};
float faceWidth[] = {150, 250};
float faceHeight[] = {125, 200};
float hairColor[] = {0, 255, 0, 255, 0, 255};
float mouthWidth[] = {10, 40};
float browLoc[] = {-25, -45};
float _hairColorR = 0;
float _hairColorG = 0;
float _hairColorB = 0;
float _eyeLoc = -10;
float _faceWidth = 200;
float _mouthWidth = 0;
float _faceHeight = 150;
float _browLoc = -30;

void setup() {
  size(300, 300);
  background(240, 237, 194);
  textSize(13);
}

void draw() {
  makeFace();
  smooth();
  text(keyPrompt, -145, -135);
}

void keyPressed() {
  _eyeLoc = random(eyeLoc[0], eyeLoc[1]);
  _faceWidth = random(faceWidth[0], faceWidth[1]);
  _hairColorR = random(hairColor[0], hairColor[1]);
  _hairColorG = random(hairColor[2], hairColor[3]);
  _hairColorB = random(hairColor[4], hairColor[5]);
  _mouthWidth = random(mouthWidth[0], mouthWidth[1]);
  _faceHeight = random(faceHeight[0], faceHeight[1]);
  _browLoc = random(browLoc[0], browLoc[1]);
  keyPrompt = ("");
}

void makeFace() {
  size(300, 300);
  noStroke ();
  background(240, 237, 194);
  rectMode(CENTER);
  translate(150, 150);

  //head
  fill(227, 197, 161);
  rect(0, 0, _faceWidth, _faceHeight);
  ellipse(20, 80, 50, 50);
  ellipse(-20, 80, 50, 50);
  
  //mouth
  fill(116, 52, 79);
  ellipse(0, 60, _mouthWidth, _mouthWidth);
  //ears
  fill(27, 197, 161);
  ellipse(170, -30, 25, 10);

  //eyes
  fill(255);
  ellipse(40, _eyeLoc, 40, 20);
  ellipse(-40, _eyeLoc, 40, 20);

  //pupils
  fill(0);
  ellipse(40, _eyeLoc, 10, 10);
  ellipse(-40, _eyeLoc, 10, 10);

  //eyebrows
  fill(_hairColorR, _hairColorG, _hairColorB);
  arc(40, _browLoc+5, 40, 20, -PI, 0);
  arc(-1*(40), _browLoc-5, 40, 20, -PI, 0);

  //hair
  fill(_hairColorR, _hairColorG, _hairColorB);
  rect(0, -1*_faceHeight/2, _faceWidth, 60, 40, 40, 0, 0);

  //nose
  fill(203, 175, 142);
  triangle(0, 0, 30, 30, -30, 30);
}



