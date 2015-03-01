
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
 *  MODIFIED for step 4.8
 *  by Federico Andrea Siciliano
 */

PImage myImg;
color[] pixelColors;
int scanLine;  // vertical position

void setup() {
  size(1450, 700);                                   // modified size to adjust better to the new image
  myImg = loadImage("fractal 1.jpg");                // changed the original image with one uploaded by myself

  pixelColors = new color[10];
  scanLine = 0;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.get(17+i*35, scanLine);
  }

  // draw the sampled pixels as verticle bars
  // this part is modified 
  for (int i=0; i< 10; i++) {
    stroke(pixelColors[i]);
    line(i*35, 0, i*22, height);                        // draw sample pixels as diagonal lines
    noStroke();
    fill(pixelColors[i]);
    ellipse (width/3-25, 75 + i*50, 22, 22);            // draw sample pixels as circles
    ellipse (width/3 - 130, height - 40, i*26, i*8);    // draw a big ellipse on the bottom
  }

  // draw the image
  image(myImg, width/3, 0);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<10; i++) {
    stroke(255, 0, 0);
    noFill();
    ellipse(width/3 + 35 + i*100, scanLine, 5, 5 );          // modified the spacing of the circles to adjoust to the new dimension
  }
}



