
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
 /* @pjs preload="thistle.JPG"; */


PImage myImg;
color[] pixelColors;
color[] pixelhColors;
int scanLine;  // vertical position
int scanhLine;  // horizontal position

void setup() {
  size(700, 622);
  myImg = loadImage("thistle.JPG");

  pixelColors = new color[10];
  pixelhColors = new color[10];
  scanLine = 0;
  scanhLine = width/2;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.get(17+i*35, scanLine);
  }

  // draw the sampled pixels as vertical bars
  for (int i=0; i< 10; i++) {
    noStroke();
    fill(pixelColors[i]);
    rect(i*35, 0, 35, 622);

  }
  
    // read the colours for the current scanhLine
  for (int i=0; i<18; i++) {
    pixelhColors[i] = myImg.get(scanhLine, 17+i*43);
  }

  // draw the sampled pixels as horizontal bars
  for (int i=0; i< 18; i++) {
    noStroke();
    fill(pixelhColors[i]);
    rect(0, i*43, 350, 15);

  }

  // draw the image
  image(myImg, width/2, 0);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
        scanhLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }
  
    if (scanhLine > width) {
    scanhLine = width/2;
  }

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<10; i++) {
    stroke(255, 0, 0);
    noFill();
    ellipse(width/2 + 17 + i*35, scanLine, 5, 5 );
    ellipse(scanhLine, 17 + i*70, 5, 5 );
  }
}



