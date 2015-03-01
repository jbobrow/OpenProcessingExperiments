
Creature[]phil = new Creature[200];

void setup () {
  size(300, 300);
  for (int f = 0; f <100; f++) {
    phil[f] = new Creature ();
  }
}



void draw () {
  background(255);

  for (int i = 0; i <100; i++) {
    for (int j = 0; j<100; j++) { 
      phil[i].prime(j*20, i*20, .5);
      phil[i].update();
    }
  }
}
class Creature {

  float bigness;
  float xPos;
  float yPos;
  float rightEye;
  float leftEye;
  float eyeHeight;
  float eyeLerp;
  float eyeLerp2;
  float eyeLerp3;
  float pupil;
  float pupil2;
  float pupilHeight;

  void prime(float _xPos, float _yPos, float _bigness) {
    xPos = _xPos;
    yPos = _yPos;
    bigness = _bigness;
    rightEye = xPos-bigness*10;
    leftEye = xPos+bigness*10;
    eyeHeight =yPos-bigness*2;
    pupil = constrain(mouseX, rightEye-(bigness*50), rightEye+(bigness*50));
    pupil2 = constrain(mouseX, leftEye-(bigness*50), leftEye+(bigness*50));
    pupilHeight = constrain(mouseY, eyeHeight-(bigness*40), eyeHeight+(bigness*40));
    eyeLerp = lerp(rightEye, pupil, .1);
    eyeLerp2 = lerp(leftEye, pupil2, .1);
    eyeLerp3 = lerp(eyeHeight, pupilHeight, .1);
  }

  void update() {
    noStroke();
    fill(150, 150, 255);
    //body
    ellipse(xPos, yPos, bigness*40, bigness*40);
    //eyes
    fill(255); //white eyes
    ellipse(xPos-(bigness*10), yPos-(bigness*1), bigness*20, bigness*20); 
    ellipse(xPos+(bigness*10), yPos-(bigness*1), bigness*20, bigness*20);
    fill(0); //pupils
    ellipse(eyeLerp, eyeLerp3, bigness*8, bigness*8); 
    ellipse(eyeLerp2, eyeLerp3, bigness*8, bigness*8);
  }
}

