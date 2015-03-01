
/*
 * Creative Coding
 * Week 3, 06 - rule-based system
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch draws a series of moving Elements (circles) according to the following rules:
 * - start from a random position and move in a constant random direction
 * - if the point reaches the boundary of the screen move in the opposite direction with new velocity
 * - if the circles intersect then draw a line connecting their centres, colouring the line based on the circle being odd or even
 * 
 * If you would prefer, you can modify this code. 
 * To do this, comment out the drawElement() function call in draw(). 
 * Additionally, you’ll need to comment out the background() call in draw() to stop the lines being erased at each frame. 
 * Finally, experiment with the stroke() calls used to draw the lines when dist < proximity. 
 * Use a low alpha value to give the drawing subtle variations in density as the lines accrete over time as the drawing develops. 
 * You many need to run the program for a while to get the most interesting results.
 */

float[] x;      // position
float[] y;
float[] xInc;   // change per frame
float[] yInc;
int numArray;   // number of elements
float proximity;  // if distance between elements < proximity then draw a line between them

void setup() {
  size(500, 500);
  numArray = 15;
  x= new float[numArray];
  y= new float[numArray];
  xInc= new float[numArray];
  yInc= new float[numArray];
  proximity = 100;   // influence distance
  //random starting position and direction
  for (int i=0; i<numArray; i++) {
    x[i] = random(width);
    y[i] = random(height);
    xInc[i] = random(-1, 1);
    yInc[i] = random(-1, 1);
  }
  strokeWeight(2);
}

void draw() {
  //iterate over each point
  for (int i=0; i<numArray; i++) {
    x[i] += xInc[i];
    y[i] += yInc[i];
    // bounce off the sides of the window
    if (x[i] > width || x[i] < 0) {
      xInc[i] = xInc[i] > 0 ? -random(1) : random(1);
    }
    if (y[i] > height || y[i] < 0 ) {
      yInc[i] = yInc[i] > 0 ? -random(1) : random(1);
    }
  }
  for (int i=0; i<numArray; i++) {
    for (int j=0; j<i; j++) {
      float dist = dist(x[i], y[i], x[j], y[j]  );
      if (dist < proximity) {
        stroke(random(0,255), random(0,255), random(0,255), 255);
        line(x[i], y[i], x[j], y[j]  );
      }
    }
  }
}

