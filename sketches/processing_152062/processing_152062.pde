
/*
 * Creative Coding
 * Week 3, 02 - array with sin()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, xspeed and xphase of some oscillating circles.
 * You can change the number of circles by changing the value of num in setup()
 * You can change the background colour by holding the left mouse button and dragging.
 * You can toggle tracks by pressing the 't' key
 */

int     num;    // the number of items in the array (# of circles)
boolean notrack = true; // toggles tracks or notracks
float[] y;      // y-position of each circle (fixed)
float[] x;      // x-position of each circle
float[] xspeed;  // xspeed of each circle
float[] yspeed;  // yspeed of each circle
float[] xphase;  // xphase of each circle
float[] yphase;  // yphase of each circle
float[] chue;  // hue of each circle

float hue = 50;
float saturation = 255;
float brightness = 255;

float circle_size;

void setup() {
  size(500, 500);
  colorMode(HSB, 255);
  background(hue, saturation, brightness);
  num = 10;
  circle_size = width/2/num;

  // allocate space for each array
  x = new float[num];
  y = new float[num];
  xspeed = new float[num];
  yspeed = new float[num];
  xphase = new float[num];
  yphase = new float[num];
  chue = new float[num];

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    xspeed[i] = random(5);
    yspeed[i] = random(5);
    xphase[i] = random(TWO_PI);
    yphase[i] = random(TWO_PI);
  }
}


void draw() {
  if (notrack)
    background(hue, saturation, brightness);

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the xspeed, xphase and current frame
    if (xspeed[i] > 0)
      x[i] = width/2 + sin(radians(frameCount*xspeed[i] ) + xphase[i])* circle_size * i;
      y[i] = width/2 + cos(radians(frameCount*yspeed[i] ) + yphase[i])* circle_size * i;
      chue[i] = 255 / (i + 1);
    fill(chue[i], 255, 255);
    ellipse(x[i], y[i], circle_size, circle_size);
  }
}


// change the background colour if the mouse is dragged
void mouseDragged() {
  hue = map(mouseX, 0, width, 0, 255);
  saturation = map(mouseY, 0, height, 0, 255);
  brightness = map(mouseX+mouseY, 0, width+height, 255, 0);
}

void mouseClicked() {
  for (int i=0; i<num; i++) {
    if (dist(mouseX, mouseY, x[i], y[i]) <= circle_size/2){
      if (xspeed[i] == 0) {
        xspeed[i] = random(5);
        yspeed[i] = random(5);
      } else {
        xspeed[i] = 0;
        yspeed[i] = 0;
      }
    }
  }
}

void keyReleased() {
  if (key == 't') {
    if (notrack) {
      notrack = false;
    } else {
      notrack = true;
    }
  }
}



