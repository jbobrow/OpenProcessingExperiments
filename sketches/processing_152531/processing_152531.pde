
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

float[] x, y;      // current drawing position
float[] dx, dy;    // change in position at each frame
float[] handX, handY;    // change in position at each frame
float[] rad;       // radius for the moving hand
int Quantity = 3;      // number of 'tops'

void setup() {
  size(500, 500);

  x = new float[Quantity];
  y = new float[Quantity];
  dx = new float[Quantity];
  dy = new float[Quantity];
  handX = new float[Quantity];
  handY = new float[Quantity];
  rad = new float[Quantity];

  // initial position in the centre of the screen
  for(int i = 0; i < Quantity; i++)
  {
    x[i] = width/2;
    y[i] = height/2;
  }

  // dx and dy are the small change in position each frame
  for(int i = 0; i < Quantity; i++)
  {
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
  }
  
  background(0);
}


void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);
  
  for(int i = 0; i < Quantity; i++)
  {
    rad[i] = radians(frameCount);

    x[i] += dx[i];
    y[i] += dy[i];

    float max = 0.5;
    float min = 0.1;

    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }
  
    if (y[i] > height-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }
  
    float bx = x[i] + 100 * sin(rad[i]);
    float by = y[i] + 100 * cos(rad[i]);
  
    fill(255, 140*i, 50*i);
    
    float radius = 100 * sin(rad[i]*0.1);
    handX[i] = bx + radius * sin(rad[i]*3);
    handY[i] = by + radius * cos(rad[i]*3);
    
    stroke(255, 50);
    line(bx, by, handX[i], handY[i]);
    ellipse(handX[i], handY[i], 2, 2);
  }
}



