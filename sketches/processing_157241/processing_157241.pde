
/*
 * Creative Coding
 * Based on Week 3_06 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack and earlier exercises
 * Copyright (c) 2014 Monash University
 *
 * This sketch now includes arrays for several spinning tops *
 */
int     num;     // the number of items in the array
float[] x;       // x-position of point
float[] y;       // y-position
float[] dx; 
float[] dy;// change in position at each frame
void setup() {
  size(500, 500);
  // change each value below for different visual
  num = 50;
  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
   x[i] = random(width/2-100,width/2 + 100); 
   y[i] = random(height/2-100,height/2 + 100); 
 //x[i] =width/2;
// y[i] = height/2;
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
  }  //end of for loop
}  //end of setup

void draw() {
//  background(200);
  for (int i=0; i<num; i++) {
    x[i] += dx[i];
    y[i] += dy[i];
    float max = 1;
    float min = 0.5;
    // When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width-10 || x[i] < 10) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }  //end of if width
    if (y[i] > height-10 || y[i] < 10) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }  //end of if height
  }  //end of for loop

  for (int i=0; i<num; i++) {
    for (int j=0; j<i; j++) {
      float d=dist(x[i], y[i], x[j], y[j]); // distance between centers
      if (d < 100) {
        fill(0, 255, 0);
     //   ellipse(x[i], y[i], 4, 4);  //the green dot
        fill(255, 0);
     //   ellipse(x[i], y[i], 100, 100);
        fill(255, 0, 0);
    //    ellipse(x[j], y[j], 4, 4);  //the red dot
        fill(255, 0);
    //    ellipse(x[j], y[j], 100, 100);
        int col = i%2;   
        if (col==0) {
          stroke (0, 0, 255,5);
          line (x[i], y[i], x[j], y[j]);
        } else {
          stroke (255, 255, 0,5);
          line (x[i], y[i], x[j], y[j]);
        }
      }  //end of dist if
    }  //end of j if
  }  //  end of i if
}  //end of draw



