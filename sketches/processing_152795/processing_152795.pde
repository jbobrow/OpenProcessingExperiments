
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
  myImg = loadImage("image_2289.png");

  pixelColors = new color[50];
  scanLine = 0;
  smooth(4);
}

void draw() {
  //background(0);

  // read the colours for the current scanLine
  for (int i=0; i<50; i++) {
    pixelColors[i] = myImg.get(3+i*7, scanLine);
  }

  // draw the sampled pixels as verticle bars
  for (int i=0; i< 50; i++) {
    noStroke();
    fill(pixelColors[i]);
    rect(i*7, scanLine, 7, 5);
  }

  // draw the image
  image(myImg, width/2, 0);

  // increment scan line position every second frame
  if (frameCount % 1 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<50; i++) {
    stroke(255, 0, 0);
    noFill();
    ellipse(width/2 + 3 + i*7, scanLine, 5, 5 );
  }
  if (keyPressed) {
    if (key == '1') {
      myImg = loadImage("nasaImage.jpg");
    } else if (key == '2') {
      myImg = loadImage("melbourneCity.jpg");
    } else{
      myImg = loadImage("image_2289.png");
    }
  }
}



