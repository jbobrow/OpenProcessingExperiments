
//The man of a thousand faces . . .

//canvas space
float spaceW, spaceH, spaceX, spaceY;
float headW, headH;

void setup() {
  size(400, 400);
  spaceW = 400;
  spaceH = 400;
  spaceX = spaceW * .5;
  spaceY = spaceH * .5;

  smooth();
}

void draw() {
  background(120);
  drawHead(spaceX, spaceY, spaceW, spaceH);
  drawEyes();
//  drawNose();
//  drawMouth();
  noLoop();
}

void drawHead(float x, float y, float w, float h) {
  headW = w * random(.4, .65);
  headH = h * random(.4, .75);
  float corner = random(10, 50);
  rectMode(CENTER);
  rect(x, y, headW, headH, corner);
}

void drawEyes() {
  float eyeWidth = .2 * headW;
  float eyeHeight = .1 * headH;
  float eyeOffsetX = .25 * headW;
  float eyeOffsetY = .15 * headH;
  float pupilSize = .4 * eyeHeight;
  ellipse(spaceX + eyeOffsetX, spaceY - eyeOffsetY, eyeWidth, eyeHeight);
  ellipse(spaceX - eyeOffsetX, spaceY - eyeOffsetY, eyeWidth, eyeHeight);

  //pupil
  ellipse(spaceX + eyeOffsetX, spaceY - eyeOffsetY, pupilSize, pupilSize);
  ellipse(spaceX - eyeOffsetX, spaceY - eyeOffsetY, pupilSize, pupilSize);
}

