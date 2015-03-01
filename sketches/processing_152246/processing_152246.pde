
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

float x, y;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand

boolean showConstruct;

void setup() {
  size(500, 500);

  // initial position in the centre of the screen
  x = width/2;
  y = height/2;

  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  background(0);
  
  // don't show construction at start
  showConstruct = false;
  
}


void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);
  rad = radians(frameCount);

  // calculate new position
  x += dx;
  y += dy;

  float mmax = 1;
  float mmin = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-100 || x < 100) {
    dx = dx > 0 ? -random(mmin, mmax) : random(mmin, mmax);
  }

  if (y > height-100 || y < 100) {
    dy = dy > 0 ? -random(mmin, mmax) : random(mmin, mmax);
  }
  
  if (showConstruct) {
      stroke(255, 0, 0);
      point(x,y);
      stroke(255,255,0,25);
      ellipse(x,y,200,200);
  }



  float bx = x + 100 * sin(rad);
  float by = y + 100 * cos(rad);

  fill(180);

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);

  stroke(255, 50);
  line(bx, by, handX, handY);
  ellipse(handX, handY, 2, 2);
}

void keyPressed() {
  if (key == 'h')
  showConstruct = !showConstruct;
}

void mousePressed() {
  showConstruct = !showConstruct;
}


