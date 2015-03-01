
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

PImage bgImg;
PImage blur;
color[] pixelColors;
int scanLine, scanCol;  

void setup() {
  size(600, 450);
  bgImg = loadImage("chrysalid.jpg");

  pixelColors = new color[10];
  //scanLine = 0;
  smooth(4);
  rectMode(CENTER);
}

void draw() {
  //background(0);

  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    scanLine = int(random(height));
    scanCol = int(random(width));
    pixelColors[i] = bgImg.get(scanCol, scanLine);
  }

  // draw the image
  image(bgImg, 0, 0);
  int size = int(random(30));
  
  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<10; i++) {
    stroke(pixelColors[i]);
    strokeWeight(0);
    noStroke();
    fill(pixelColors[i]);
    
    ellipse(scanCol, scanLine, size, size);
    loadPixels();
    bgImg.loadPixels();
    bgImg.pixels = pixels;
    bgImg.updatePixels();
  }
}



