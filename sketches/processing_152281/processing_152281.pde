
/*
 * Creative Coding
 * Week 3, 03 - using sin(), cos(), dist() to make a dynamic pattern 
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program allows you to change background color.
 * Use presentation mode( sketch menu > Present or press the shift-comand-r keys together)
 * Press "esc" key to stop running the sktech
 * experiment with changing the value of num and distanceMargin in setup
 * 
 * Modifications by Jason Prine
 //// Press the Left mouse button to modify Red value
 //// Press the Centre mouse button to modify Green value
 //// Press the Right mouse button to modify the Blue value
 //// RGB value sets background and opposite RGB value for moving ellipses
 //// Changed points to ellipses
 */

int     num;     // the number of items in the array
float[] x;       // x-position of point
float[] y;       // y-position
float[] speed;   // speed 
float[] phase;   // phase

int distanceMargin;
float rowHeight;

// background colour
float red;
float green;
float blue;


void setup() {

  //Fullscreen: to make fullscreen run this sketch with presentation mode ( sketch menu > Present )
  size(displayWidth, displayHeight);

  //Not fullscreen: fixed window 
  // size(500, 500);


  // change each value below for different visual
  num = 100;
  distanceMargin = 200;

  rowHeight = height/(num); // height of each row

  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 


  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    x[i] = width/2; 
    y[i] = rowHeight * i;
    speed[i] = random(1); // returns a random float bewteen 0 and 1
    phase[i] = random(TWO_PI);
  }

  red = 0;
  blue = 0;
  green = 0;
}


void draw() {
  // don't clear the screen each frame by calling background()
 // background(128);
  
  fill(255);

  for (int i=0; i<num; i++) {

    float radians = radians(frameCount*speed[i] );
    if (i%2 == 1) { // odd
      x[i] = width/2 + sin(radians + phase[i])* width/2;
    }
    else { // even
      x[i] = width/2 + cos(radians + phase[i])* width/2;
    }


    if (i<num-1) {
      float distance = dist(x[i], y[i], x[i+1], y[i+1]);
      println ("i:",i,"x[i]:",x[i],"y[i]:",y[i],"speed[i]:",speed[i],"phase[i]",phase[i],"distance:",distance);
      if (distance > rowHeight && distance < rowHeight + distanceMargin) {

        //stroke(255);
        //line(x[i], y[i], x[i+1], y[i+1]);

        //stroke(255-red,255-green,255-blue);
        fill(255-red,255-green,255-blue);
        ellipse(x[i], y[i],20,20);
        fill(red,green,210-blue);
        ellipse(x[i+1], y[i+1],40,40);
      }
    }
  }
   if (mousePressed && (mouseButton == LEFT)) {
    red = map(mouseX, 0, width, 0, 255);
    println("red:",red,"green:",green,"blue:",blue);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    green = map(mouseY, 0, height, 0, 255);
    println("red:",red,"green:",green,"blue:",blue);
  } else if (mousePressed && (mouseButton == CENTER)){
    blue = map(mouseX+mouseY, 0, width+height, 255, 0);
    println("red:",red,"green:",green,"blue:",blue);  
}
   
    fill(red, green, blue, 10);
    noStroke();
    rect(0, 0, width, height);
    // println("red: "+red+", green: "+green+", blue: "+blue);
  }

