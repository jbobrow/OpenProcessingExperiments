
/* @pjs crisp=true; 
 pauseOnBlur=true; 
 */

/*
 * Creative Coding
 * Week 3, 03 - using sin(), cos(), dist() to make a dynamic pattern 
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program allows you to change background color.
 * Press and hold the left mouse button to change color.
 * Use presentation mode( sketch menu > Present or press the shift-comand-r keys together)
 * Press "esc" key to stop running the sktech
 * experiment with changing the value of num and distanceMargin in setup
 */

int num;     // the number of items in the array
float[] x;       // x-position of point
float[] y;       // y-position
float[] speed;   // speed 
float[] phase;   // phase

int distanceMargin;
float rowHeight;

// background colour
float red;
float green;
float blue;

int thickness;
boolean expanding;


void setup() {

  //Fullscreen: to make fullscreen run this sketch with presentation mode ( sketch menu > Present )
  //size(displayWidth, displayHeight);

  //Not fullscreen: fixed window 
  size(700, 700);
  // change each value below for different visual
  num = 10;
  distanceMargin = 100;
  rowHeight = 700/(num-1); // height of each row

  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 


  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    x[i] = 698/2; 
    y[i] = rowHeight * i;
    speed[i] = random(2); // returns a random float bewteen 0 and 1
    phase[i] = random(TWO_PI);
  }

  red = 0;
  green = 0;
  blue = 255;
  thickness = 1;
  expanding = true;
  stroke(10, 50);
}


void draw() {
  // don't clear the screen each frame by calling background()
  //background(128);

  fill(red, green, blue, 100);

  for (int i=0; i<num; i++) {

    float angleradians = radians(frameCount*speed[i] );

    if (i%2 == 1) { // odd
      x[i] = 699/2 + cos(angleradians + phase[i])* 700/2;
    } else { // even
      x[i] = 699/2 + sin(angleradians + phase[i])* 700/2;
    }


    if (i<num-2) {
      float distance = dist(x[i], y[i], x[i+2], y[i+2]);
      if (distance > rowHeight*2 && distance < rowHeight*2 + distanceMargin) {

        //stroke(red, green, blue, 100);
        strokeWeight(thickness);
        triangle(x[i], y[i], x[i+2], y[i+2], x[i+1], y[i+1]);
        if (red < 255) {
          red++;
          green = random(0, 127);
          blue--;} 
        else {
          red=0;
          green= random(0, 255);
          blue=255;
        }

        if (expanding && thickness < 3) {
          thickness++;
        } else if (thickness == 0) {
          thickness++;
          expanding = true;
        } else {
          thickness--;
          expanding = false;
        }
        //     stroke(255);
        //     point(x[i], y[i]);
        //     point(x[i+1], y[i+1]);
      }
    }
  }

  //  if (mousePressed) {
  //    red = map(mouseX, 0, width, 0, 255);
  //    green = map(mouseY, 0, height, 0, 255);
  //    blue = map(mouseX+mouseY, 0, width+height, 255, 0);
  //
  //    fill(red, green, blue, 10);
  //    noStroke();
  //    rect(0, 0, width, height);
  //    // println("red: "+red+", green: "+green+", blue: "+blue);
  //  }
}



