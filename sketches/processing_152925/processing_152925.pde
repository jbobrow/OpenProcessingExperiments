
/*
 * Creative Coding
 * Week 3, 03 - using sin(), cos(), dist() to make a dynamic pattern
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program allows you to change background color.
 * Press and hold the left mouse button to change color.
 * Use presentation mode( sketch menu > Present or press the shift-comand-r keys together)
 * Press "esc" key to stop running the sktech
 * experiment with changing the value of num and distanceMargin in setup
 * Combining the ideas of Richard Lyall, Paul Smith and Kim Vickery
 */  
 
 
int     num, numCentres, centreNum;     // the number of items in the array
float[] x;       // x-position of point
float[] y;       // y-position
float[] centrex;       // x-position of point
float[] centrey;       // y-position
float[] speed;   // speed
float[] phase;   // phase
float[] divisor; // radius of the orbit for each circle
float[][] centresarr; // the array of centres
float[] colour; // colour of each array of circles
  
float distanceMargin;
float rowHeight;
  
// background colour
float red;
float green;
float blue;
float drag;
  
  
void setup() {
  
  //Fullscreen: to make fullscreen run this sketch with presentation mode ( sketch menu > Present )
  size(800, 800);
  
  drag = 1;
  
  // change each value below for different visual
  num = 20;
  numCentres = int(random(1,num/2));    // how many centres should we have
  distanceMargin = 200;
   
  rowHeight = height/(num-1); // height of each row
  
  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  centrex = new float[num];
  centrey = new float[num];
  speed = new float[num];
  phase = new float[num];
  divisor = new float[num];
  centresarr = new float[num][num];  //numCentres would be more efficient but probably a list then
  
   
   
  for (int i=0; i<numCentres; i++) {
    centresarr[i][0]=random(distanceMargin,width-distanceMargin);
    centresarr[i][1]=random(distanceMargin,height-distanceMargin);
  }
     
  centreNum=0;
  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    centreNum = int(random(0,numCentres));
 
    centrex[i] = centresarr[centreNum][0];      //width/2;
    centrey[i] = centresarr[centreNum][1];      //width/2;
    speed[i] = random(0.2,2); // returns a random float bewteen 0 and 1
    phase[i] = random(TWO_PI);
    divisor[i] = random(0.5, 10);
    
    centreNum++;
  }
  
  red = 0;
  blue = 0;
  green = 0;
    
  background(255);
}
  
  
void draw() {
  // don't clear the screen each frame by calling background()
  //background(128);
   
  for (int i=0; i<num; i++) {
  
    // populate x values
    float rads = radians(frameCount*speed[i] );
  
    if (i%2 == 1) { // odd
      x[i] = centrex[i] + sin(rads + phase[i])* width/divisor[i];
      //x[i] = width/2 + sin(rads + phase[i])* width/divisor[i];
    } else { // even
      x[i] = centrex[i] + cos(rads + phase[i])* width/divisor[i];
      //x[i] = width/2 + cos(rads + phase[i])* width/divisor[i];
    }
  
    //populate y values
    float rads2 = radians(frameCount*speed[i] );
  
    if (i%2 == 1) { // odd
      y[i] = centrey[i] + cos(rads + phase[i])* width/divisor[i];
      //y[i] = width/2 + cos(rads + phase[i])* width/divisor[i];
    } else { // even
      y[i] = centrey[i] + sin(rads + phase[i])* width/divisor[i];
      //y[i] = width/2 + sin(rads + phase[i])* width/divisor[i];
    }
  // define colour for each array
  red = map(centrex[i], distanceMargin, width-distanceMargin, 0, 255);
  green = map(centrey[i], distanceMargin, height-distanceMargin, 0, 255);
  blue = map(centrex[i]+centrey[i], 2*distanceMargin, (width+height)-2*distanceMargin, 255, 0);
  
    if (i<num-1) {
      float distance = dist(x[i], y[i], x[i+1], y[i+1]);
      if (distance > rowHeight && distance < rowHeight + distanceMargin) {
        stroke (red+25, green+25, blue+25);
        fill (red, green, blue, 80) ;
        ellipse (x[i], y[i], (x[i+1]-x[i]) , (x[i+1]-x[i]));
      }
    }
  }
 
  if (mousePressed) {
    red = map(mouseX, 0, width, 0, 255);
    green = map(mouseY, 0, height, 0, 255);
    blue = map(mouseX+mouseY, 0, width+height, 255, 0);
 
    fill(red, green, blue, 10);
    noStroke();
    rect(0, 0, width, height);
    // println("red: "+red+", green: "+green+", blue: "+blue);
  }
}


