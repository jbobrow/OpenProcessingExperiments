
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 * Modified by Lewis 
 *
 * This simple sketch demonstrates how to read pixel values from an image
 * It simulates a 50 pixel "scanner" that moves from the top to the bottom of the image
 * reading the colour values for 50 equally spaced points, then displaying those colours
 * as vertical bars on the left half of the screen.
 *
 */

PImage myImg;
color[] pixelColors;
color[] pixelColors2;
int scanLine;  // vertical position

void setup() {
  size(700, 622);
  myImg = loadImage("nasaImage.jpg");

  pixelColors = new color[50];
   pixelColors2 = new color[50];
   scanLine = 0;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<50; i++) {
    pixelColors[i] = myImg.get(17+i*6, scanLine);
  }
  
  for (int i=0; i<50; i++) {
    pixelColors2[i] = myImg.get(17+i*6, scanLine+30);
  }

  // draw the sampled pixels as verticle bars
  for (int i=0; i< 50; i++) {
    noStroke();
    fill(pixelColors[i]);
    rect(i*6, 0, 130, 311);
  }
  
  for (int i=0; i< 50; i++) {
    noStroke();
    fill(pixelColors2[i]);
    rect(i*6, 311, 130, 311);
  }

  // draw the image
  image(myImg, width/2, 0);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<50; i++) {
    stroke(255, 0, 0);
    noFill();
    ellipse(width/2 + 17 + i*15, scanLine, 5, 5 );
    ellipse(width/2 + 17 + i*15, scanLine+30, 5, 5 );
  }
}



