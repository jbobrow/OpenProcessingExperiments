
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

int num;
float[] x;      // current drawing position
float[] y;      // current drawing position
float[] dx;    // change in position at each frame
float[] dy;    // change in position at each frame
float rad;       // radius for the moving hand


void setup() {
  size(600, 600);
  
  num = 30;
  
  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num]; 
  
  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {

    // initial position in the centre of the screen
    x[i] = width/2;
    y[i] = height/2;
  
    // dx and dy are the small change in position each frame
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
  }
  background(200, 0, 0);
}

void draw() {
  // blend the old frames into the background
//  blendMode(BLEND);
  fill(50,0,0, 4);
  rect(0, 0, width, height);

  for (int i=0; i<num; i++) {
    rad = radians(frameCount + i*30);
    // calculate new position
    x[i] += dx[i];
    y[i] += dy[i];
  
    float max = 1;
    float min = 0.5;
  
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }
  
    if (y[i] > height-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }
  
    float bx = x[i] + 100 * sin(rad);
    float by = y[i] + 100 * cos(rad);
  
    fill(180);
  
    float radius = 100 * sin(rad*0.1);
    float handX = bx + radius * sin(rad*3);
    float handY = by + radius * cos(rad*3);
  
    stroke(0, 255, 8*i, 50+i*3);
    line(bx, by, handX, handY);
    ellipse(handX, handY, 2, 2);
  }
}

// save your drawing when you press keyboard 's'
  void keyReleased(){
    if (key=='s') {
      saveFrame("spin-####.jpg");
    }
  }



