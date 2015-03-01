
/*
 * Emergence - processing sketch by Martin Herbert 27th June 2014
 *
 * based on ...
 *
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 */
 
 /* @pjs preload="eye.jpg"; */

boolean debug = false;

int numpx_min = 3;
int numpx_max = 8;
PImage myImg;
PImage bgImage;       // display window image
int plopsize = 50;    // diameter of 'pixel' to draw at each position
int dotsize = 25;     // diameter of the dotted line between 'plops'

// Note, arrays for current pixel positions & colours are all temporary as their length will change from one call to draw() to the next
int[] x;
int[] y;
color[] px_col;

void setup() {
  size(800, 800);
  myImg = loadImage("eye.jpg");
  bgImage = createImage(width, height, RGB);
  background(255);
  smooth(4);
  frameRate(5);
}

void draw() {
  
  // Fade it over time
  fill(255, 10);
  noStroke();
  rect(0, 0, width, height);

  // How many pixels to read this time around
  int num_px = (int)random(numpx_min, numpx_max);
  
  // Declare array spaces
  x = new int[num_px];
  y = new int[num_px];
  px_col = new color[num_px];
  
  // for each of num_px pixels, generate a random position and read the color in the image at that position
  for (int i=0; i<num_px; i++) {
    x[i] = (int)random(0, width);
    y[i] = (int)random(0, height);
    px_col[i] = myImg.get(x[i], y[i]);
  }
   
  // Now for each point we stored ...
  for ( int i=0; i<num_px; i++ ) { 
        
    // Draw a line of dots between each point, with lerp'd colour gradient
    for (int j=0; j<num_px; j++ ) {
      if (i!=j) {
        for (int dx=0; dx<(x[j]-x[i]); dx+=dotsize ) {
          int dy = dx*(y[j]-y[i])/(x[j]-x[i]);
          
          if (debug) println("Lerp position: ", dx/(x[j]-x[i]), ", dx: ", dx, ", x[j]: ", x[j], ", x[i]: ", x[i] );
          
          color dot_col = lerpColor(px_col[i], px_col[j], (float)dx/((float)x[j]-(float)x[i]));
          fill(dot_col);
          noStroke();
          ellipse(x[i]+dx, y[i]+dy, dotsize, dotsize);
        }
      }  
    }
    
    // Now draw the pixel positions themselves
    fill(px_col[i]);
    noStroke();
    ellipse(x[i], y[i], plopsize, plopsize);
    
  }
}

