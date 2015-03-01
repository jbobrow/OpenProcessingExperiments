
/*
 * Creative Coding
 * Week 6, 01 - Recursive funtions
 * by Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch demonstrates a recursive function to draw circles within circles.
 * my variation: Michal Huller
 */

float ratio = sqrt(6);  // size ratio of circles
int division = 6; // number of circles inside each circle

void setup() {
  size(600, 600);
  noStroke();
  colorMode(HSB);
}

void draw() {
  background(0);
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
  float tt = 10 + 200 * level/4.0;
  float wi = 6*level/2;
  stroke(tt,180,222, 180);
  strokeWeight(wi/2);

  // draw the circle
  if (level <4)
  line(0,0,radius*2, radius*2);
  
  ellipse(0,0, wi, wi);
  ellipse(radius*2, radius*2, wi, wi);
  //ellipse(0, 0, radius*2, radius*2);      
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

