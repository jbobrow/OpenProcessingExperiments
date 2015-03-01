
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
 
 // for help, see: http://www.openprocessing.org/sketch/151648

int     num;    // the number of items in the array (# of circles)
float[] x;      
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
boolean[] moving; // whether circle is moving or not
color[] col;  // store colour of cicle

float diam;
float red = 120;
float green = 120;
float blue = 120;

void setup() {
  size(500, 500);

  num = 5;
  diam = 60;

  // allocate space for each array
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num];
  moving = new boolean[num];
  col = new color[num];

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(7);
    phase[i] = random(TWO_PI);
    moving[i] = true;
    col[i] = color(200,0,100);
  }
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    x[i] = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;
    if (dist(mouseX, mouseY, x[i], y[i]) <= diam/2) {
      col[i] = color(255,0,0);
    } else {
      col[i] = color(200,0,100);
    }
    fill(col[i]);
    ellipse(x[i], y[i], diam, diam);
  }
}

void mouseClicked() {
  for (int i=0; i<num; i++) {
    if (dist(mouseX, mouseY, x[i], y[i]) <= diam/2) {
      if (moving[i]) {
        speed[i] = 0;
        moving[i] = false;
        println("A hit!"+" Is it moving? "+moving[i]);
      } else {
        speed[i] = random(7);
        moving[i] = true;
        println("You hit me again so I started moving again? "+ moving[i]);
      }
    }
  }
}

// change the background colour if the mouse is moved
void mouseMoved() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}



