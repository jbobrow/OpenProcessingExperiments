
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

int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] x;      // x-position of each circle
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
float count[];
boolean Moving[];

float red = 120;
float green = 120;
float blue = 120;

int i;
int diam;

void setup() {
  size(500, 500);
  background(red, green, blue);
  frameRate(30);
  diam = 20;

  num = 20;

  // allocate space for each array
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  count = new float[num];
  Moving = new boolean [num];

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(1);
    phase[i] = random(TWO_PI);
    count[i] = 0;
    Moving[i] = true;
  }
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    float x = width/2 + sin(radians(count[i]*speed[i] ) + phase[i])* 200;
    ellipse(x, y[i], diam, diam);


    if (Moving[i] == true) {
      count[i]++;
    }
    if (Moving[i] == false) {
      count[i] = count[i];
    }
  }
} 



// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}

void mousePressed() {

  for (int i=0; i<num; i++) {
  
   // if (dist(mouseX, mouseY, x[i], y[i])<diam/2) {

      Moving[i] =! Moving[i];  
        println (frameCount);
      
   // }
  }
}



