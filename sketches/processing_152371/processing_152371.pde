
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


float[] x;      // current drawing position
float[] y;
float[] dx;    // change in position at each frame
float[] dy;
float[] bx;
float[] by;
float[] ang;
float[] ang_inc;
int num = 10; //int(random (7,10));        // number of tops
int framewidth  =500;
int frameheight =500;
void setup() {
  size(500, 500);
    x= new float [num];
  y= new float [num];
  dx  = new float [num];
  dy= new float [num];
  bx= new float [num];
  by= new float [num];

  for (int i=0; i<num; i++) { 
    // initial position in the screen
    x[i] = random(framewidth);
    y[i] = random(frameheight);
    // dx and dy are the small change in position each frame
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
    background(#AAEAEA);
  }
}

void draw() {
  
   for (int i=0; i<num; i++) { 

    
    // as blend doesn't work in javascript, slowly fade the image over time
  if (frameCount%10 == 0) {
    fill(#AAEAEA, 10);
    rect(0, 0, width, height);
  }
    
    float rad = radians(frameCount);

    // calculate new position
    x[i] += dx[i];
    y[i] += dy[i];
   
    
    float max = 1;
    float min = -1;

    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > framewidth-50 || x[i] < 50) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }

    if (y[i] > frameheight-50 || y[i] < 50) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }

    bx[i] = x[i] + 100*sin(rad);
    by[i] = y[i] + 100*cos(rad);

    float radius = sin(rad*0.1);
    float handX  = bx[i] + radius * sin(rad*3);
    float handY  = by[i] + radius * cos(rad*3);
    
      fill( 25*i, 0 , 225);
      stroke(0);
      strokeWeight(1);
      bezier(bx[i], by[i], bx[i]+random(20), by[i]+ random(20), handX-random(20), handY-random(20), handX, handY);
      bezier(bx[i], by[i], bx[i]-random(20), by[i]-10, handX-random(20), handY-random(20), handX, handY);
    
  }
}


  






