
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
float[] divisor; // radius of the orbit for each circle

float distanceMargin;
float rowHeight;

// background colour
float red;
float green;
float blue;
float drag;


void setup() {

  //Fullscreen: to make fullscreen run this sketch with presentation mode ( sketch menu > Present )
  size(800, 800);

  drag = 1;

  // change each value below for different visual
  num = 25;
  distanceMargin = 200;


  rowHeight = height/(num-1); // height of each row

  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  divisor = new float[num];


  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    x[i] = width/2; 
    y[i] = width/2;
    speed[i] = random(0.2,2); // returns a random float bewteen 0 and 1
    phase[i] = random(TWO_PI);
    divisor[i] = random(0.5, 10);
  }

  red = 0;
  blue = 0;
  green = 0;
  
  background(255);
}


void draw() {
  // don't clear the screen each frame by calling background()
  //background(128);

  //fill(255);

  for (int i=0; i<num; i++) {

    // populate x values
    float rads = radians(frameCount*speed[i] );

    if (i%2 == 1) { // odd
      x[i] = width/2 + sin(rads + phase[i])* width/divisor[i];
    } else { // even
      x[i] = width/2 + cos(rads + phase[i])* width/divisor[i];
    }

    //populate y values
    float rads2 = radians(frameCount*speed[i] );

    if (i%2 == 1) { // odd
      y[i] = width/2 + cos(rads + phase[i])* width/divisor[i];
    } else { // even
      y[i] = width/2 + sin(rads + phase[i])* width/divisor[i];
    }

    fill(0);
    ellipse(x[i],y[i],1,1);

    if (i<num-1) {
      float distance = dist(x[i], y[i], x[i+1], y[i+1]);
      if (distance > rowHeight && distance < rowHeight + distanceMargin) {

        stroke(0, 20);
        line(x[i], y[i], x[i+1], y[i+1]);

        //stroke(255);
        point(x[i], y[i]);
        point(x[i+1], y[i+1]);
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
    // println("red: "+red+", green: "+green+", blue: "+blue);
  }
}

// Randomise drawing parameters
void randomise() {
  for (int i=0; i<num; i++) {
    divisor[i] = random(2, 10);
    speed[i] = random(0.2,2);
  }
  
  distanceMargin = random(50,300);
}

void keyReleased() {
  switch (key) {
  case 'c':
    clear();
    background(255);
    break;
  case 's':
    saveFrame("calligraphic" + frameCount + ".png");
    println("Image Saved.");
    break;
  case 'r':
    randomise(); // put each circle on a new orbit
    break;
  }

  if (keyCode == UP) {
    if (drag < 0.9) {
      drag += 0.05;
      println ("Pen drag = " + drag);
    }
  }
  if (keyCode == DOWN) {
    if (drag > 0.05) {
      drag -= 0.05;
      println ("Pen drag = " + drag);
    }
  }
}

