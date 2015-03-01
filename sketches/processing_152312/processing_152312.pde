
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
float circleW;  // circle width
float [] x;     // x value for each circle
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle is constant difference between circle positions
float distance;  // distance between the two checked points
float oscillationW; // width of the x direction oscillation i.e. how much of the window to whiz through

void setup() {
  size(500, 500);
  num = 7;
  circleW = 20;
  // allocate space for each array
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  oscillationW = 200;
  // calculate the gap in y using height divided by the number of circles 
  float gap = height / (num + 1);
  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each ball so can be calculated once
    speed[i] = random(5);
    phase[i] = 0;//random(TWO_PI); // only effects the starting position
  }
}
void draw() {
  background(100);
  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    // so when you reduce speed to zero all you have left is zero times a number
    // so you're left with width/2 ie. the middle of the sketch
    // so the sin is a value between one, zero and -one times a number to make it bigger
    // the number is now oscillation, it's the width of the circle oscillation
    // multiplied by the -1 to 1 range.
    x[i] = width/2 + sin (radians(frameCount*speed[i]) + phase[i]) * oscillationW;
    //println("frameCount " + frameCount);
    //println(speed[i]);
    //println("the x is " + sin(radians(frameCount*speed[i]+100)));
    // I just want to looks at one instance of a circle
    println("the x[5] is " + sin(radians(frameCount*speed[5]) + phase[5]) * 200);
    ellipse(x[i], y[i], circleW, circleW);
  }
}

void mousePressed() {
  for (int i=0; i<num; i++) {
    //distance = dist(mouseX, mouseY, x[i],y[i]);
    if (dist(mouseX, mouseY, x[i],y[i]) < circleW/2) {
      if (speed[i] == 0) {
        speed[i] = random(10);
      } else {
        speed[i] = 0;
      }
    }
  }
}





