
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

void setup() {
  size(500, 500);

  // initial position in the centre of the screen
  x = width/2;
  y = height/2;

  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  background(#f7f7f7);
}


void draw() {

  fill(0, 5);
  rad = radians(frameCount);

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-100 || x < 100) {
    dx = dx > 0 ? -random(min, max) : random(min, max);
  }

  if (y > height-100 || y < 100) {
    dy = dy > 0 ? -random(min, max) : random(min, max);
  }

  float bx = x + 100 * sin(rad);
  float by = y + 100 * cos(rad);

  fill(180);

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);

  stroke(map(noise(frameCount*0.01), 0, 1, 0, 255), map(noise(frameCount*0.001), 0, 1, 0, 255), map(noise(frameCount*0.0001), 0, 1, 0, 255), 50);
  if (dist(handX, handY, handX+sin(millis()/250.0)*25, handY+sin(millis()/250.0)*25)>20) {
    line(handX, handY, handX+sin(millis()/250.0)*25, handY+sin(millis()/300.0)*25);
  }
  
}



