
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

void setup() {
  size(622, 622);
  myImg = loadImage("sample_0403.jpg");

  pixelColors = new color[9];
  scanLine = 0;
  smooth(4);
}

void draw() {
  background(200,100,random(205));

  // read the colours for the current scanLine
  for (int i=0; i<9; i++) {
    pixelColors[i] = myImg.get(17+i*35, scanLine);
  }

  // draw the sampled pixels as verticle bars
  for (int i=0; i< 9; i++) {
    noStroke();
    fill(pixelColors[i]);
    rect(i*35, 25, 35, 722);
  }

  // draw the image
  image(myImg, width/2, 0);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > width) {
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<9; i++) {
    stroke(200,100,random(205));
    noFill();
    ellipse(width/2 + 17 + i*35, scanLine, 5, 5 );
  }
}



