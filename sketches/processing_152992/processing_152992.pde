
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

int num; // number of spinning tops
float[] x;
float[] y; // current drawing position
float[] dx;
float[] dy;    // change in position at each frame
float[] rad;       // radius for the moving hand
color[] from;
color[] to;
float[] max;
float[] min;

void setup() {
  size(500, 500);
  
  num = 5;
  
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  rad = new float[num];
  from = new color[num];
  to = new color[num];
  max = new float[num];
  min =new float[num];

  float rowHeight = height/(num-1);
  

  for (int i=0; i<num; i++) {

    // initial position in the centre of the screen
    x[i] = width/2;
    y[i] = height/2; //rowHeight * i;

    // dx and dy are the small change in position each frame
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
  
    // pick some random colors
    from[i] = color(random(255), random(255), random(255));
    to[i] = color(random(255), random(255), random(255));
  }
  
  background(0);
}


void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);
  
  for (int i=0; i<num; i++) {
    rad[i] = radians(frameCount);

    // calculate new position
    x[i] += dx[i];
    y[i] += dy[i];

    max[i] = random(0.5, 1);
    min[i] = random(0.1, 0.5);

    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min[i], max[i]) : random(min[i], max[i]);
    }

    if (y[i] > height-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min[i], max[i]) : random(min[i], max[i]);
    }

    float bx = x[i] + 120 * sin(rad[i]);
    float by = y[i] + 80 * cos(rad[i]);

    float radius = 100 * sin(rad[i]*0.1);
    float handX = bx + radius * sin(rad[i]*3);
    float handY = by + radius * cos(rad[i]*3);
  
    float lineLength = dist(bx, by, handX, handY);
    color c = lerpColor(from[i], to[i], map(lineLength, 0, 10, 0, 1)); 

    fill(c);

    stroke(c, 50);
    line(bx, by, handX, handY);
    stroke(from[i], 75);
    ellipse(handX, handY, random(min[i]*15, max[i]*15), random(min[i]*15, max[i]*15));
  }
}



