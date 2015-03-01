
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

PImage myImg;
float[] fPixelX, fPixelY,fPixelDX, fPixelDY;
color[] pixelColors;
boolean bShowImage;
int iRows, iCols, iSquares;
float fSquareW, fSquareH;


void setup() {
  size(350, 622);
  myImg = loadImage("nasaImage.jpg");

  iCols = 2;
  iRows = 4;
  iSquares = iCols*iRows;
  fSquareW = width/iCols;
  fSquareH = height/iRows;

  pixelColors = new color[iSquares];
  fPixelX = new float[iSquares];
  fPixelY = new float[iSquares];
  fPixelDX = new float[iSquares];
  fPixelDY = new float[iSquares];
  
  for(int i=0;i<iSquares;i++) {
    fPixelX[i] = random(0,350);
    fPixelY[i] = random(0,622);

    float fR = random(0.5,1);
    float fTheta = random(0,TWO_PI);
    
    fPixelDX[i] = fR*cos(fTheta);
    fPixelDY[i] = fR*sin(fTheta);
  }
  
  bShowImage = false;
  
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<iSquares; i++) {
    pixelColors[i] = myImg.get((int)fPixelX[i],(int)fPixelY[i]);
  }

  // draw the sampled pixels as verticle bars
  for (int i=0; i<iSquares; i++) {
    noStroke();
    fill(pixelColors[i]);
    rect((i%iCols)*fSquareW, int(i/iCols)*fSquareH, fSquareW, fSquareH);
  }
  
  if(bShowImage) {
    // draw the image
    image(myImg, 0, 0);
  
    // draw circles over where the "scanners" are currently reading pixel values
    for (int i=0; i<iSquares; i++) {
      stroke(255, 0, 0);
      noFill();
      ellipse(fPixelX[i], fPixelY[i], 5, 5 );
      line(fPixelX[i], fPixelY[i],fPixelX[i]+fPixelDX[i]*10, fPixelY[i]+fPixelDY[i]*10);
    }
  }
  
  // increment scan position every second frame
  for(int i=0;i<iSquares;i++) {
    fPixelX[i] += fPixelDX[i];
    fPixelY[i] += fPixelDY[i];
    
    //bounce off walls
    if((fPixelX[i]>=width-1)||(fPixelX[i]<=0))
      fPixelDX[i] *= -1;
    if((fPixelY[i]>=height-1)||(fPixelY[i]<=0))
      fPixelDY[i] *= -1;
    
    //constrain to canvas
    fPixelX[i] = constrain(fPixelX[i],0,width-1);
    fPixelY[i] = constrain(fPixelY[i],0,height-1);
  }
}

void keyPressed() {
  switch(key) {
    case 'i':
      bShowImage = !bShowImage;
      break;  
  }
}



