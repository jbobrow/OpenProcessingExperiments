
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
float[] yArray;      // y-position of each circle (fixed)
float[] xArray;      // y-position of each circle (fixed)
int[] running;
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
float centerX;
float centerY;
float ballDiameter;
int backgroundColor;

void setup() {
  size(800, 800);
  smooth();
  stroke(255);
  strokeWeight(2);
  num = 12;
  ballDiameter=60;
  backgroundColor=0xFF5500EE;
  // allocate space for each array
  xArray = new float[num];
  yArray = new float[num];
  running=new int[num];
  speed = new float[num];
  phase = new float[num]; 
  centerX=width/2;
  centerY=height/2;

  // calculate the gap in y based on the number of circles
  float gap = (height-2*ballDiameter) / (num +1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    running[i]=0;
    yArray[i] = ballDiameter+gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(-3, 3);
    phase[i] = random(TWO_PI);
  }
}


void draw() {
  background(backgroundColor);

  for (int i=0; i<num; i++) {
    //centerY=yArray[i];
    // calculate the x-position of each ball based on the speed, phase and current frame
    float xVirt,yVirt;
    switch (running[i]) {
      case 0:
      xArray[i] =centerX+ sin(radians(frameCount*speed[i] + phase[i]))*(centerX-ballDiameter);
      fill(defineColor(xArray[i], yArray[i]));
      break;
      case 1:
      xVirt =centerX+ sin(radians(frameCount*10 + phase[i]))*(centerX-ballDiameter);
      fill(defineColor(xVirt, yArray[i]));
      break;
      case 2:
      yArray[i] =centerY+sin(radians(frameCount*speed[i] + phase[i]))* (centerY-ballDiameter);
      fill(defineColor(xArray[i], yArray[i]));
      break;
      case 3:
      yVirt =centerY+ sin(radians(frameCount*10 + phase[i]))*(centerY-ballDiameter);
      fill(defineColor(xArray[i], yVirt));
      break;
    }
    ellipse(xArray[i], yArray[i], ballDiameter, ballDiameter);
  }
}


void mousePressed() {

  for (int i=0; i<num; i++) {
    if (dist(xArray[i], yArray[i], mouseX, mouseY)<ballDiameter/2) {
      running[i]++;
      running[i]=running[i]%4;   
      speed[i] = random(-3, 3);     
      if (running[i]==0) {      
        phase[i]=degrees(asin((xArray[i]-centerX)/(centerX-ballDiameter)))-frameCount*speed[i];
      } else if(running[i]==2) {      
        phase[i]=degrees(asin((yArray[i]-centerY)/(centerY-ballDiameter)))-frameCount*speed[i];
      }
    }
  }
}
int defineColor(float xc, float yc) {
  float red = map(xc, 0, width, 0, 255);
  float green = map(yc, 0, height, 0, 255);
  float blue = map(xc+yc, 0, width+height, 255, 0);
  return color(red, green, blue);
}



