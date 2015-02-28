
// click mouse when mario/luigi is under a toad to get the 
// toad to jump

PImage marioBackground;
PImage luigiLeft;
PImage marioRight;

float marioX = -50;
float marioY = height-90;
float speed = 4;
float direction = 1;
boolean jump = false;

void setup() {
  size(750, 450);
  frameRate(10);
  smooth();

  marioBackground = loadImage("marioBackground.jpg");
  luigiLeft = loadImage("luigi_left.png");
  marioRight = loadImage("mario_right.png");
}

void draw() {
  background(255);
  image(marioBackground, 0, 0, width, height);

  float toadY1 = height/2-32;
  float toadY2 = height/2-27;
  float toadY3 = height/2-22;

  marioX += speed*direction;

  if (marioX > width/2-65 && marioX < width/2+40) {
    marioY = 3*height/4-50;
  }    
  else {
    marioY = height-90;
    toadY1 = height/2-32;
    toadY2 = height/2-27;
    toadY3 = height/2-22;
  }

  if (jump) {
    marioY = height/2+22;
    if (marioX >= width-100 && marioX <= width) {
      toadY1 = 150;
    }
    if (marioX >= width-175 && marioX <= width-100) {
      toadY2 = 100;
    }
    if (marioX >= -25 && marioX <= 25) {
      toadY3 = 50;
    }
    jump = false;
  }

  if (marioX > width-1 || marioX < -49) {
    direction = -direction;
  }

  if (direction == 1) {
    image(marioRight, marioX, marioY, 50, 50);
  }
  else {
    image(luigiLeft, marioX, marioY, 50, 50);
  }

  drawStamp(width-45, toadY1, 0.75, 209, 0, 3, 255, 255, 255, 
  0, 0, 255);
  drawStamp(width-125, toadY2, 0.5, 209, 0, 3, 255, 255, 255, 
  0, 0, 255);
  drawStamp(15, toadY3, 0.25, 209, 0, 3, 255, 255, 255, 0, 0, 255);
}

void mousePressed() {
  jump = true;
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


