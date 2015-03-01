
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This simple sketch demonstrates how to read pixel values from an image
 * It simulates a 10 pixel "scanner" that moves from the top to the bottom of the image
 * reading the colour values for 10 equally spaced points, then displaying those colours
 * as ellipses moving around the screen.
 *
 */
 /* @pjs preload="flowers.jpg"; */
PImage myImg;
color[] pixelColors;


float[] x;
float[] y;      // current drawing position
float[] dx;
float[] dy;    // change in position at each frame

//int num;        // counter

void setup() {
  size(700, 622);
  myImg = loadImage("flowers.jpg");
  
 // num = 10;
  x = new float[10];
  y = new float[10];
  dx = new float[10];
  dy = new float[10];

  
    // initial position 
  for(int i=0; i<10; i++){
  x[i] = random(700);
  y[i] = 0;
  
   // dx and dy are the small change in position each frame
  dx[i] = random(-0.1, 0.1);
  dy[i] = random(0, 1);
  }
  pixelColors = new color[10];

  smooth(4);
    background(myImg);
}

void draw() {


  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.get((int)x[i], 0);
  }

  // draw the sampled pixels running down the screen
  for (int i=0; i< 10; i++) {

    
 // calculate new position
  x[i] += dx[i];
  y[i] += dy[i];
 


  if (y[i] > height) {
    x[i] = ((i+1)*random(70));
    y[i] = 0;
  }    


//
noStroke();
  fill(pixelColors[i],50);
  ellipse(x[i], y[i], 10, 5);

  }

}



