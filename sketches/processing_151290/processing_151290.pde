
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 * This is my variation, still just one moving element, but two 
 * different 'motions' around it, one in black, one in white, with 
 * slightly differnt angles
 *
 * Click canvas to pause/restart
 * Press 'c' to clear screen
 *
 */

float x, y;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand
boolean looping = true;  // Loop-Mode

void setup() {
  size(500, 500);

  // initial position in the centre of the screen
  x = width/2;
  y = height/2;

  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  background(0);
}


void draw() { 
  rad = radians(frameCount);

  // calculate new position
  x += dx;
  y += dy;

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-50 || x < 50) {
    dx = dx > 0 ? -random(min, max) : random(min, max);
  }

  if (y > height-50 || y < 50) {
    dy = dy > 0 ? -random(min, max) : random(min, max);
  }

  float bx = x + 100 * sin(rad);
  float by = y + 100 * cos(rad);
  float cx = x + 100 * sin(rad+1);
  float cy = y + 100 * cos(rad+1);
  
  float radius = 100 * sin(rad*0.1);
  
  float handX = bx + radius * sin(rad*2);
  float handY = by + radius * cos(rad*2);
  float handX2 = cx + radius * sin(-(rad+1)*2);
  float handY2 = cy + radius * cos(-(rad+1)*2);
  
  strokeWeight(3); 
  stroke(255, 50);
  line(bx, by, handX, handY);
  stroke(0, 50);
  line(cx, cy, handX2, handY2);

  noStroke();
  fill(255); 
  ellipse(handX, handY, 2, 2);
  fill(0); 
  ellipse(handX2, handY2, 2, 2);
}

void mouseReleased(){
 if(looping){
   looping = false; 
   noLoop(); 
 } else {
   looping = true; 
   loop(); 
 }
}

void keyReleased(){
  if(key == 'c' || key == 'C'){
    background(0); 
  }
}


