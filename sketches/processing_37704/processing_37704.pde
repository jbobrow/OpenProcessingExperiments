
PImage cloudyBackground;

void setup() {
  size(900, 630);
  smooth();
  noLoop();

  cloudyBackground = loadImage("cloudy_background.jpg");
}

void draw() {
  background(255);
  image(cloudyBackground, 0, 0, width, height);

  float stampSize;
  float hatR;
  float hatG;
  float hatB;
  float dotR;
  float dotG;
  float dotB;
  float eyeR;
  float eyeG;
  float eyeB;

  for (int i=1; i < 9; i++) {
    for (int j=1; j<7; j++) {

      stampSize = random(.25, .75);
      hatR = random(174, 245);
      hatG = 0;
      hatB = random(0, 245);
      dotR = 255;
      dotG = 255;
      dotB = 255;
      eyeR = 36;
      eyeG = random(39, 162);
      eyeB = random(37, 162);

      drawStamp(i*100, j*100, stampSize, hatR, hatG, hatB, dotR, 
      dotG, dotB, eyeR, eyeG, eyeB);
    }
  }
}

void drawStamp(float x, float y, float stampSize, 
float hatR, float hatG, float hatB, 
float dotR, float dotG, float dotB, 
float eyeR, float eyeG, float eyeB) {

  drawHat(x, y, stampSize, hatR, hatG, hatB, dotR, dotG, dotB);
  drawFace(x, y, stampSize);
  drawEyes(x, y, stampSize, eyeR, eyeG, eyeB);
  drawMouth(x, y, stampSize);
}

void drawHat(float x, float y, float stampSize, 
float hatR, float hatG, float hatB, 
float dotR, float dotG, float dotB) {
  noStroke();
  fill(hatR, hatG, hatB);
  ellipse(x, y-stampSize*40, stampSize*120, stampSize*100);

  fill(dotR, dotG, dotB);
  ellipse(x, y-stampSize*65, stampSize*45, stampSize*45);
  ellipse(x-stampSize*50, y-stampSize*40, stampSize*20, stampSize*45);
  ellipse(x+stampSize*50, y-stampSize*40, stampSize*20, stampSize*45);

  noFill();
  stroke(0);
  ellipse(x, y-stampSize*40, stampSize*120, stampSize*100);
}

void drawFace(float x, float y, float stampSize) {
  fill(230, 198, 123);
  ellipse(x, y, stampSize*80, stampSize*40);
  ellipse(x, y-stampSize*10, stampSize*80, stampSize*40);
  noStroke();
  rect(x-stampSize*40, y-stampSize*12, stampSize*80, stampSize*12);
  rect(x-stampSize*38, y, stampSize*76, stampSize*4);
  rect(x-stampSize*30, y, stampSize*60, stampSize*12);
  noFill();
  stroke(0);
  line(x-stampSize*40, y-stampSize*12, x-stampSize*40, y);
  line(x+stampSize*40, y-stampSize*12, x+stampSize*40, y);
}

void drawEyes(float x, float y, float stampSize, 
float eyeR, float eyeG, float eyeB) {
  fill(eyeR, eyeG, eyeB);
  ellipse(x-stampSize*10, y-stampSize*8, stampSize*10, stampSize*25);
  ellipse(x+stampSize*10, y-stampSize*8, stampSize*10, stampSize*25);
  noStroke();
  fill(255);
  ellipse(x-stampSize*10, y-stampSize*15, stampSize*4, stampSize*8);
  ellipse(x+stampSize*10, y-stampSize*15, stampSize*4, stampSize*8);
}

void drawMouth(float x, float y, float stampSize) {
  noStroke();
  fill(0);
  arc(x, y+stampSize*10, stampSize*30, stampSize*15, 0, PI);
  fill(209, 0, 3);
  arc(x, y+stampSize*14, stampSize*20, stampSize*8, 0, PI);
}


