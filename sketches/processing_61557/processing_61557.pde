
//PROBLEM WHERE THERE IS NO TIME DELAY FOR REPETITION ON THE SAME Y LINE
int[] x = {
  19, 1, 3, 5, 7, 9, 11, 13, 15, 17, 3, 12, 8, 7, 6, 9, 11, 13, 16, 15, 17, 19, 16, 14, 18, 20, 2, 8, 5, 10, 14, 10, 4, 6, 12, 4
};
int[] y = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 2, 1, 2, 2, 2, 1, 2, 2, 2, 3, 3, 1, 1, 1, 1, 2, 1, 1, 3, 1, 3, 1, 3
};

float boxX = 350;
float boxY = 250;

int boxSpacing = 30;
int boxSize = 10;
int lastKey = 48;

float ellipsemodX = 0;
float ellipsemodY = 0;

float sw = 12;

float wanderX = 0;
float wanderY = 0;
int wanderTimer = 0;

int delayTimer = 0;


float ellipseX = 350;
float ellipseY = 250;
float ellipsemodX_ = 350;
float ellipsemodY_ = 250;

int lineStackHL = 0;
int lineStackHR = 0;
int lineStackVU = 0;
int lineStackVD = 0;
int shapeTimer = 0;
boolean shapeTimerOn = false;

int keyStoreY;
int keyStoreX;

void setup() {
  size (700, 350);
  background(255);
  smooth();
  int i = 0;
  while (i<36) {
    y[i] = y[i]*2;
    i++;
  }
}

void draw() {
  wanderTimer();
  fill(255, 20);
  rectMode (CENTER);
  rect (width/2, height/2, width+width/2, height+height/2);
  ellipsemodX_ = ellipsemodX;
  ellipsemodY_ = ellipsemodY;
  strokeWeight(sw);
  if ((keyPressed)) {
    if (((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48]))||((lastKey<=90)&&(lastKey>=55)&&(keyStoreX != x[lastKey-55]))){
          delayTimer = 0;
      }
    delayTimer++;
    if (delayTimer > 10) {
      ellipsemodX = (boxX-ellipseX)/25;
      ellipsemodY = (boxY-ellipseY)/25;
      strokeWeight(sw*0.8);
    }
    }
    else {
      ellipsemodX = (boxX-ellipseX+wanderX)/80;
      ellipsemodY = (boxY-ellipseY+wanderY)/80;
    }
  
  ellipseX = ellipseX+ellipsemodX;
  ellipseY = ellipseY+ellipsemodY;
  point (ellipseX, ellipseY);
  line (ellipseX, ellipseY, ellipseX-ellipsemodX_, ellipseY-ellipsemodY_);
  keyCheck();
  println(delayTimer);
  rect (width+10, 0, -lineStackHL*40, 10);
  rect (-10, 0, lineStackHR*40, 10);
  rect (0, height+10, 10, -lineStackVU*40);
  rect (width-10, -10, 10, lineStackVD*40);
  shapeTimer++;
  if ((shapeTimer>30)&&(shapeTimerOn = true)) {
    shapeTimer =  0;
    lineStackHL = 0;
    lineStackHR = 0;
    lineStackVU = 0;
    lineStackVD = 0;
    shapeTimerOn = false;
  }
}

void keyPressed() {
  lastKey = keyCode;
}


void keyCheck() {
  if (keyPressed) {
  }
  if (keyPressed) {
    shapeTimerOn = true;
    if ((lastKey<=57)&&(lastKey>=48)) {
      fill(0, 255);
      boxX = x[lastKey-48]*boxSpacing;
      boxY = y[lastKey-48]*boxSpacing+100;
      ellipse (boxX, boxY, boxSize, boxSize);
      if ((keyStoreX == x[lastKey-48]+2)&&(keyStoreY == y[lastKey-48])) {
        lineStackHL = lineStackHL+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackHL = 0;
      }
      if ((keyStoreX == x[lastKey-48]-2)&&(keyStoreY == y[lastKey-48])) {
        lineStackHR = lineStackHR+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackHR = 0;
      }
      if (((keyStoreX == x[lastKey-48]-1)||(keyStoreX == x[lastKey-48]+1))&&(keyStoreY == y[lastKey-48]+2)) {
        lineStackVU = lineStackVU+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackVU = 0;
      }
      if (((keyStoreX == x[lastKey-48]-1)||(keyStoreX == x[lastKey-48]+1))&&(keyStoreY == y[lastKey-48]-2)) {
        lineStackVD = lineStackVD+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackVD = 0;
      }
      if (keyStoreX != lastKey) {
        keyStoreX = x[lastKey-48];
        keyStoreY = y[lastKey-48];
      }
    }
  }

  if (keyPressed) {
    if ((lastKey<=90)&&(lastKey>=65)) { 
      fill(0, 255);
      boxX = x[lastKey-55]*boxSpacing;
      boxY = y[lastKey-55]*boxSpacing+100;
      ellipse (boxX, boxY, boxSize, boxSize);
      if ((keyStoreX == x[lastKey-55]+2)&&(keyStoreY == y[lastKey-55])) {
        lineStackHL = lineStackHL+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackHL = 0;
      }
      if ((keyStoreX == x[lastKey-55]-2)&&(keyStoreY == y[lastKey-55])) {
        lineStackHR = lineStackHR+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackHR = 0;
      }
      if (((keyStoreX == x[lastKey-55]-1)||(keyStoreX == x[lastKey-55]+1))&&(keyStoreY == y[lastKey-55]+2)) {
        lineStackVU = lineStackVU+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackVU = 0;
      }
      if (((keyStoreX == x[lastKey-55]-1)||(keyStoreX == x[lastKey-55]+1))&&(keyStoreY == y[lastKey-55]-2)) {
        lineStackVD = lineStackVD+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackVD = 0;
      }
      keyStoreX = x[lastKey-55];
      keyStoreY = y[lastKey-55];
    }
  }
}


void wanderTimer() {
  wanderTimer++;
  if (wanderTimer>((int)random(20, 40))) {
    wanderX = (int)random(-20, 20);
    wanderY = (int)random(-20, 20);
    wanderTimer = 0;
  }
}


