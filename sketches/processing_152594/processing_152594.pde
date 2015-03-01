
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
int  NumberofShapes;
void setup() {
  size(700, 622);
  myImg = loadImage("nasaImage.jpg");

  pixelColors = new color[30];
  scanLine = 0;
  
  NumberofShapes=3;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<30; i++) {
    pixelColors[i] = myImg.get(17+i*35, scanLine);
  }

  // draw the sampled pixels as verticle bars
  for (int i=0; i< 10; i++) {
    noStroke();
    //background(random(0,255));
    fill(pixelColors[i],random(0,255));
    
    for (int z=0; z< NumberofShapes;z++){
      switch (z){
      case 1:
        rect(i*random(1,700), random(1,300), random(1,400),random(1,600));
      noSmooth();
      
      case 2:
        ellipse(i*random(1,700), random(1,600), random(1,400), random(1,600));
      smooth(4);
      
      case 3:
      noSmooth();
      arc(i*random(1,700), random(1,650), random(1,400), random(1,600), 0, HALF_PI);
      
      }   
    
    }
    
    
  }

  // draw the image
 // image(myImg, width/random(1,4), 0);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
 // for (int i=0; i<10; i++) {
   // stroke(255, 0, 0);
   // noFill();
   // ellipse(width/2 + 17 + i*35, scanLine, 5, 5 );
 // }
}

