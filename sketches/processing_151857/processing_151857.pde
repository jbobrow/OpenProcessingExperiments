
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
float circleSize = 20; //ellipse size
float[] x;      // x-position of each circle (fixed)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
Boolean[] stopped;  // phase of each circle

// for ellipse fills - to change based on distance
float red = 120; 
float green = 120;
float blue = 120;

// for rotating background
float bgRed = 120;
float bgGreen = 120;
float bgBlue = 120;

void setup() {
  size(500, 500);
  frameRate(20);
  noStroke();
  num = 20;
  // allocate space for each array
  y = new float[num];
  x = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  stopped = new Boolean[num]; 

  // calculate the gap in y based on the number of circles
  float gap = circleSize/2+(height / (num + 1));

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(4);
    phase[i] = random(TWO_PI);
    stopped[i] = false;
  }
}

void draw() {
  background(200, bgGreen, bgBlue);

  for (int i=0; i<num; i++) {
    // color based on distance from mouse
    red = map(dist(mouseX, mouseY, x[i], y[i]), 0, width, 40, 100);
    green = map(dist(mouseX, mouseY, x[i], y[i]), 0, width, 40, 100);
    blue = map(dist(mouseX, mouseY, x[i], y[i]), 0, width, 40, 255);
    // calculate the x-position of each ball based on the speed, phase and current frame
    // borrowed the stop function from Jerome - thanks Jerome
    if (!stopped[i]) {
      x[i] = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 220;
      fill(red, green, blue);
    } 
    else {
      fill(255);
    }
    ellipse(x[i], y[i], 40, 40);
  }
  // background color
  bgRed = map(mouseX, 0, width, 0, 100);
  bgGreen = map(mouseY, 0, height, 0, 100);
  bgBlue = map(mouseX+mouseY, 0, width+height, 100, 0);
  
   if (keyPressed == true && key == 's') {
    saveFrame("yourName.jpg");
  }
}

void mouseClicked() {
  for (int i=0; i<num; i++) {
    if (dist(mouseX, mouseY, x[i], y[i]) < circleSize/2 && !stopped[i]) {
      stopped[i] = true;
      speed[i] = 0;
    } 
    else if (dist(mouseX, mouseY, x[i], y[i]) < circleSize/2 && stopped[i]) {
      speed[i] = random(4);
      stopped[i] = false;
    }
  }
}



