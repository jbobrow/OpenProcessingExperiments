
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
int scanDirection; // this is the variable that decides which way the scanLine moves

int numberOfScanPoints; // ****** this is the variable that store the number of scan points you wish to use
float pos; // ****** this will be used to calculate the positions of the scan points
float rect_width; // ****** this will be used to calculate the position and size of the rectangles

void setup() {
  size(700, 622);
  myImg = loadImage("nasaImage.jpg");

  numberOfScanPoints = 10; // ****** change this to any number of scan points you want

  pixelColors = new color[numberOfScanPoints];
  pixelColors2 = new color[numberOfScanPoints];
  scanLine = 0;
  scanDirection = 1; // 1 will make the scanLine go down, -1 will make it go up
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  // ****** Here I merged your two for() loops into one
  for (int i=0; i<numberOfScanPoints; i++) { // ****** only goes as far as the number you choose
    // ****** I added the following line to calculate the position of the scanPoints
    pos = (float) map(i, 0, numberOfScanPoints, 0, width/2) + ((width/2)/(numberOfScanPoints*2));
    pixelColors[i] = myImg.get((int)pos, scanLine); // ****** changed to 'pos'
    pixelColors2[i] = myImg.get((int)pos, scanLine+30); // ****** changed to 'pos'
  }

  // draw the sampled pixels as verticle bars
  // ****** Here I merged your two for() loops into one
  for (int i=0; i<numberOfScanPoints; i++) { // ****** only goes as far as the number you choose
    // ****** I added the following lines to calculate the position and size of the rectangles
    rect_width = map(1, 0, numberOfScanPoints, 0, width/2);
    noStroke();
    fill(pixelColors[i]);
    rect(rect_width*i, 0, rect_width+.5, 311); // ****** changed to 'rect_width'
    fill(pixelColors2[i]);
    rect(rect_width*i, 311, rect_width+.5, 311);  // ****** changed to 'rect_width'
  }

  // draw the image
  image(myImg, width/2, 0);

  // increment scan line position EVERY frame
  // scanning every second frame causes the change of direction to fail
  scanLine += scanDirection; // instead of always increasing by one we now add the scanDirection value

  // This 'if' command checks to see if the scanLine
  // has reached the top or the bottom of the screen 
  // I used 'height-32' because you are checking
  // using pixelColor2 30 pixels below scanLine
  if (scanLine > height-32 || scanLine < 1) { 
    //scanLine = 0; // no longer required so it has been commented out
    scanDirection = -scanDirection; // turns 1 into -1 OR -1 into 1
  }

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<numberOfScanPoints; i++) { // ****** only goes as far as the number you choose
    stroke(255, 0, 0);
    noFill();
    // ****** I added the following line to calculate the position of the scanPoints
    pos = (float) map(i, 0, numberOfScanPoints, 0, width/2) + ((width/2)/(numberOfScanPoints*2)) + width/2;

    ellipse((int) pos, scanLine, 5, 5 ); // ****** changed to 'pos'
    ellipse((int) pos, scanLine+30, 5, 5 ); // ****** changed to 'pos'
  }
}

