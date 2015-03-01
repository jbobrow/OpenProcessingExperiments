
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
int sampleAmount = 360;
int scanLine;  // vertical position
color[] colorsample; 
void setup() {
  size(700, 622);
  myImg = loadImage("nasaImage.jpg");

  pixelColors = new color[sampleAmount];
  colorsample = new color[sampleAmount];
  scanLine = 0;
  smooth(4);
}

void draw() {
  background(0);
  int colWidth = int(width/sampleAmount);
  println("colWidth es "+ colWidth);
  // read the colours for the current scanLine
  for (int i=0; i<sampleAmount; i++) {
    pixelColors[i] = myImg.get((colWidth/2)+i*colWidth, scanLine);
    colorsample[i] = myImg.get((colWidth/2)+i*colWidth, scanLine);
    //println(colorsample[i]);
  }

  // draw the sampled pixels as verticle bars
  for (int i=0; i<sampleAmount; i++) {
    noStroke();
    
    float bright = brightness(colorsample[i]);
    float sat = saturation(colorsample[i]);
    float hueValue = hue(colorsample[i]);
    float compHue;
    if (hueValue >= 180 && hueValue < 360) {
      compHue=hueValue-180;
    }
    else 
    compHue=hueValue+180;
    
    println("brightness is "+bright);
    
   
    fill(compHue, bright, sat);
    rect(i*colWidth, 0, colWidth, height);
    fill(colorsample[i]);
    rect(i*colWidth, map(bright,0,360,0,height), colWidth, map(sat,0,360,0,height));
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
  for (int i=0; i<sampleAmount; i++) {
    fill(255);
    noStroke();
    ellipse(width/2 + (colWidth/2) + (i*colWidth), scanLine, 2, 2 );
  }
}


