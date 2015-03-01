
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
float[] rad;       // radius for the moving hand
int tops;
float[] bx, by;
float[] handX, handY;
float[] radius;

void setup() {
  size(800, 800);
  tops = 33;
  x = new float[tops];
  y = new float[tops];
  dx = new float[tops];
  dy = new float[tops];
  bx = new float[tops];
  by = new float[tops];
  handX = new float[tops];
  handY = new float[tops];
  rad = new float[tops];
  radius = new float[tops];
  
  for (int i=0; i<tops; i++){
    // initial positions in the screen
    x[i] = random(100, width-100);
    y[i] = random(100, height-100);

    // dx and dy are the small change in position each frame
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
  }
  background(0);
}


void draw() {
  // blend the old frames into the background
 // blendMode(BLEND);
  fill(0, 1);
  rect(0, 0, width, height);
  float max = 1;
  float min = 0.5;

  for (int i=0; i<tops; i++){
    rad[i] = radians(frameCount*3/(i+1)*PI);
    // calculate new position
    x[i] += dx[i];
    y[i] += dy[i];

    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }
    if (y[i] > height-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }

    bx[i] = x[i] + 100 * sin(rad[i]);
    by[i] = y[i] + 100 * cos(rad[i]);

    fill(180);

    radius[i] = 100 * sin(rad[i]*0.1);
    handX[i] = bx[i] + radius[i] * sin(rad[i]*2);
    handY[i] = by[i] + radius[i] * cos(rad[i]*2);
//  noStroke(); 
//  fill(255, 0, 0); 
//  ellipse(x, y, 3, 3); 
//    fill(random(255), random(255), random(255));
    strokeWeight(1);
    stroke(map(radius[i],0,100,0,255),map(x[i],0,width,0,255), map(y[i],0,height,0,255),random(100));
    line(bx[i], by[i], handX[i], handY[i]);
//    ellipse(handX[i], handY[i], 2, 2);
  }
  noStroke(); 
  if (mousePressed){
      background(0);
  }
}



