
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
  size(700, 622);
  myImg = loadImage("Spirit_City.jpg");

  pixelColors = new color[20];
  scanLine = 0;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<20; i++) {
    pixelColors[i] = myImg.get(17+i*17, scanLine);
  }

  // draw the sampled pixels as verticle bars
  for (int i=19; i >= 0; i--) {
    noStroke();
    fill(pixelColors[19-i]);
    rect(i*35, 0, 35, 622);
    fill(pixelColors[i]);
    ellipse(width/2, height/2, i*30, i*30);
  }
  
  if(mousePressed)
  {
    image(myImg, 0, 0);
  }
  // draw the image
  //image(myImg, width/2, 0);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }
  
  if(mousePressed)
  {
    // draw circles over where the "scanner" is currently reading pixel values
    for (int i=0; i<20; i++) {
      stroke(255, 0, 0);
      noFill();
      ellipse(35 + i*35, scanLine, 5, 5 );
    }
  }
}



