
/*
 * Creative Coding
 * Week 3, 02 - array with sin()
 * by Indae Hwang and Jon McCormack
 * Edited by Animoottori
 * Copyright (c) 2014 Monash University
 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, speed and phase of some oscillating circles.
 * You can change the number of circles by changing the value of num in setup()
 * You can change the background colour by holding the left mouse button and dragging.
 * 
 */

int     num;    // the number of items in the array (# of circles)
int     rad;    // Radius of circle - Added to code
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
int[]   brake;  // distance for stopped circle - Added to code

float red = 120;
float green = 120;
float blue = 120;

void setup() {
  size(500, 500);

  num = 12;
  rad = 36;    // Circle size - Added to code

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  brake = new int[num]; // Offset from original position - Added to code

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(10);
    phase[i] = random(TWO_PI);
    brake[i] = 0; // Offset 0 - Added to code
  }
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    if (speed[i]<0) brake[i]++; // Add offset when speed negative - Added to code
    float x = width/2 + sin(radians((frameCount-brake[i])*abs(speed[i]) ) + phase[i])* 200;
    ellipse(x, y[i], rad, rad);
  }
}


void mouseClicked() {
  for (int u = 0; u < num;u++){
    // Check if mouse pointer hits circle
    if (dist(mouseX,mouseY,width/2 + sin(radians((frameCount-brake[u])*abs(speed[u]) ) + phase[u])* 200,y[u]) <= rad/2) {
      speed[u] *= -1;    // Negate speed to indicate when a circle has been clicked
      break;
    }
  }
}

// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}
