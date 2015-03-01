
/*
 * Creative Coding
 * Week 6, 01 - Recursive funtions
 * by Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch demonstrates a recursive function to draw circles within circles.
 *
 */

float ratio = 2;  // size ratio of circles
int division = 10; // number of circles inside each circle

void setup() {
  size(800, 800);
  noStroke();
}

void draw() {
  translate(width/2, height/2); // move to the middle of the screen
  drawCircle(height/2, 5); // draw the recursive circle
}

/*
 * drawCircle
 * recursive function that draws a circle
 * then draws 'division' circles inside that circle
 *
 */
void drawCircle(float radius, int level) {                    
  float tt = 126 * level/4.0;
  fill(random(255),random(255),random(255));

  // draw the circle
  ellipse(0, 0, radius*2, radius*2);      
  if (level > 1) {
    level = level - 1;

    // draw the inner circles
    for (int i = 0; i < division; ++i) {  
      pushMatrix();
      float mult = (level % 2 == 1) ? -1 : 1;
      rotate(mult * frameCount / (20.0 * level) + TWO_PI/division * i);
      translate(radius - radius/ratio, 0);
      drawCircle(radius/ratio, level);
      popMatrix();
    }
  }
}



