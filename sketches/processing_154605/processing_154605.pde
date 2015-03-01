
/*
 * Creative Coding
 * Week 6, 01 - Recursive funtions
 * by Janeen Cohen
 * Copyright (c) 2014 Monash University
 *
 * This sketch demonstrates a recursive function to draw circles within circles.
 *
 */

float ratio = 2;  // size ratio of circles
int division = 6; // number of circles inside each circle
int startlevel =3;

void setup() {
  size(800, 800);
  noStroke();
}

void draw() {
  fill(180, 45);
  translate(width/2, height/2); // move to the middle of the screen
  if (mousePressed && startlevel < 8){
 startlevel++;
  }
  if (mousePressed && startlevel == 7){
    startlevel = 3;
  }
 
  drawCircle(height/2, startlevel);
}

/*
 * drawCircle
 * recursive function that draws a circle
 * then draws 'division' circles inside that circle
 *
 */
void drawCircle(float radius, int level) {                    
  float tt = 226 * level/4.0;
  noFill();
  strokeWeight(1);
  stroke(tt);

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



