
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

int     num;         // the number of items in the array (# of circles)

boolean clickInside; // I ADDED THIS flag to choose whether you have to click inside circle to stop it or not

float[] x;           // I ADDED THIS to store the x-position of each circle
float[] y;           // y-position of each circle (fixed)
float[] speed;       // speed of each circle
float[] phase;       // phase of each circle

float red = 120;
float green = 120;
float blue = 120;

int ellipseDiameter = 20;  // I ADDED THIS to enable you to change the size of the balls

void setup() {
  size(500, 500);

  num = 20; // I CHANGED THIS

  // I ADDED THE FOLLOWING LINE
  // Set to false so that user can click anywhere near the circle y-position to stop and start the motion
  clickInside = false;

  // allocate space for each array
  x = new float[num]; // <<<< I ADDED THIS
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = map(y[i], 0, height, 1, 3); // random(10); // <<<< I CHANGED THIS to set speed based on y-position
    phase[i] = 1; // random(TWO_PI); // <<<< I CHANGED THIS
  }
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    if (speed[i] > 0) { // <<<< I ADDED THIS to only change x[i] when circle is in motion
      x[i] = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;
    } // end if

    // I ADDED THIS to show which circle would be stopped on mouse click by colouring it black
    if ( mouseY > y[i]-(ellipseDiameter/2) && mouseY < y[i]+(ellipseDiameter/2) ) {
      fill(0);
    } else {
      fill(255);
    }


    ellipse(x[i], y[i], ellipseDiameter, ellipseDiameter);

    line ( 0, mouseY, width, mouseY ); // I ADDED THIS to draw horizontal line through mouse pointer
    line ( mouseX, 0, mouseX, height ); // I ADDED THIS to draw vertical line through mouse pointer
  }

  // I ADDED THIS to display whether you have to click
  // inside the circle or anywhere near y[i]
  fill(255);
  if (clickInside) {
    text("Click inside the circle [press 'y' to change]", 0,10);
  } else {
    text("Click when circle is black [press 'y' to change]", 0, 10);
  } // inf if (clickInside)
}


// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}

// I ADDED THIS function below to stop and start the circles
void mouseClicked() {
  for (int i=0; i<num; i++) {

    if (clickInside) { // if you have selected to click the circle do the following
      // stop circle if mouse pointer is inside circle as per exercise requirements
      if ( dist(mouseX, mouseY, x[i], y[i]) < ellipseDiameter ) {
        if (speed[i] == 0) {
          speed[i] = map(y[i], 0, height, 1, 3); // set speed based on y-position to restart circle movement
        } else {
          speed[i] = 0; // set speed to zero to stop ball
        } // end if speed[]
      } // end if dist()
    } else {  // if you have selected to click near y[i] do the following
      // stop circle if mouseY is near y[i]
      if ( mouseY > y[i] - (ellipseDiameter/2) && mouseY < y[i] + (ellipseDiameter/2) ) {
        if (speed[i] == 0) {
          speed[i] = map(y[i], 0, height, 1, 3); // set speed based on y-position to restart circle movement
        } else {
          speed[i] = 0; // set speed to zero to stop ball
        } // end if speed[]
      } // end if mouseY
    } // end for (i)
  }
}

// I added the function below to switch between having
// to click inside the circle or if mouseY is near y[i]
void keyPressed() {
  if ( key == 'y') {
    if (clickInside == false) {
      clickInside = true;
    } else {
      clickInside = false;
    } // end if clickInside
  } // end if key
} // end keyPressed()

