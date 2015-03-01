
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

int     num;     // the number of items in the array
float[] x;       // x-position of point
float[] y;       // y-position
float[] speed;   // speed 
float[] phase;   // phase
float[] r;       // radius

int distanceMargin;
float distancePower;
float rStep;

// background colour
float red;
float green;
float blue;


void setup() {

  size(500, 500);


  // change each value below for different visual
  num = 10;
  distanceMargin = 5;
  distancePower = 0.5;

  rStep = height*sqrt(2)/(2*(num)); // height of each row

  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  r = new float[num];
  speed = new float[num];
  phase = new float[num]; 


  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    x[i] = width/2; 
    r[i] = rStep * (i+0.5);
    y[i] = height/2 + r[i];
    speed[i] = random(1)*6; 
    phase[i] = random(TWO_PI);
  }

  red = 166;
  green = 218;
  blue = 61;
  background(red, green, blue);
  
  ellipseMode(CORNERS);
}


void draw() {
  
  fill(255);

  for (int i=0; i<num; i++) {

    float rradians = radians(frameCount*speed[i] );

    if (i%2 == 1) { // odd
      x[i] = width/2 + cos(rradians + phase[i]) * r[i];
      y[i] = height/2 + sin(rradians + phase[i]) * r[i];
    }
    else { // even
      x[i] = width/2 + cos(rradians + phase[i]) * r[i];
      y[i] = height/2 - sin(rradians + phase[i]) * r[i];
    }

    if (i<num-1) {
      float distance = dist(x[i], y[i], x[i+1], y[i+1]);
      if (distance > rStep && 
          distance < rStep + distanceMargin * pow(r[i], distancePower)) {

        stroke(0, 2*pow(i+1,1.1));
        noFill();
        ellipse(x[i], y[i], x[i+1], y[i+1]);

      }
      
      
//      // Show points
//      noFill();
//      
//      stroke(red, green, blue);
//      strokeWeight(3);
//      ellipse(width/2, height/2, r[i], r[i]); 
//      stroke(255);
//      strokeWeight(1);
//      point(x[i], y[i]);
//
//      stroke(red, green, blue);
//      strokeWeight(3);
//      ellipse(width/2, height/2, r[i+1], r[i+1]); 
//      stroke(255);
//      strokeWeight(1);
//      point(x[i+1], y[i+1]);

    }
    
    
  }
  
  if (mousePressed) {
    
    background(red, green, blue);
    distancePower = map (mouseY, height, 0, 0.2, 0.6);
    for (int i=0; i<num; i++) {
      speed[i] = random(1)*6; 
      phase[i] = random(TWO_PI);
    }

    println(distancePower);
  }
}

