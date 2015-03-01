
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
int  num;
int i;
float[] x;
float[] y;      // current drawing position
float [] dx;
float [] dy;    // change in position at each frame
float rad;       // radius for the moving hand
float []bx;
float []by;
void setup() {
  size(500, 500);
num = 4;
// allocate size of arrays
  x = new float[num];
  y = new float[num];
 // dx and dy are the small change in position each frame  
  dx = new float [num];
  dy = new float[num];
  bx = new float[num];
  by = new float[num];

  // initial position in the centre of the screen
 for ( i=0; i<num; i++){
  x[i] = width/2;
  y[i] = height/2;
  dx[i] = random(-1,1);
  dy[i] = random(-1,1);
 }
 
   
  background(0);
}


void draw() {
  // blend the old frames into the background
 // blendMode(BLEND);
  fill(0, 2);
  rect(0, 0, width, height);
  rad = radians(frameCount);

  // calculate new position
  for ( i=0; i<num; i++) {
  x[i] +=  dx[i];
  y[i] += dy[i];
  }
  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  for ( i=0; i<num; i++) {
  
  if (x[i] > width-100 || x[i] < 100) {
    dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
  }

  if (y[i] > height-100 || y[i] < 100) {
    dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
  }

   bx[i] = x[i] + 100 * sin(rad);
   by[i] = y[i] + 100 * cos(rad);

  fill(180);

  float radius = 100 * sin(rad*0.1);
  float handX = bx[i] + radius * sin(rad*(i+1));
  float handY = by[i] + radius * cos(rad*(i+1));

  stroke(255*(i),255*(i-1),255*(i-2), 150);
  line(bx[i], by[i], handX, handY);
  ellipse(handX, handY, 2, 2);
}
 // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("pretty1.jpg");}
}

