
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
float rowHeight;
float colWidth;

int scanLine;  // vertical position

void setup() {
  size(700, 700);
  myImg = loadImage("spinebill.JPG");

  pixelColors = new color[40]; // initialise the array
  scanLine = 0;
  smooth(4);
  colWidth = width/40;
  rowHeight = height/40;
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<40; i++) {
    pixelColors[i] = myImg.get(17+i*35, scanLine);
  }

  // draw the sampled pixels as verticle bars
  for (int i=0; i< 40; i++) {
    noStroke();
    fill(pixelColors[i], 90);
    rect(i*colWidth, 0, colWidth, 700);
  }

  // draw the image
  image(myImg, width/2, 0);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine += 1;
  }

  if (scanLine > height) {
    scanLine = 0;
  }
  // draw the sampled pixels as horizontal bars
  for (int i=0; i< 40; i++) {
    stroke(pixelColors[i]*i/40, 150);
    fill(pixelColors[i]*i/20);
    rect(width/2, i*rowHeight, width, rowHeight);
  }

  // draw circles over where the "scanner" is currently reading pixel values
  //for (int i=0; i<10; i++) {
  //  stroke(255, 0, 0);
  //  noFill();
    //              x                y     size
  //  ellipse(width/2 + 17 + i*35, scanLine, 5, 5 );
  //}
}



