
//HW11
//Katherine Y. Lee
//Copyright 2012

//initial idea credits to Zhaochang He

final int max = 30;

//arrays
int [] dotA;
int [] dotB;
int [] speedA;
int [] speedB;
int [] dotSize;
color [] dotColor;


void setup() {
  size (800, 600);
  smooth ();
  noStroke ();
  frameRate (30);
  dotA = new int [max];
  dotB = new int [max];
  speedA = new int [max];
  speedB = new int [max];
  dotSize = new int [max];
  dotColor = new int [max];

  initColor ();
  initArray (dotA, 0, 10);
  initArray (dotB, 0, 600);
  initArray (dotSize, 50, 300);
  initArray (speedA, 1, 5);
  initArray (speedB, 1, 10);
  
}


void draw() {
  prepBackground();
  drawDots();
  moveDots();
}


void initArray(int [] anyArray, int x, int y) {
  for (int i=0; i < anyArray.length; i++) {
    anyArray[i] = int (random(x,y));
  }
}


void prepBackground() {
  background(255);
}

void initColor() {
  for (int i = 0; i < dotColor.length; i++) {
    dotColor[i] = color (0, (int)random(170, 200), (int)random(150, 180));
  }
}

void drawDots() {
  for (int i = 0 ; i < max; i++) {
    fill(dotColor[i], 220);
    ellipse(dotA[i], dotB[i], dotSize[i], dotSize[i]);
  }
}

void moveDots() {
  for (int i=0; i < max; i++) {
    dotA[i] = dotA[i] + speedA[i];
    if (dotA[i] + (dotSize[i]/2) > width) {
      speedA[i] = -speedA[i];
    }
    if (dotA[i] + (dotSize[i]/2) < -width) {
      speedA[i] = -speedA[i];
    }
    dotB[i] = dotB[i] + speedB[i];
    if (dotB[i] + (dotSize[i]/2) > height) {
      speedB[i] = -speedB[i];
    }
    if (dotB[i] + (dotSize[i]/2) < - height) {
      speedB[i] = -speedB[i];
  }
}
}
