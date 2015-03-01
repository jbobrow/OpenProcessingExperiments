
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This simple sketch demonstrates how to read pixel values from an image
 * It simulates a 10 pixel "scanner" that moves from the top to the bottom of the image
 * reading the colour values for 10 equally spaced points, then displaying those colours
 * adapted usng W2_05 code
 */

PImage myImg;
color[] pixelColors;
int scanLine;  // vertical position
int frame_rate_value;


void setup() {
  size(500, 500);  


  frame_rate_value = 5;
  frameRate(frame_rate_value);

  myImg = loadImage("nasaImage.jpg");

  pixelColors = new color[10];
  scanLine = 0;
  smooth(4);
}

void draw() {
  background(0);

  int num = 30;
  int margin = -30;
  float gutter = random(10); 
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; 

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
}

void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.get(17+i*35, scanLine);

    // draw the sampled pixels as rectangles  

    noStroke();
    fill(pixelColors[i], 10*i);
    rect(tempX+tempX, tempY, 2*i*i, i);

    scanLine ++;

    if (scanLine > height) {
      scanLine = 0;
    }
  }
}



