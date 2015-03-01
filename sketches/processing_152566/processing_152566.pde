
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

float red;
float green;
float blue;


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
  // blend the old frames into the background
 // blendMode(BLEND);
  fill(0, 1);
  if(frameCount % 60==1) rect(0, 0, width, height); //slow fade
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

  fill(180);

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);

 // stroke(255, 50);
   red = map(bx, 0, width, 0, 255);
    green = map(by, 0, height, 0, 255);
    blue = map(bx+by, 0, width+height, 255, 0);

   if(dist(bx, by, handX, handY) >60 && dist(bx, by, handX, handY) <80) stroke(red, green, blue, 80);
 noFill();
 //println(dist(bx, by, handX, handY));
  //if(frameCount % 2==1) 
  line(bx, by, handX, handY);
  
  stroke(red, green, blue, 20);
 // ellipse(bx, by, dist(bx, by, handX, handY), dist(bx, by, handX, handY));
  
       // save our drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("Albert_W2_05_v2_"+second()+".jpg");
  }
  
}

