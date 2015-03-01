
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
// one
float[] xarray; // current drawing position x
float[] yarray; // current drawing position y
float[] dxarray; // change in position at each frame x
float[] dyarray; // change in position at each frame y

float rad;       // radius for the moving hand

int hue;
int num;

void setup() {
  size(500, 500);
  colorMode(HSB);
  hue = 0;
  
  // increase num to see more curls
  num = 9;
  
  //Initialise Arrays 
  xarray = new float[num];
  yarray = new float[num];
  dxarray = new float[num];
  dyarray = new float[num];

  //Input values into the Array
  for (int i=0; i<num; i++) {
    xarray[i] = width/num * random(num-1);
    yarray[i] = width/num * random(num-1);
    dxarray[i] = random(-1, 1);
    dyarray[i] = random(-1, 1);
  }
  background(0);
}

void draw() {
  // blend the old frames into the background doesn't work in javascript
 // blendMode(BLEND);
  fill(0, 1);
  rect(0, 0, width, height);
  rad = radians(frameCount);

  //Use values from array 
  for (int i=0; i<num; i++) {
    xarray[i] += dxarray[i];
    yarray[i] += dyarray[i];

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (xarray[i] > width-100 || xarray[i] < 100) {
    dxarray[i] = dxarray[i] > 0 ? -random(min, max) : random(min, max);
  }
  


  if (yarray[i] > height-100 || yarray[i] < 100) {
    dyarray[i] = dyarray[i] > 0 ? -random(min, max) : random(min, max);
  }

  float bx = xarray[i] + 100 * sin(rad);
  float by = yarray[i] + 100 * cos(rad);

  fill(hue, 255, 255);

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);

  stroke(hue, 255, 255);
  line(bx, by, handX, handY);
  ellipse(handX, handY, 2, 2);
  }
    hue ++;
    hue = hue % 255;
}



