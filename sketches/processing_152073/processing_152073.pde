
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
int num;
int pts;
float[] x;
float[] y;      // current drawing position
float[] dx;
float[] dy;    // change in position at each frame
float[] bx;
float[] by;
float[] rad;       // radius for the moving hand



void setup() {
  size(500, 500);
  num = (int)random(4, 7);
  pts = (int)random(5, 8);
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  bx = new float[num];
  by = new float[num];
  rad = new float[num];  
  
  for (int i=0; i<num; i++){
    x[i] = random(width);   // initial position in the centre of the screen
    y[i] = random(height);
    dx[i] = random(-1, 1);  // dx and dy are the small change in position each frame
    dy[i] = random(-1, 1);
  }
  
  background(0);
 
}



void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
 
  for (int i=0; i<num; i++){        
    rad[i] = radians(frameCount);

    x[i] += dx[i];  // calculate new position
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

    bx[i] = x[i] + 100 * sin(rad[i]);
    by[i] = y[i] + 100 * cos(rad[i]);
  
    fill(180);

    float radius = 100 * sin(rad[i]*0.1);
    
    for (int j=0; j<num; j++){
       stroke(50/(j+1), 20*(j+1), 200-rad[j], random(100, 200)); 
       float[] cx;
       
       cx = new float[pts];
       float[] cy;
       cy = new float[pts];
       for (int k=0; k<pts; k++){
         cx[k] = bx[j] + radius * sin(rad[j]*k);
         cy[k] = bx[j] + radius * cos(rad[j]*k);
         line(bx[j], by[j], cx[k], cy[k]);         
       }
       for (int k=0; k<(pts-1); k++){
         line(cx[k], cy[k], cx[k+1], cy[k+1]);
       }
    }
  }
}
