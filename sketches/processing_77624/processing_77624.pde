
//homework 11
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin October 2012 Pittsburgh PA 15213 All Rights Reserved

final int amount=200;
float[] xpos;
float[] ypos;
float[] squareSize;
float[] xspeed;
float[] yspeed;
float[] t;
float[] tdelta;
color[] col;

float noiseScale;


void setup() {
  size(700, 700);
  smooth();
  noiseScale = width/15;

  xpos = new float[amount];
  ypos = new float[amount];
  squareSize = new float[amount];
  xspeed = new float[amount];
  yspeed = new float[amount];
  t = new float[amount];
  tdelta = new float[amount];
  col = new color[amount];

  initializeFloatArray(xpos, 0, width);
  initializeFloatArray(ypos, 0, width);
  initializeFloatArray(xspeed, .5, 2);
  initializeFloatArray(yspeed, .5, 2);
  initializeFloatArray(squareSize, 5, 50);
  initializeFloatArray(t, .001, .005);
  initializeFloatArray(tdelta, .005, .01);
  initializeColorArray();
}

void draw() {
  drawBackground();
  drawSquares();
  moveSquares();
}


void initializeFloatArray(float[] anyArray, float low, float high) {
  for (int i=0;i<anyArray.length;i++) {
    anyArray[i]=(random(low, high));
  }
}

void initializeColorArray() {
  for (int i=0;i<col.length;i++) {
    col[i] = color(int(random(255)), 
    int(random(255)), 
    int(random(255)), 
    random(100));
  }
}

void initializeSpeedArray(float[] anyArray) {
  for (int i=0;i<anyArray.length;i++) {
    anyArray[i]=(random(.5, 2));
  }
}

void drawBackground() {
  noStroke();
  fill(100, 100, 100, 90);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void drawSquares() {
  for (int i=0;i<xpos.length;i++) {
    t[i] += tdelta[i];
    float noiseValue = noise(t[i]);
    fill(col[i]);
    stroke(255);
    rectMode(CENTER);
    rect(xpos[i], ypos[i], squareSize[i]+noise(t[i])*noiseScale, squareSize[i]+noise(t[i])*noiseScale, 10);
  }
}

void moveSquares() {
  for (int i=0;i<xpos.length;i++) {
    xpos[i]+=xspeed[i];
    ypos[i]+=yspeed[i];
    if ((xpos[i]-squareSize[i]/2<0) || (xpos[i]+squareSize[i]/2>width)) {
      xspeed[i] = -xspeed[i];
    } 
    if ((ypos[i]-squareSize[i]/2<0) || (ypos[i]+squareSize[i]/2>width)) {
      yspeed[i] = -yspeed[i];
    }
  }
}
