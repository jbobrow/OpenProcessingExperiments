
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

 /* @pjs preload="hedgehog.jpg"; */
PImage myImg;
color[] pixelColors;
int scanLine;  // vertical position

float[] x;
float[] y;      // current drawing position
float[] dx;
float[] dy;    // change in position at each frame
float rad;       // radius for the moving hand
//int num;        // number of spinners

void setup() {
  size(700, 622);
  myImg = loadImage("hedgehog.jpg");
  
 // num = 10;
  x = new float[10];
  y = new float[10];
  dx = new float[10];
  dy = new float[10];

  
    // initial position 
  for(int i=0; i<10; i++){
  x[i] = (250 - i*random(-10,10));
  y[i] = (250 + i*random(-10,10));
  
   // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
  }
  pixelColors = new color[10];
  scanLine = 0;
  smooth(4);
    background(myImg);
}

void draw() {


  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.get(17+i*60, scanLine);
  }

  // draw the sampled pixels as patterns
  for (int i=0; i< 10; i++) {

      rad = radians(frameCount);
    
 // calculate new position
  x[i] += dx[i];
  y[i] += dy[i];

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x[i] > width-100 || x[i] < 100) {
    dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
  }

  if (y[i] > height-100 || y[i] < 100) {
    dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
  }    
    float bx = x[i] + 100 * sin(rad);
  float by = y[i] + 100 * cos(rad);

  noFill();

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);
float h = map(handY, 100, 450, 0, 360);
noStroke();
  fill(pixelColors[i]);
  ellipse(bx, by, handX/3, handY/3);

  }


  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }
  

}



