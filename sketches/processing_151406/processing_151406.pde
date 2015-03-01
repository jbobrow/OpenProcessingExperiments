
/*
 * Creative Coding
 * Week 3, 02 - array with sin()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, speed and phase of some oscillating circles.
 * You can change the number of circles by changing the value of num in setup()
 * You can change the background colour by holding the left mouse button and dragging.
 * 
 */

int     num;     // the number of items in the array (# of circles)
float diameter;
float[] x;      // x-position of each circle (variable)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] lastSpeed;
float[] phase;  // phase of each circle
boolean[] stop; // is stop true or false

float red = 120;
float green = 120;
float blue = 120;

void setup() {
  size(500, 500);

  num = 20;
  diameter = 50;

  // allocate space for each array
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  lastSpeed = new float[num];
  phase = new float[num]; 
  stop = new boolean[num];

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(3); 
    phase[i] = random(TWO_PI);
    stop[i] = false;
  }
  // copy speed[] into lastSpeed[]
  arrayCopy(speed, lastSpeed);
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    if (!stop[i]) {    //if circle is not stop then assign x[i]
      x[i] = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;
    }
    fill(255,255,255);
    ellipse(x[i], y[i], diameter, diameter);
  }
}


// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}

// stop circle on mouseClicked()
void mouseClicked() {
  for (int i=0; i<num; i++) {
    if (dist(mouseX, mouseY, x[i], y[i]) < diameter/2) {  //mouse has clicke on a circle
      stop[i] = !stop[i];  // swap stop state
      if (stop[i]) {  // make sure circle stop is true
        speed[i] = 0;  // set speed to zero
      } else {
        speed[i] = lastSpeed[i];
        }
    }
  }
}



