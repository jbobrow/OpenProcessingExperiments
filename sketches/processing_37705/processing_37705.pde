
float stampSize;
float hatR;

void setup() {
  size(900, 600);
  smooth();
}

void draw() {
  stampSize = map(mouseX, 0, width, .25, 1);
  hatR = map(mouseY, 0, height, 0, 255);
}

void mousePressed() {
  drawStamp(mouseX, mouseY, stampSize, hatR, 0, 0, 255, 255, 255,
  0, 0, 0);
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
  ellipse(x-stampSize*50, y-stampSize*40, stampSize*20, 
  stampSize*45);
  ellipse(x+stampSize*50, y-stampSize*40, stampSize*20, 
  stampSize*45);

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
  ellipse(x-stampSize*10, y-stampSize*8, stampSize*10, 
  stampSize*25);
  ellipse(x+stampSize*10, y-stampSize*8, stampSize*10, 
  stampSize*25);
  noStroke();
  fill(255);
  ellipse(x-stampSize*10, y-stampSize*15, stampSize*4, 
  stampSize*8);
  ellipse(x+stampSize*10, y-stampSize*15, stampSize*4, 
  stampSize*8);
}

void drawMouth(float x, float y, float stampSize) {
  noStroke();
  fill(0);
  arc(x, y+stampSize*10, stampSize*30, stampSize*15, 0, PI);
  fill(209, 0, 3);
  arc(x, y+stampSize*14, stampSize*20, stampSize*8, 0, PI);
}


