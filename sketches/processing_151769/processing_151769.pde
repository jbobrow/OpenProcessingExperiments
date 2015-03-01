
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
 */

float[] x;      // position
float[] y;
float[] xInc;   // change per frame
float[] yInc;
int numArray;   // number of elements

float proximity;  // if distance between elements < proximity then draw a line between them

float ball_x, ball_y;
float center_x, center_y;
float radius;

void setup() {
  size(1200, 800);

  numArray = 40;

  radius = 50;

  // allocate arrays
  x= new float[numArray];
  y= new float[numArray];
  xInc= new float[numArray];
  yInc= new float[numArray];

  proximity = 100;   // influence distance

  // random starting position and direction
  for (int i=0; i<numArray; i++) {
    x[i] = random(width);
    y[i] = random(height);
    xInc[i] = random(-1, 1);
    yInc[i] = random(-1, 1);
  }

  strokeWeight(2);
}

void draw() {

  background(255,200);


  float radians = radians(frameCount);
  int angleForSinCosBall = frameCount%360;
  int increaseForSinCosBall = angleForSinCosBall;
  float radiansForSinCosBall= radians(angleForSinCosBall);
  
  
  // iterate over each point
  for (int i=0; i<numArray; i++) {

    x[i] += xInc[i];
    y[i] += yInc[i];

  ball_x = x[i] + radius*sin(radians);
  ball_y = y[i] + radius*cos(radians);

  //rotating ball
    fill(0,0,255,100);
    stroke(0);
    ellipse(ball_x, ball_y, 20, 20);

  //rect fill or ellipse
    noStroke();  
    fill(0, 0, 255,200);
    rect(ball_x, ball_y, 10, radius*sin(radiansForSinCosBall) );
    //ellipse(ball_x, ball_y, 30, radius*sin(radiansForSinCosBall) );
    fill(255, 0, 0,200);
    rect(ball_x, ball_y, 1*radius*cos(radiansForSinCosBall), 10 );
    //ellipse(ball_x, ball_y, radius*cos(radiansForSinCosBall), 20 );
  
    // bounce off the sides of the window
    if (x[i] > width || x[i] < 0) {
      xInc[i] = xInc[i] > 0 ? -random(1) : random(1);
    }

    if (y[i] > height || y[i] < 0 ) {
      yInc[i] = yInc[i] > 0 ? -random(1) : random(1);
    }

    drawElement(x[i], y[i], xInc[i], yInc[i]);
    
  }



  for (int i=0; i<numArray; i++) {
    for (int j=0; j<i; j++) {
      float dist = dist(x[i], y[i], x[j], y[j]  );
      if (dist < proximity) {
        if (i%2 == 0 || j%2==0) {
          stroke(0, 0, 255, 200);
        } 
        else {
          stroke(255, 0, 0, 200);
        }
        line(x[i], y[i], x[j], y[j]);
        fill(255, 0, 0,200);
        ellipse(x[i], y[i], 20, 20);
        
        
        
      }
    }
  }
}

void drawElement(float x, float y, float dx, float dy ) {

  // draw the point in red
  noFill();
  stroke(0, 0,255,200);
  ellipse(x, y,40,40);

  // draw an arrow in the current direction of travel
  stroke(255,0,0, 200);
  float endX = x + (dx*20);
  float endY = y + (dy*20);
  float arX = x + (dx*15);
  float arY = y + (dy*15);
  line(x, y, endX, endY);
  line(endX, endY, arX + (dy * 5), arY - (dx * 5));
  line(endX, endY, arX - (dy * 5), arY + (dx * 5));


  // draw the boundary of proximity
  stroke(100, 200);
  ellipse(x, y, proximity, proximity);
}

