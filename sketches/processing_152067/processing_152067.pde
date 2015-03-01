
/*
 * Creative Coding
 * Week 3, 02 - array with sin()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, speed and phase of some oscillating circles.
 *
 * You can change the background colour by holding the left mouse button and dragging.
 * Click on a circle to start/stop it.
 * Press 'b' to hide/show bones.
 * Press 'n' to rearrange bones.
 *
 * You can change the number of circles by changing the value of num in setup()
 * 
 */

int     num;    // the number of items in the array (# of circles)
float[] x;      // x-position of each circle
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
float [] ssize;
boolean [] moved;

boolean show_bones;
boolean [] is_line;

float red = 120;
float green = 120;
float blue = 120;

void setup() {
  size(500, 500);

  num = 7;

  // allocate space for each array
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num];
  ssize = new float[num];
  moved = new boolean[num];
  
  show_bones = true;
  is_line = new boolean[num*num]; 
  

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);
  
  randomSeed(hour() + minute() + second() + millis());

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random_speed();
    phase[i] = random_phase();
    moved[i] = true;
  }
  
  //setup bones between items
  random_bones();
  
}


void draw() {
  background(red, green, blue);
  

  fill(255);
  noStroke();
  for (int i=0; i<num; i++) {
    
    // calculate the x-position of each ball based on the speed, phase and current frame
    
    if (moved[i]){
       phase[i]++;
    }
    
    float spread = map (speed[i], 0, 10, 200, 50);
    x[i] = width/2 + sin(radians(phase[i]) * speed[i]) * spread; 
    ssize[i] = map(speed[i], 0, 10, 60, 20);
    ellipse(x[i], y[i], ssize[i], ssize[i]);
    
  }
  
  // Draw bones
  if (show_bones) {
      stroke(255);
      strokeWeight(2);
      for (int i=1; i<num; i++) {
        for (int j=0; j<i; j++) {
          if (is_line[j*num + i]) line(x[i], y[i], x[j], y[j]);
        }
      }
  }
  
}


// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}


void mousePressed() { 
  //random_bones();
  
  for (int i=0; i < num; i++) { 
    if (dist(mouseX, mouseY, x[i], y[i]) <= ssize[i]*0.8) {
      if (moved[i]) {
         moved[i] = false;
      } else {
         moved[i] = true;
         speed[i] = random_speed();
         phase[i] = random_phase();
      }
    }
  }
  
}

void keyReleased() {
  if (key == 'b') {
    show_bones = !show_bones;
  }
  if (key == 'n') {
    random_bones();
  }
}

void random_bones() { 
  for (int i=1; i<num; i++) {
  for (int j=0; j<i; j++) {
    is_line[j*num + i] = random(sqrt(num*sqrt(num))) < 1;
  }
  } 
}

float random_speed() {
  return random(2,10);  // start from 2 to avoid too fast items 
}

float random_phase() {
  return random(TWO_PI);
}

