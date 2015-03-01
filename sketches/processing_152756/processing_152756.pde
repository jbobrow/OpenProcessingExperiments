
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
color[] pixelColors2;
int scanLine;  // vertical position
int num = 15;

void setup() {
  size(515, 690);
  myImg = loadImage("morris_10.jpg");

  pixelColors = new color[num];
  pixelColors2 = new color[num];
  scanLine = 0;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<num; i++) {
    for (int j=0; j< num; j++) {
      pixelColors[i] = myImg.get(20+i*35, scanLine);
      pixelColors2[j] = myImg.get(j*35, scanLine);
    }
  }

  // draw the image
  image(myImg, 0, 0);
  
  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
//  for (int i=0; i<num; i++) {
//    stroke(255);
//    noFill();
//    ellipse(20 + i*35, scanLine, 5, 5 );
//  }
  
  // draw the sampled pixels as grid
  for (int i=0; i< num; i++) {
    for (int j=0; j< num; j++) {
      noStroke();
      if(i % 2 == 0) {
        fill(pixelColors[i], random(100, 255));
      } else {
        fill(pixelColors2[j], random(100, 255));
      }
      rect(i*35-5, j*(height/num), 35, height/num);
    }
  }
}



