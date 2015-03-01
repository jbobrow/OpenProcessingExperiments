
//Headspace
//generating faces through paramatierizing aspects of face
//Voila, Sesame Street muppets!

float xPos, yPos;
float headSpace = 100;
float faceWidth, faceHeight, faceWPc, faceHPc;
float eyeWidth, eyeHeight, eyeOffsetX, eyeOffsetY;
float noseYOffset;

boolean randomize = true;

void setup() {
  size(800, 800); 
  smooth(8);
}

void draw() {

  if (randomize) {
    background(255);

    for (int i = 0; i < width/headSpace; i++) {
      for (int j = 0; j < height/headSpace; j++) {
        makeFace(headSpace * i + headSpace/2, headSpace * j + headSpace/2);
        makeEyes(headSpace * i + headSpace/2, headSpace * j + headSpace/2);
        makeNose(headSpace * i + headSpace/2, headSpace * j + headSpace/2);
        makeMouth(headSpace * i + headSpace/2, headSpace * j + headSpace/2);
      }
    }
  }
  randomize = false;
}

void makeFace(float xPos, float yPos) {
  fill(128, random(200), random(209), 200 );
  faceWPc = random(.6, .75);
  faceHPc = random(.6, .75);
  faceWidth = headSpace * faceWPc;
  faceHeight = headSpace * faceHPc;
  rectMode(CENTER);
  rect(xPos, yPos, faceWidth, faceHeight, random(10, 40));
}


void makeEyes(float xPos, float yPos) {
  fill(255, 110);
  eyeWidth = faceWidth * random(.1, .5);
  eyeHeight = faceHeight * random(.05, .20);
  float offSetSpace = faceWidth * .25 - eyeWidth * .5;
  eyeOffsetX = faceWidth * .25 + random(-offSetSpace, offSetSpace);
  eyeOffsetY = random(.25 * faceHeight);
  ellipse(xPos + eyeOffsetX, yPos - eyeOffsetY, eyeWidth, eyeHeight);
  ellipse(xPos - eyeOffsetX, yPos - eyeOffsetY, eyeWidth, eyeHeight);
  //pupils!
  ellipse(xPos + eyeOffsetX, yPos - eyeOffsetY, 2, 2);
  ellipse(xPos - eyeOffsetX, yPos - eyeOffsetY, 2, 2);
}

void makeNose(float xPos, float yPos) {
  float noseXOffset = random( -faceWidth * .25, faceWidth * .25);
  noseYOffset = random(.25 * faceHeight);
  line(xPos, yPos - eyeOffsetY, xPos + noseXOffset, yPos + noseYOffset);
  line(xPos + noseXOffset, yPos + noseYOffset, xPos, yPos + noseYOffset );
}

void makeMouth(float xPos, float yPos) {
  fill(0, 100);
  float mouthWidth = random(.25 * faceWidth, .5 * faceWidth);
  float mouthHeight = 10;
  float mouthX = xPos;
  float mouthY = yPos + noseYOffset + .5 * mouthHeight + 5;
  ellipse(mouthX, mouthY, mouthWidth, mouthHeight);
}

void mouseClicked() {
  randomize = !randomize;
}

