
/* (my version of it)
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

int num;    // the number of items in the array (# of circles)
int diam = 40;
float maxSpeed = 1.5;
float[] y;      // y-position of each circle (fixed)
float[] x;  
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
boolean[] stopped; //state of each circle: stopped or not?

void setup() {
  size(500, 500);
  colorMode(HSB,255,100,100);
  
  num=20;
  
  // allocate space for each array
  y = new float[num];
  x = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  stopped = new boolean[num];

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(maxSpeed);
    phase[i] = random(TWO_PI);
    stopped[i] = false;
  }
}

void draw() {
  //background(20);
    fill(20,20);
    noStroke();
    rect(0,0,width, height);
     stroke(255);

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    strokeWeight(10);
    float bri = 50;
    if (!stopped[i]) { // only run this if the circle has not been immobilized
      x[i] = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;
      strokeWeight(2);
      bri = 90;
    }
    fill(255/num*i,90,bri);
    ellipse(x[i], y[i], diam, diam);
  }
}

// change the background colour if the mouse is dragged

void mouseClicked() {
  for (int i=0; i<num; i++) {
    if (dist(mouseX, mouseY, x[i], y[i])<diam/2) {
      stopped[i] = !stopped[i]; //switch the state of 'stopped'
      if (stopped[i]) { 
        speed[i]=0.0; //if stopped then make the speed 0
      } else {
        speed[i] = random(maxSpeed);
        phase[i] = random(TWO_PI);
      }
    }
  }
}
