
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 * 6/7/14 modified by dtanderson to add colour and multiple tops 
 */

int tops=5;      // number of tops
float [] x = new float[tops];       // curr ent x drawing position
float [] y = new float[tops];    // current y drawing position
float [] dx = new float[tops];
float [] dy = new float[tops];  // change in position at each frame
float [] rad = new float[tops];  // radius for the moving hand
float [] bx = new float[tops];
float [] by = new float[tops];
float [] rd = new float[tops];  // red colour
float [] gn = new float[tops];  // green colour
float [] bl = new float[tops];  // blue colour

void setup() {
  size(500, 500);

  // initial positio
  for(int i=0; i<tops; i++)
  {
    x[i] = width/2;
    y[i] = height/2;
  }

  // dx and dy are the small change in position each frame
  for(int i=0; i<tops; i++)
  {
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
  }
  background(0);
}

void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  fill(0, 1);
  rect(0, 0, width, height);
  for(int i=0; i<tops; i++)
    rad[i] = radians(frameCount*(i+1));

  // calculate new position
  for(int i=0; i<tops; i++)
  {
    x[i] += dx[i];
    y[i] += dy[i];
  }

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  for(int i=0; i<tops; i++)
  {
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }
  }

  for(int i=0; i<tops; i++)
  {
    if (y[i] > height-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }
  }

  for(int i=0; i<tops; i++)
  {
    bx[i] = x[i] + 100 * sin(rad[i]);
    by[i] = y[i] + 100 * cos(rad[i]);
  }

  fill(180);

  for(int i=1; i<tops; i++)
  {
    float radius = 100 * sin(rad[i]*0.1);
    float handX = bx[i] + radius * sin(rad[i]*3);
    float handY = by[i] + radius * cos(rad[i]*3);

    rd[i] = random(0,255);
    gn[i] = random(0,255);
    bl[i] = random(0,255);
    stroke(rd[i],gn[i],bl[i]);
    line(bx[i], by[i], handX, handY);
    ellipse(handX, handY, 2, 2);
  }
}

