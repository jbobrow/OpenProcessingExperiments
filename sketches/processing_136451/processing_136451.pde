
boolean flipFlop = false;
String keyPrompt = "Press any key";
  int eyeDire;
  int eyeBrowLoc;
  
  //bgColor
  float bgColorR[] = {0, 255};
  float bgColorG[] = {0, 255};
  float bgColorB[] = {0, 255};
  
  //hairBase
  float hairBaseR[] = {0, 255};
  float hairBaseG[] = {0, 255};
  float hairBaseB[] = {0, 255};
  
  //hairShade
  float hairShadeR[] = {0, 255};
  float hairShadeG[] = {0, 255};
  float hairShadeB[] = {0, 255};
  
  //noseBase
  float noseBaseR[] = {0, 255};
  float noseBaseG[] = {0, 255};
  float noseBaseB[] = {0, 255};
  
  //noseLight
  float noseLightR[] = {0, 255};
  float noseLightG[] = {0, 255};
  float noseLightB[] = {0, 255};
  
  //mouthColor
  float mouthColorR[] = {0, 255};
  float mouthColorG[] = {0, 255};
  float mouthColorB[] = {0, 255};
  
//_commands
  //bgColor
  float _bgColorR = 104;
  float _bgColorG = 216;
  float _bgColorB = 234;
  
  //hairBase
  float _hairBaseR = 255;
  float _hairBaseG = 0;
  float _hairBaseB = 0;
  
  //hairShade
  float _hairShadeR = 203;
  float _hairShadeG = 8;
  float _hairShadeB = 8;
  
  //noseBase
  float _noseBaseR = 255;
  float _noseBaseG = 0;
  float _noseBaseB = 0;
  
  //noseLight
  float _noseLightR = 255;
  float _noseLightG = 120;
  float _noseLightB = 108;
  
  //mouthColor
  float _mouthColorR = 255;
  float _mouthColorG = 0;
  float _mouthColorB = 0;

void setup() {
  size(300, 300);
  background(104, 216, 234);
  textSize(15);
}

void draw () {
  if (flipFlop == false){
    eyeDire = 10;
    eyeBrowLoc = -25;
  }
  if (flipFlop == true){
    eyeDire = -7;
    eyeBrowLoc = -35;
  }
  
  makeFace();
  smooth();
  text(keyPrompt, -145, -135);
}

void keyPressed() {
  flipFlop =! flipFlop;
  
  //bgColor
  _bgColorR = random(bgColorR[0], bgColorR[1]);
  _bgColorG = random(bgColorG[0], bgColorG[1]);
  _bgColorB = random(bgColorB[0], bgColorB[1]);
  
  //hairBase
  _hairBaseR = random(hairBaseR[0], hairBaseR[1]);
  _hairBaseG = random(hairBaseG[0], hairBaseG[1]);
  _hairBaseB = random(hairBaseB[0], hairBaseB[1]);
  
  //hairShade
  _hairShadeR = random (hairShadeR[0], hairShadeR[1]);
  _hairShadeG = random (hairShadeG[0], hairShadeG[1]);
  _hairShadeB = random (hairShadeB[0], hairShadeB[1]);
  
  //noseBase
  _noseBaseR = random (noseBaseR[0], noseBaseR[1]);
  _noseBaseG = random (noseBaseG[0], noseBaseG[1]);
  _noseBaseB = random (noseBaseB[0], noseBaseB[1]);
  
  //noseLight
  _noseLightR = random (noseLightR[0], noseLightR[1]);
  _noseLightG = random (noseLightG[0], noseLightG[1]);
  _noseLightB = random (noseLightB[0], noseLightB[1]);
  
  //mouthColor
  _mouthColorR = random (mouthColorR[0], mouthColorR[1]);
  _mouthColorG = random (mouthColorG[0], mouthColorG[1]);
  _mouthColorB = random (mouthColorB[0], mouthColorB[1]);
  
  keyPrompt = ("");
}

void makeFace() {
  background (_bgColorR, _bgColorG, _bgColorB);
  noStroke();
  rectMode(CENTER);
  translate(150, 150);
  
  //hairBase
  fill(_hairBaseR, _hairBaseG, _hairBaseB);
  ellipse(-80, 0, 90, 60);
  ellipse(80, 0, 90, 60);
  ellipse(-80, -50, 70, 50);
  ellipse(80, -50, 70, 50);
  ellipse(80, -20, 120, 75);
  ellipse(-80, -20, 120, 75);
  
  //hairShade
  fill(_hairShadeR, _hairShadeG, _hairShadeB);
  ellipse(-80, 5, -55, -40);
  ellipse(80, 5, -55, -40);
  ellipse(-70, -15, -55, -40);
  ellipse(70, -15, -55, -40);
  
  //base head
  fill(255);
  rect(0, 0, 150, 200, 40);
  ellipse(0, 100, 50, 25);
  ellipse(-75, 0, 30, 20);
  ellipse(75, 0, 30, 20);
  
  //eyebrows
  fill(255, 0, 0);
  ellipse(40, -30, 70, 20);
  ellipse(-40, -30, 70, 20);
  fill(255);
  ellipse(40, eyeBrowLoc, 70, 20);
  ellipse(-40, eyeBrowLoc, 70, 20);
  
  //eyes
  fill(0);
  ellipse(-38, 0, 25, 25);
  ellipse(38, 0, 25, 25);
  fill(255);
  ellipse(-38, eyeDire, 25, 25);
  ellipse(38, eyeDire, 25, 25);
  
  //nose
  fill(_noseBaseR, _noseBaseG, _noseBaseB);
  ellipse(0, 30, 50, 50);
  fill(_noseBaseR, _noseBaseG, _noseBaseB);
  ellipse(9, 25, 20, 20);
  fill(255);
  ellipse(10, 25, 10, 10);
  
  //mouth
  fill(_mouthColorR, _mouthColorG, _mouthColorB);
  arc(0, 70, 55, 55, 0, PI, CHORD);
  fill(255);
  arc(0, 74, 45, 40, 0, PI, CHORD);
  
}


