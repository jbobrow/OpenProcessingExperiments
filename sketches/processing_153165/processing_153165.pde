
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
color[] pixelCol2;
int imgWidth = 300;
int num = 15;
int bar = imgWidth/num;
int third = num*bar;
int scanLine;  // vertical position

void setup() {
  size(900, 300);
  myImg = loadImage("ice.jpg");
  pixelColors = new color[num];
  pixelCol2 = new color[num];
  scanLine = 0;
  smooth(4);
}

void draw() {
  background(0);
  // read the colours for the current scanLine
  for (int i=0; i<num; i++) {
    pixelColors[i] = myImg.get(bar/2+i*bar, scanLine);
    pixelCol2[i] = myImg.get(scanLine, bar/2+i*bar);
  }

  // draw the sampled pixels as vertical bars
  for (int i=0; i< num; i++) {
    noStroke();
    fill(pixelColors[i]);
    rect(i*bar, 0, bar, third);
    fill(pixelCol2[i]);
    rect(third*2, i*bar, third, bar);
  }

  // draw the image
  image(myImg, third, 0, third, third);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<num; i++) {
    stroke(255, 0, 0);
    noFill();
    ellipse(third + bar/2+i*bar, scanLine, 5, 5 );
    ellipse(third + scanLine, bar/2+i*bar, 5, 5);
  }
}



