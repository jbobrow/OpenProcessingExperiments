
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This simple sketch demonstrates how to read pixel values from an image
 * It simulates a 10 pixel "scanner" that moves from the top to the bottom of the image
 * reading the colour values for 10 equally spaced points, then displaying those colours
 * as vertical bars on the left half of the screen.
 *
 */

/* @pjs preload="nasaImage.jpg"; */

PImage myImg;
float fScannerX, fScannerY, fScannerDX, fScannerDY, fScannerR, fScannerDT; 
float[] fPixelT;
color[] pixelColors;
boolean bShowImage;
int iCount, iCircleStep;
float fCircleStep;


void setup() {
  size(622, 622);
  myImg = loadImage("nasaImage.jpg");

  iCount = 8;
  fCircleStep = width/(iCount-1.5);

  pixelColors = new color[iCount];
  fPixelT = new float[iCount];

  fScannerR = random(30, 70);
  fScannerX = random(fScannerR, myImg.width-fScannerR);
  fScannerY = random(fScannerR, myImg.height-fScannerR);

  float fR = random(0.2, 0.6);
  float fT = random(0, TWO_PI);
  fScannerDX = fR*cos(fT);
  fScannerDY = fR*sin(fT);

  fScannerDT = random(-PI/128, PI/128);

  for (int i=0; i<iCount; i++)
    fPixelT[i] = i*(TWO_PI/iCount);

  bShowImage = false;

  smooth(4);
}

void draw() {
  // read the colours for the current scanLine
  for (int i=0; i<iCount; i++) {
    int x = int(fScannerX+(fScannerR*cos(fPixelT[i])));
    int y = int(fScannerY+(fScannerR*sin(fPixelT[i])));
    pixelColors[i] = myImg.get(x, y);
  }

  // draw the sampled pixels as verticle bars
  background(pixelColors[0]);
  for (int i=1; i<iCount; i++) {
    noStroke();
    fill(pixelColors[i]);
    ellipse(width/2, height/2, width-((i-1)*fCircleStep), height-((i-1)*fCircleStep));
  }

  if (bShowImage) {
    // draw the image
    image(myImg, 0, 0);

    stroke(255, 0, 0);
    noFill();

    //draw scanner frame
    ellipse(fScannerX, fScannerY, 2*fScannerR, 2*fScannerR);
    line(fScannerX, fScannerY, fScannerX+fScannerDX*10, fScannerY+fScannerDY*10);
    // draw circles over where the "scanners" are currently reading pixel values
    for (int i=0; i<iCount; i++)
      ellipse(fScannerX+(fScannerR*cos(fPixelT[i])), fScannerY+(fScannerR*sin(fPixelT[i])), 5, 5 );
  }

  //increment scan position every frame
  fScannerX += fScannerDX;
  fScannerY += fScannerDY;

  //bounce off walls
  if ((fScannerX>=(myImg.width-1)-fScannerR)||(fScannerX<=fScannerR))
    fScannerDX *= -1;
  if ((fScannerY>=(myImg.height-1)-fScannerR)||(fScannerY<=fScannerR))
    fScannerDY *= -1;  

  //constrain to canvas
  fScannerX = constrain(fScannerX, 0, myImg.width-1);
  fScannerY = constrain(fScannerY, 0, myImg.height-1);

  //spin circle
  for (int i=0; i<iCount; i++)
    fPixelT[i] += fScannerDT;
}

void keyPressed() {
  switch(key) {
  case 'i':
    bShowImage = !bShowImage;
    break;
  }
}


