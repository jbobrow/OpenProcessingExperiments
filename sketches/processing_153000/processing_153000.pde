
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
color[] pixelColors;
int scanLine;  // vertical position
int scanCount;

void setup() {
  size(700, 622);
  myImg = loadImage("nasaImage.jpg");

  pixelColors = new color[10];
  scanLine = 0;
  scanCount = 0;
  smooth(4);

  background(0);
}

void draw() {
//  background(0);

  // read the colours for the current scanLine
  // Slow down the reading / refresh rate so not too frenetic
  int j = frameCount % 10;
  pixelColors[j] = myImg.get(17+j*35, scanLine);
  
  // Rotate every frame
  translate(width/2, height/2);
  rotate(PI/30 * frameCount);

  // Every time whole picture is scanned, choose a different colour
  // channel
  int scanMask = 0xFF << (scanCount % 3);

  // draw the sampled pixels as a series of vertical ellipses
  for (int i=0; i< 10; i++) {
    int byteVal = (pixelColors[i] & scanMask) >> (scanCount % 3);
    stroke(0,64);
    fill(pixelColors[i],64);
    drawBinary(i*70, height/2, 70, height, byteVal);
  }

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
    scanCount++;
  }
}

// Draws up to 8 ellipses spead over binWidth by binHeight pixels
// The value is intepreted as an 8 bit number, and an ellipse drawn
// only if the relevant bit is set
void drawBinary(float x, float y, float binWidth, float binHeight, int value) {
  for (int i=7; i>=0; i--) {
    int mask = 1 << i;
    if ((value & mask) != 0) {
      ellipse(x + binWidth/8 * i, y, binWidth/8, binHeight);
    }
  }
} 


