
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
float[] y;// y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 100;
float green = 150;
float blue = 120;
float dist;


void setup() {
  size(600, 600);
  frameRate(20);

  num = 100;

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height /  num  ;

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once   
    speed[i] = random(10);
    phase[i] = random(TWO_PI*5);
  }
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<num; i++) {

    // calculate the x-position of each ball based on the speed, phase and current frame
    float x = width/2 + sin(radians(frameCount*speed[i] )+ phase[i])* 35 ;
    float x1 = width/2 - sin(radians(frameCount*speed[i] ) + phase[i])* 400;
      
    stroke( green, blue,red ,100);
    strokeWeight(0.3);
    fill(green,blue,red,150);
    line(x,y[i],x1,y[i]+30);
    ellipse(x, y[i], 15, 15);   
    ellipse(x1,y[i]+30,5,5);   
    


  }
}


// change the background colour if the mouse is dragged

void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}
