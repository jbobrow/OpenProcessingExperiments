
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

int distanceMargin;
float rowHeight;

// background colour
float red;
float green;
float blue;


void setup() {

  //Fullscreen: to make fullscreen run this sketch with presentation mode ( sketch menu > Present )
  // size(displayWidth, displayHeight);

  //Not fullscreen: fixed window 
  size(500, 500);


  // change each value below for different visual
  num = 15;
  distanceMargin = 150;

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
  
  strokeWeight(1);
  background(128);

  red = 128;
  blue = 128;
  green = 128;
}


void draw() {
  // don't clear the screen each frame by calling background()
  // background(128);
  
//  fill(255);

  for (int i=0; i<num; i++) {

    float instantRadians = radians(frameCount*speed[i] );

    if (i%2 == 1) { // odd
      x[i] = width/2 + sin(instantRadians + phase[i])* width/2;
    }
    else { // even
      x[i] = width/2 + cos(instantRadians + phase[i])* width/2;
    }


    if (i<num-1) {
      float distance = dist(x[i], y[i], x[i+1], y[i+1]);
      float allRows = rowHeight;
      if (distance > allRows && distance < allRows + distanceMargin) {

        stroke(255*(distance-allRows)/(distanceMargin-allRows), 20);
        line(x[i], y[i], x[i+1], y[i+1]);

        // stroke(255);
        point(x[i], y[i]);
        point(x[i+1], y[i+1]);
      }
    }
    if (i<num-2) {
      float distance = dist(x[i], y[i], x[i+2], y[i+2]);
      float allRows = rowHeight * 2;
      if (distance > allRows && distance < allRows + distanceMargin) {

        stroke(255*(distance-allRows)/(distanceMargin-allRows), 20);
        line(x[i], y[i], x[i+2], y[i+2]);

        // stroke(255);
        point(x[i], y[i]);
        point(x[i+2], y[i+2]);
      }
    }
    if (i<num-3) {
      float distance = dist(x[i], y[i], x[i+3], y[i+3]);
      float allRows = rowHeight * 3;
      if (distance > allRows && distance < allRows + distanceMargin) {

        stroke(255*(distance-allRows)/(distanceMargin-allRows), 20);
        line(x[i], y[i], x[i+3], y[i+3]);

        // stroke(255);
        point(x[i], y[i]);
        point(x[i+3], y[i+3]);
      }
    }
    if (i<num-4) {
      float distance = dist(x[i], y[i], x[i+4], y[i+4]);
      float allRows = rowHeight * 4;
      if (distance > allRows && distance < allRows + distanceMargin) {

        stroke(255*(distance-allRows)/(distanceMargin-allRows), 20);
        line(x[i], y[i], x[i+4], y[i+4]);

        // stroke(255);
        point(x[i], y[i]);
        point(x[i+4], y[i+4]);
      }
    }
    if (i<num-5) {
      float distance = dist(x[i], y[i], x[i+5], y[i+5]);
      float allRows = rowHeight * 5;
      if (distance > allRows && distance < allRows + distanceMargin) {

        stroke(255*(distance-allRows)/(distanceMargin-allRows), 20);
        line(x[i], y[i], x[i+5], y[i+5]);

        // stroke(255);
        point(x[i], y[i]);
        point(x[i+5], y[i+5]);
      }
    }
    if (i<num-6) {
      float distance = dist(x[i], y[i], x[i+6], y[i+6]);
      float allRows = rowHeight * 6;
      if (distance > allRows && distance < allRows + distanceMargin) {

        stroke(255*(distance-allRows)/(distanceMargin-allRows), 20);
        line(x[i], y[i], x[i+6], y[i+6]);

        // stroke(255);
        point(x[i], y[i]);
        point(x[i+6], y[i+6]);
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
    println("red: "+red+", green: "+green+", blue: "+blue);
  }
}

void keyPressed() {
  // right arrow -- increase distanceMargin
  if (keyCode == RIGHT && distanceMargin < width/2) {
    fill(red, green, blue, 10);
    noStroke();
    rect(0, 0, width, height);
    distanceMargin++;
  }

  // left arrow -- decrease distanceMargin
  if ( keyCode == LEFT && distanceMargin > 10) {
    fill(red, green, blue, 10);
    noStroke();
    rect(0, 0, width, height);
    distanceMargin--;
  }
}

void keyReleased() {
  // s -- Save to file
  if (key == 's') {
    saveFrame("YourName.jpg");
  }
}



