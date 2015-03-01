
/*
 * Creative Coding
 * Week 3, 06 - rule-based system: final version
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch draws a series of moving Elements (circles) according to the following rules:
 * - start from a random position and move in a constant random direction
 * - if the point reaches the boundary of the screen move in the opposite direction with new velocity
 * - if the circles intersect then draw a line connecting their centres, colouring the line based on the circle being odd or even
 *
 * This sketch is the finished version from the exercise
 */

float[] x;      // position
float[] y;
float[] xInc;   // change per frame
float[] yInc;
int numArray;   // number of elements

float proximity;  // if distance between elements < proximity then draw a line between them

float rd;
float grn;
float bl;

void setup() {
  size(700, 700);

  numArray = 50;

  // allocate arrays
  x= new float[numArray];
  y= new float[numArray];
  xInc= new float[numArray];
  yInc= new float[numArray];

  proximity = 150;   // influence distance
  
  rd = 0;
  grn = 0;
  bl = 0;

  // random starting position and direction
  for (int i=0; i<numArray; i++) {
    x[i] = random(width);
    y[i] = random(height);
    xInc[i] = random(-1, 1);
    yInc[i] = random(-1, 1);
  }
  background (210);
  strokeWeight(2);
}

void draw() {

  // background(255);

  // iterate over each point
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

    // drawElement(x[i], y[i], xInc[i], yInc[i]);
  }

  for (int i=0; i<numArray; i++) {
    for (int j=0; j<i; j++) {
      rd = map(x[i], 0, width, 0, 255);
      grn = map(y[i], 0, height, 0, 255);
      bl = map(x[i]+y[i], 0, (width+height), 255, 0);
      float distance = dist(x[i], y[i], x[j], y[j]  );
      if (distance < proximity) {
        if (i%2 == 0 && j%2==0) {
          stroke(rd, grn, bl, 10);
        } 
        else {
          stroke(grn, bl, rd, 10);
        }
        line(x[i], y[i], x[j], y[j]  );
      }
    }
  }if (keyPressed == true && key == 's'){
  saveFrame("Spiderweb-######.jpg");
  }
  
  //clicking the mouse restarts the drawing
  if (mousePressed == true) {
  background (210);
  }  
}

void drawElement(float x, float y, float dx, float dy ) {

  // draw the point in red
  noFill();
  stroke(255, 0, 0);
  point(x, y);

  // draw an arrow in the current direction of travel
  stroke(0, 100);
  float endX = x + (dx*20);
  float endY = y + (dy*20);
  float arX = x + (dx*15);
  float arY = y + (dy*15);
  line(x, y, endX, endY);
  line(endX, endY, arX + (dy * 5), arY - (dx * 5));
  line(endX, endY, arX - (dy * 5), arY + (dx * 5));


  // draw the boundary of proximity
  stroke(0, 10);
  ellipse(x, y, proximity, proximity);
}



