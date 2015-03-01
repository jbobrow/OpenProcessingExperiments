
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
int    dist;
int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 120;
float green = 120;
float blue = 120;
int radius = 10;
//float dist = 0;
//float x = 0;

void setup() {
  
  size(500, 500);

  num = 20;

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(10);
    phase[i] = random(TWO_PI);
    // println(speed);
    // println(phase);
    
  }
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    float sinval = sin(radians(frameCount*speed[i]))* 50;
    //float xoffset = sinval;
    float x = width/2 + sinval;
    float dist = dist(mouseX, mouseY, x, y[i]);
    if (dist <= radius*2) {
      x = mouseX;
    }
    ellipse(x, y[i], radius*2, radius*2);
  }
  line(width/2, 0, width/2, height);
}

void mouseClicked() {
  
  for (int i=0; i<num; i++) {
    float x = width/2 + sin(radians(frameCount*speed[i]))* 50;
    float dist = dist(mouseX, mouseY, x, y[i]);
    if (dist <= radius*2) {
      speed[i] = 0;
      x = mouseX;
    } else {
      speed[i]= random(10);;
    }
    ellipse(x, y[i], radius*2, radius*2);
  }
}

// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}

