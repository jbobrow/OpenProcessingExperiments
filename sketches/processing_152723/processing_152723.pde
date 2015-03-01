
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
int red, green, blue;
int count;

void setup() {
  size(500, 500);

  // initial position in the centre of the screen
  x = width/2;
  y = height/2;

  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  red = (int)random(0,255);
  green = (int)random(0,255);
  blue = (int)random(0,255);
  background(0);
  count = 0;
}


void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);
  rad = radians(frameCount);

  // calculate new position
  x += dx;
  y += dy;

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
  
  float radius = 120 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);
  
  float rad2 = 150 * sin(rad*0.05);
  float eX = handX + rad2 * sin(rad*5);
  float eY = handY + rad2 * cos(rad*5);
  
  red = red%256;
  green = green%256;
  blue = blue%256;
  
  fill(red,green,blue);
  stroke(red,green,blue);
  
  line(bx, by, handX, handY);
  line(handX, handY, eX, eY);
  //ellipse(x, y, 1, 1);
  ellipse(bx, by, 2, 2);
  ellipse(handX, handY, 2, 2);
  ellipse(eX, eY, 2, 2);
  
  /*if (i%3 == 0) {
    red++;
  } else if (i%3 == 1) {
    green++;
  } else if (i%3 == 2) {
    blue++;
  } else {
  }*/
  
  if (blue < 255) {
    blue++;
  } else {
    if (green < 255) {
      green++;
      //blue = 0;
    } else {
      if (red < 255) {
        red++;
        //green = 0;
        //blue = 0;
      } else {
        red = (int)random(0,255);
        green = (int)random(0,255);
        blue = (int)random(0,255);
      }
    }
  }

  //String filename = "HH_spin" + count + ".jpg";
  //saveFrame(filename);
  count++;
}

