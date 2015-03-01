
/*
 * Creative Coding
 * Week 6, 01 - Recursive funtions
 * by Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch demonstrates a recursive function to draw circles within circles.
 *
 */

float ratio = 3;  // size ratio of circles
int division = 6; // number of circles inside each circle
int img = 0;
void setup() {
  size(800, 800);
//  noStroke();
  background(0,30,30);
}

void draw() {
  
  // slowly fade the image over time
  if (frameCount%100 == 0) {
    fill(0,30,30, 30);
    noStroke();
    rect(0, 0, width, height);
        
   }
  
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
  float tt = 126 * level/4;
  stroke(250,tt);
  fill(220,tt);

  // draw the circle
  ellipse(0, 0, 1, 1);      
  if (level > 1 ) {
    level = level - 1;

    // draw the inner circles
    for (int i = 0; i < division ; ++i) {  
      pushMatrix();
      float mult = (level % 2 == 1) ? -1 : 1;
      radius = radius - i*5;
      rotate(mult * frameCount / (20.0 * level) + HALF_PI/division * i);
      translate(radius + radius/ratio, 100);
      drawCircle(radius/ratio, level);
      popMatrix();
    }  
  }
}

void keyPressed() {
    if(keyPressed == true && key == 's'){
    saveFrame("image" +img+ ".jpg");
    img++;
    } 
}

