
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */
int num = 20;
float ballsize = 20;
float[] x, y;      // current drawing position
float[] dx, dy;    // change in position at each frame
float[] handX, handY;
float[] rad;       // radius for the moving hand
float[] hue;
float max = 1;
float min = 0.5;
color bg;
color blendcolor;
  
void setup() {
  size(500, 500);
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  handX = new float[num];
  handY = new float[num];
  rad = new float[num];
  hue = new float[num];
  bg = color(255);
  //blendcolor = color(0, 5);
  blendcolor = color(255, 1);
  colorMode(HSB,255);
  
  for (int i=0; i<num; i++) {
  // initial position in the centre of the screen
  x[i] = width/2;
  y[i] = height/2;

  // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
  
  hue[i] = 180;
  }
  background(bg);
}


void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  fill(blendcolor);
  rect(0, 0, width, height);
  for (int i=0; i<num; i++) {
    // calculate new position
    rad[i] = radians(frameCount) + TWO_PI/num*i;
    x[i] += dx[i];
    y[i] += dy[i];
  
  
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }
  
    if (y[i] > height-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }
    float bx = x[i] + 100 * sin(rad[i]);
    float by = y[i] + 100 * cos(rad[i]);
  
    fill(hue[i],255,255);
  
    float radius = 100 * sin(rad[i]*0.1);
    handX[i] = bx + radius * sin(rad[i]*3);
    handY[i] = by + radius * cos(rad[i]*3);
  
    //stroke(255, 50);
    stroke(0, 50);
    line(bx, by, handX[i], handY[i]);
    ellipse(handX[i], handY[i], ballsize, ballsize);
    for (int j=0; j<num; j++) {
      if(i != j && dist(handX[i], handY[i], handX[j], handY[j]) <= ballsize) {
        dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
        dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
        hue[i] = random(255);
      }
    }
  }
}




