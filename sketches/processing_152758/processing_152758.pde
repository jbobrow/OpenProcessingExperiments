
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
int scanDirection; // ****** this is the variable that decides which way the scanLine moves

void setup() {
  size(700, 622);
  myImg = loadImage("nasaImage.jpg");

  pixelColors = new color[50];
  pixelColors2 = new color[50];
  scanLine = 0;
  scanDirection = 1; // ****** 1 will make the scanLine go down, -1 will make it go up
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

  // ****** increment scan line position EVERY frame
  // ****** scanning every second frame causes the change of direction to fail
  scanLine += scanDirection; // ****** instead of always increasing by one we now add the scanDirection value

  // ****** This 'if' command checks to see if the scanLine
  // ****** has reached the top or the bottom of the screen 
  // ****** I used 'height-32' because you are checking
  // ****** using pixelColor2 30 pixels below scanLine
  if (scanLine > height-32 || scanLine < 1) { 
    //scanLine = 0; // ****** no longer required so it has been commented out
    scanDirection = -scanDirection; // ***** turns 1 into -1 OR -1 into 1
  }

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<50; i++) {
    stroke(255, 0, 0);
    noFill();
    ellipse(width/2 + 17 + i*15, scanLine, 5, 5 );
    ellipse(width/2 + 17 + i*15, scanLine+30, 5, 5 );
  }
}

