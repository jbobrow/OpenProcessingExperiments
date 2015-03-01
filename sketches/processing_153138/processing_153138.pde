
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
 int num; // the number of items in the array
float[] x, y;      // current drawing position
float[] dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand
float[] bx, by, handX, handY;
float[] v; // hand speed
float radius;
float distance;

float rd;
float grn;
float bl;

void setup() {
  size(700, 700);

  num = 15;
  
  // allocate space for each array
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  bx = new float[num];
  by = new float[num];
  handX = new float[num];
  handY = new float[num];
  v = new float [num];
  
  for (int i=0; i<num; i++) {
  // initial position in the centre of the screen
  x[i] = width/2;
  y[i] = height/2;

  // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
  }
  
  rd = 0;
  grn = 0;
  bl = 0;
  
  background(0);
  
}


void draw() {
  // blend the old frames into the background
  // blendMode(BLEND);
  fill(rd, grn, bl, 10);
  rect(0, 0, width, height);
  
  for (int i=0; i<num; i++) {
  rad = radians(frameCount);
  
  // calculate new position
  x[i] += dx[i];
  y[i] += dy[i];

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x[i] > width-100 || x[i] < 100) {
    dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
  }

  if (y[i] > height-100 || y[i] < 100) {
    dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
  }
  }
  for (int i=0; i<num; i++) {
    
  v[i] = map(i, 1, num-1, 0, 3);
    
  if (i%2 == 1) { // odd
  bx[i] = x[i] + 200 * sin(rad);
  by[i] = y[i] + 200 * cos(rad);
  } else { // even
  bx[i] = x[i] + 200 * cos(rad);
  by[i] = y[i] + 200 * sin(rad);
  }
  
  rd = map(x[i], 100, width-100, 0, 255);
  grn = map(y[i], 100, height-100, 0, 255);
  bl = map(x[i]+y[i], 200, (width+height)-200, 255, 0);
  fill(rd, grn, bl, 100);
  
  float radius = 150 * sin(rad*0.1);
  
  
  if (i%2 == 1) {
  handX[i] = bx[i] + radius * sin(rad*v[i]);
  handY[i] = by[i] + radius * cos(rad*v[i]);
  } else {
  handX[i] = bx[i] + radius * cos(rad*v[i]);
  handY[i] = by[i] + radius * sin(rad*v[i]);
  }
  
  stroke(rd, grn, bl, 200);
  strokeWeight (1.5);
  line(bx[i], by[i], handX[i], handY[i]);
  ellipse(handX[i], handY[i], 1, 1);
  
  if (i<num-1) {
      float distance = dist(x[i], y[i], x[i+1], y[i+1]);
      if (distance < 100) {
        stroke (rd+25, grn+25, bl+25);
        fill (rd, grn, bl, 40) ;
        ellipse (x[i], y[i], (x[i+1]-x[i]) , (x[i+1]-x[i]));
      }
    }
  }
}



