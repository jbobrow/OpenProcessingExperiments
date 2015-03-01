
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

float[] x;
float[] x1; // position
float[] y;
float[] y1;
float[] xInc;
float[] x1Inc;// change per frame
float[] yInc;
float[] y1Inc;
int numArray;   // number of arrow elements
int num2Array;  // number of circle elements

float proximity;  // if distance between elements < proximity then draw a line between them
float proximity2;

void setup() 
{
  size(700, 700);

  numArray = 55;
  num2Array = 1;

  // allocate arrays
  x= new float[numArray];
  x1= new float[num2Array];
  y= new float[numArray];
  y1= new float[num2Array];
  xInc= new float[numArray];
  x1Inc= new float[num2Array];
  yInc= new float[numArray];
  y1Inc= new float[num2Array];
  
  x1= new float[num2Array];
  y1= new float[num2Array];

  proximity = 200;   // influence distance
  proximity2 = 300;

  // random starting position and direction
  for (int i=0; i<numArray; i++) 
  for (int n=0; n<num2Array; n++)
  
  {
    x[i] = random(width);
    x1[n] = random(width);
    y[i] = random(height);
    y1[n] = random(height);
    xInc[i] = random(-1, 1);
    x1Inc[n] = random(-1, 1);
    yInc[i] = random(-1, 1);
    y1Inc[n] = random(-1, 1);
  }

  strokeWeight(2);
}

void draw() 
{

  background(255, 40, 0, 240);

  // iterate over each point
  for (int i=0; i<numArray; i++)
 for (int n=0; n<num2Array; n++) 
  {

    x[i] += xInc[i];
    y[i] += yInc[i];

    // bounce off the sides of the window
    if (x[i] > width || x[i] < 0) 
    {
      xInc[i] = xInc[i] > 0 ? -random(1) : random(1);
    }

    if (y[i] > height || y[i] < 0 ) 
    {
      yInc[i] = yInc[i] > 0 ? -random(1) : random(1);
    }

    drawElement(x[i], y[i], xInc[i], yInc[i]);
  }

  for (int i=0; i<numArray; i++) 
  for (int n=0; n<num2Array; n++)
  {
    for (int j=0; j<i; j++) 
    {
      float dist = dist(x[i], y[i], x[j], y[j]  );
      if (dist < proximity) 
      {
        if (i%2 == 0 || j%2==0) 
        {
          stroke(0, 0, 255, 20);
        } 
        
        else 
        
        {
          stroke(255, 0, 255, 20);
        }
        line(x[i], y[i], x[j], y[j]  );
      }
    }
  }
}

void drawElement(float x, float y, float dx, float dy ) 
{
  // draw the point in red
  noFill();
  stroke(255, 5, 0);
  point(x, y);

  // draw an arrow in the current direction of travel
  stroke(20, 100);
  float endX = x + (dx*20);
  float endY = y + (dy*20);
  float arX = x + (dx*15);
  float arY = y + (dy*15);
  line(x, y, endX, endY);
  line(endX, endY, arX + (dy * 5), arY - (dx * 5));
  line(endX, endY, arX - (dy * 5), arY + (dx * 5));


  // draw the boundary of proximity
  stroke(10, 10);
  ellipse(x, y, proximity2, proximity2);
}


