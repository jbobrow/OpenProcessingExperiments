
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
  myImg = loadImage("pedro_moreno_2.jpg");

  pixelColors = new color[10];
  scanLine = 622;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.get(17+i*35, scanLine);
  }

  // draw the sampled pixels as verticle bars
  for (int i=0; i< 10; i++) {
    noStroke();
    fill(pixelColors[i]);
    ellipse(i*35, 0, 35, 622);
    rect(i*35, 0, 8, 622);
  }

  // draw the image
  image(myImg, width/2, 0);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine --;
  }

  if (scanLine > height) {
    scanLine = 0;
  }

  if (scanLine <width/2){
   scanLine= 622;
  } 

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<10; i++) {
    stroke(0, 255, 0);
    strokeWeight(5);
    noFill();
 //   rect(scanLine, width/2 + 17 + i*35, 15, 15 );
    rect(scanLine, scanLine+i*35, 15, 15 );
  }
}



