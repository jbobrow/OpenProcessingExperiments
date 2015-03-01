
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
  size(800, 800);

  // initial position in the centre of the screen
  x = width/2;
  y = height/3;

  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  background(0);
}


void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  //fill(0, 10);
  //rect(0, 0, width, height);
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

  float bx = x + 150 * sin(rad);
  float by = y + 150 * cos(rad);

  fill(180);

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);
  
  if((handX - x >= 80) && (handY - y >= 100)){
    stroke(0, 0, 255, 50);
    fill(0, 0, 255, 50);
    
  }
  else if(handX - x >= 80){
    stroke(255, 0, 0, 50);
    fill(255, 0, 0, 50);
  }
  else if(handY - y >= 100){
    stroke(0, 255, 0, 50);
    fill(0, 255, 0, 50);
  }
  else{
    stroke(225, 68, 250, 50);
    fill(225, 68, 250, 50);
  }
   line(x,y,bx,by);
  line(bx, by, handX, handY);
  ellipse(handX, handY, 2, 2);
}

void keyPressed()
{
 saveFrame("w3_04_02_###.jpg");
  
}


