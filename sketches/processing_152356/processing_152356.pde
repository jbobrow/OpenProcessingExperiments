
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

float[] x;
float[]y;      // current drawing position
float []dx;
float[] dy;    // change in position at each frame
float rad;       // radius for the moving hand
int num;        // number of spinners

void setup() {
  size(500, 500);
colorMode(HSB, 360, 100,100);
  num = (int)random(2,6);
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  
  // initial position in the centre of the screen
  for(int i=0; i<num; i++){
  x[i] = (250 - i*random(-10,10));
  y[i] = (250 + i*random(-10,10));
  

  // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
  }
  background(0);
}


void draw() {
  // blend the old frames into the background
//  blendMode(BLEND);
//  fill(0, 2);
 // rect(0, 0, width, height);

for (int i=0; i<num; i++){
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

  float bx = x[i] + 100 * sin(rad);
  float by = y[i] + 100 * cos(rad);

  noFill();

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);
 float howLong = (dist(bx, by, handX, handY)+i*10);
float h = map(howLong, 0, 100, 0, 360);
  stroke(h, 99, 99, 99);
  arc(bx, by, handX/(num*i), handY/(num*i),PI, PI+HALF_PI);

}
  
}

