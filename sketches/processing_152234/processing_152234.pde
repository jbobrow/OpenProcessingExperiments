
/*
 * Creative Coding
 * Week 3, 03 - using sin(), cos(), dist() to make a dynamic pattern 
 * by Indae Hwang and Jon McCormack
 * adapted by Km Vickery
 * Copyright (c) 2014 Monash University
 *
 * This program allows you to change background color.
 * Press and hold the left mouse button to change color.
 * Use presentation mode( sketch menu > Present or press the shift-comand-r keys together)
 * Press "esc" key to stop running the sktech
 * experiment with changing the value of num and distanceMargin in setup
 */

int     num;     // the number of items in the array
float[] x;       // x-position of point
float[] y;       // y-position
float[] speed;   // speed 
float[] phase;   // phase

int distanceMargin;
float rowHeight;

// background colour changes on mouse click
float red;
float green;
float blue;

void setup() {

  size(500, 500);
  background (255); // initial background colour

  // change each value below for different visual
  num = 50;// higher for more items on page
  distanceMargin = 80;// higher for longer run

  rowHeight = height/(num-1); // height of each row

  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 


  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    x[i] = width/2; 
    y[i] = rowHeight * i;
    speed[i] = random(1); // returns a random float bewteen 0 and 1
    phase[i] = random(TWO_PI);
  }

  red = 0;
  blue = 0;
  green = 0;
}


void draw() {

  for (int i=0; i<num; i++) {

    //float radians = radians(frameCount*speed[i] ); // doesn't work in javascript
   float rads = radians(frameCount*speed[i] );

    if (i%2 == 1) { // odd
      x[i] = width/2 + sin(rads + phase[i])* width/2;
    } else { // even
      x[i] = width/2 + cos(rads + phase[i])* width/2;
    }


    if (i<num-1) {
      float distance = dist(x[i], y[i], x[i+1], y[i+1]);
      if (distance > rowHeight && distance < rowHeight + distanceMargin) {
        stroke (255 , random(256));
        fill (random(256), random(128), random(256), random(128,256)) ;
        rect(x[i], y[i], (x[i+1]-x[i]) , (x[i+1]-x[i]));
      }
    }
  }

  if (mousePressed) {
    red = map(mouseX, 0, width, 0, 255);
    green = map(mouseY, 0, height, 0, 255);
    blue = map(mouseX+mouseY, 0, width+height, 255, 0);

    fill(red, green, blue, 10); 
    noStroke();
    rect(0, 0, width, height);
    // println("red: "+red+", green: "+green+", blue: "+blue);
  }
}



