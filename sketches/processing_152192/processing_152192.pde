
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

float red, green, blue;
  //rect related
  float angle = 0;

void setup() {
  size(900, 700);

  // initial position in the centre of the screen
  x = width/2;
  y = height/2;



  // dx and dy are the small change in position each frame
  dx = random(-1.5, 1.5);
  dy = random(-1.5, 1.5);
  background(0);
  smooth();

}


void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  //fill((float)green,(float)red,(float)blue, 5);
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

  float bx = x + 100 * sin(rad);
  float by = y + 100 * cos(rad);

  fill((float)red,(float) green, (float)blue);

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);

  stroke(green, blue,red, 50);
  line(bx, by, handX, handY);
  ellipse(handX, handY, 2, 2);
  
  
//  translate(handX, -handX);

//  ellipse(handX, handY, 2, 2);


float a=random(155); // Random size of circle
  float b=random(80); // Random size of circle 120
  stroke (a, random(mouseX/55, mouseY/55), random(mouseX/55, mouseY), 6); 
  //strokeWeight(2); // Outline
  fill(10, 158, frameCount); // Color 255
  fill(25, 8, frameCount); // Color 6
  fill (a, random(mouseX/10,mouseY/10), random(mouseX/10,mouseY), 2); // Color
  ellipse (handX, handY, b, b); // Shape
}

// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
  
  //fill((float)red,(float) green, (float)blue, 1);
  //noStroke();
  //rect(0, 0, width, height);
}
