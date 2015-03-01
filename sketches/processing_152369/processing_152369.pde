
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

float [] x;
float [] y;      // current drawing position
float [] dx;
float [] dy;    // change in position at each frame
float [] rad;       // radius for the moving hand
float [] seed;
float [] step;
float [] redlevel;
int size = 50;
void setup() {
  size(600, 600);
  x = new float[size];
  y = new float[size];
  dx = new float[size];
  dy = new float[size];
  rad = new float[size];
  seed = new float[size];
  step = new float[size];
  redlevel = new float[size];
  
  for(int i =0; i<size; i++)
  {
  // initial position in the centre of the screen
  x[i] = width/2;
  y[i] = height/2;
  
  // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
  seed[i] = random(1000);
  step[i] = random(0.1,2);
  redlevel[i] = random(0,255);
  }
  background(0);
}


void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  fill(0, 10);
  rect(0, 0, width, height);
  
for(int i = 0; i<size;i++)
{
  seed[i]+=step[i];
rad[i] = radians(seed[i]);

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

  float bx = x[i] + 100 * sin(rad[i]);
  float by = y[i] + 100 * cos(rad[i]);


  float radius = 125 * sin(rad[i]*0.1);
  float handX = bx + radius * sin(rad[i]*3);
  float handY = by + radius * cos(rad[i]*3);
  fill(redlevel[i],100,0, 150);
  
  stroke(redlevel[i],100,0, 150);
  float step = 20;
  float actx, acty;
  noFill();
  for(int c = 0; c < step; c++)
  {
    actx = bx + (((handX-bx)/step)*c);
    acty = by + (((handY-by)/step)*c);
    ellipse(actx, acty,3, 3);  
  }
  
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("Nick w3_04_03.jpg");
  }
}
}



