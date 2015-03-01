
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
// one
float x, y;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand

// two
float nx, ny;      // current drawing position
float ndx, ndy;    // change in position at each frame
float nrad;       // radius for the moving hand

int hue;


void setup() {
  size(500, 500);
  colorMode(HSB);
  hue = 0;
  // initial position in the centre of the screen
  x = width/2;
  y = height/2;
  
  // initial position not in the centre of the screen
  nx = width/3 * random(2);
  ny = height/3 * random(2);

  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  background(0);
  
    // dx and dy are the small change in position each frame
  ndx = random(-1, 1);
  ndy = random(-1, 1);
  background(0);
}


void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  fill(0, 1);
  rect(0, 0, width, height);
  rad = radians(frameCount);

//try to get a few

  // calculate new position
  x += dx;
  y += dy;
  
  nx += ndx;
  ny += ndy;

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-100 || x < 100) {
    dx = dx > 0 ? -random(min, max) : random(min, max);
  }
  
//When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (nx > width-100 || nx < 100) {
    ndx = ndx > 0 ? -random(min, max) : random(min, max);
  }


  if (y > height-100 || y < 100) {
    dy = dy > 0 ? -random(min, max) : random(min, max);
  }
  
    if (ny > height-100 || ny < 100) {
    ndy = ndy > 0 ? -random(min, max) : random(min, max);
  }

  float bx = x + 100 * sin(rad);
  float by = y + 100 * cos(rad);
  
  float nbx = nx + 100 * sin(rad);
  float nby = ny + 100 * cos(rad);

  fill(hue, 255, 255);

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);
  
  float nradius = 100 * sin(rad*0.1);
  float nhandX = nbx + nradius * sin(rad*3);
  float nhandY = nby + nradius * cos(rad*3);

  stroke(hue, 255, 255);
  line(bx, by, handX, handY);
  ellipse(handX, handY, 2, 2);
  
  line(nbx, nby, nhandX, nhandY);
  ellipse(nhandX, nhandY, 2, 2);
    hue ++;
    hue = hue % 255;
}



