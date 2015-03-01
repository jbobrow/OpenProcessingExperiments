
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

float rad;       // radius for the moving hand
int num = 35; // number of 'spinning tops'
int edge = 0;
PVector[] loc = new PVector[num]; // location array, using PVector to avoid additional arrays
PVector[] vel = new PVector[num]; // velocity array, using PVector to avoid additional arrays
int[] dir = new int[num];
float[] offSet = new float[num];

void setup() {
  size(800, 600);
  colorMode(HSB, 255, 100, 100);
  createStuff();
}


void draw() {
  if (frameCount%200==0) {
  fill(#000000, 5);
  noStroke();
  rect(0, 0, width, height);
  }
  rad = radians(frameCount);

  // calculate new position

  for (int i=0; i<loc.length; i++) {
    loc[i].add(vel[i]); // add one velocity unit to the current location of the anchor
    float max = 1;
    float min = 0.5;
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (loc[i].x > width-edge || loc[i].x < edge) {
      vel[i].x = vel[i].x > 0 ? -random(min, max) : random(min, max);
    }

    if (loc[i].y > height-edge || loc[i].y < edge) {
      vel[i].y = vel[i].y > 0 ? -random(min, max) : random(min, max);
    }

    float bx = loc[i].x + 300 * sin(rad+offSet[i])*dir[i];
    float by = loc[i].y + 300 * cos(rad+offSet[i])*dir[i];    
    float f = map(i, 0, loc.length, 0, 120);

    //fill(f, 90,90, 5);

    float radius = 100 * sin(rad*0.1);
    float handX = bx + radius * sin(rad*3)*dir[i];
    float handY = by + radius * cos(rad*3)*dir[i];


    //line(bx, by, handX, handY);

    if (i<num-1) {
      float distance = dist(loc[i].x, loc[i].y, loc[i+1].x, loc[i+1].y);
      if (distance > 50 && distance < 300) {

        stroke(f, 90, 100, 5);
        line(loc[i].x, loc[i].y, loc[i+1].x, loc[i+1].y);

      }
    }
  }
}

void keyPressed() {
  save(random(23232)+".jpg");
}

void mouseClicked() {
  createStuff();
}

void createStuff() {
  background(#000000);  
  for (int i=0; i<num; i++) {
    // a random starting position for the anchors
    float x = random(edge, width-edge); 
    float y = random(edge, height-edge); 
    loc[i] = new PVector(x, y);
    // dx and dy are the small change in position each frame
    float dx = random(-1, 1);
    float dy = random(-1, 1);
    vel[i] = new PVector(dx, dy);
    // clock-wise or non-clockwise
    float r = random(1);
    dir[i] = r>0.5 ? 1 : -1;
    offSet[i] = random(TWO_PI);
  }
}
