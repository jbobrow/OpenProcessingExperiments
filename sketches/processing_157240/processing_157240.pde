
/*
 * Creative Coding
 * Based on Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack and earlier exercises
 * Copyright (c) 2014 Monash University
 *
 * This sketch now includes arrays of points for several spinning tops which are 
 * shown as white lines when the points are within a certain distance of one another
 */
int     num;     // the number of items in the array
float[] x;       // x-position of point
float[] y;       // y-position
float[] speed;   // speed 
float[] dx;    // change in position at each frame
float[] dy;
float rad;       // radius for the moving hand
float[] pointSep;
void setup() {
  size(500, 500);
  // change each value below for different visual
  num = 25;
  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  speed = new float[num];
  pointSep = new float[num];
  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    x[i] = random(width/2-100, width/2 + 100); 
    y[i] = random(height/2-200, height/2); 
    // x[i] =width/2;
    //y[i] = height/2;
    speed[i] = random(1); // returns a random float between 0 and 1
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
    pointSep[i] = random(30, 150);
  }  //end of for loop
}  //end of setup

void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);

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
  }  //end of bounce loop

  for (int i=0; i<num; i++) {
    for (int j=0; j<i; j++) {
      rad = radians(frameCount*speed[i] );

      float d=dist(x[i], y[i], x[j], y[j]); // distance between points
      if ((d < pointSep[i])) { 
        fill(180);
        fill(255, 0, 0);
        //   rect(x[i], y[i], 2, 2);
        float bx = x[i] + 100 * sin(rad);
        float by = y[i] + 100 * cos(rad);
        //    line(x[i], y[i], bx, by);
        //   println ("rad = " + rad + " x[i] = " + x[i] + " bx = " + bx);

        fill(255, 100);  
        ellipse(bx, by, 2, 2);

        fill(0, 0, 255, 100);
        float radius = 100 * sin(rad*0.1);
        float handX = bx + radius * sin(rad*3);
        float handY = by + radius * cos(rad*3);
        //    println ("handX = " + handX + " x[i] = " + x[i] + " bx = " + bx);
        stroke(255, 50);
        line(bx, by, handX, handY);
        //   ellipse(handX, handY, 6, 6);
      } //end of if dist
    }  //end of inner if
  }  //  end of outer if
}  //end of draw



