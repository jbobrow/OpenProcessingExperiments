
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

int num;
float[] x; 
float[] y; // current drawing position
float[] dx;  
float[] dy; // change in position at each frame
float[] bx; 
float[] by;
float[] handX;
float[] handY;
float[] rad;       // radius for the moving hand
//int i;


void setup() {
  size(800, 800);
  num = 10;

  x = new float [num];
  y = new float [num];
  dx = new float [num];
  dy = new float [num];
  bx = new float [num];
  by = new float [num];
  rad = new float [num];
  handX = new float [num];
  handY = new float [num];
  


  for (int i=0; i<num; i++) {
    // initial position in the centre of the screen
    x[i] = width/2;
    y[i] = height/2;

    // dx and dy are the small change in position each frame
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
    background(0);
  }
}


void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);

  for (int i=0; i<num; i++) {


    // calculate new position
    x[i] += dx[i];
    y[i] += dy[i];

    if (i %2 == 1) {
      rad[i] = radians(frameCount);}
      
    else if (i %2 == 0) {
      rad[i] = radians(-frameCount);}

    float max = 1;
    float min = 0.5;

    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }

    if (y[i] > height-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }

    bx[i] = x[i] + 100 * sin(rad[i]);
    by[i] = y[i] + 100 * cos(rad[i]);

    fill(180);

    float radius = 100 * sin(rad[i]*0.1);
    handX[i] = bx[i] + radius * sin(rad[i]*3);
    handY[i] = by[i] + radius * cos(rad[i]*3);

    stroke(255, 50);
    line(bx[i], by[i], handX[i], handY[i]);
    ellipse(handX[i], handY[i], 2, 2);
  }
}



