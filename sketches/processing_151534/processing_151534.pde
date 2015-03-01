
/*
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch builds on the previous sketches, drawing shapes based on the
 * current framerate. The movement of individual shapes combine to create a
 * gestalt field of motion. Use the arrow keys on your keyboard to change the
 * frame rate. 
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {
  size(500, 500);

  frame_rate_value = 11;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
  //colorMode(HSB);
}


void draw() {

  background(255);

  int num = 20; // number of circles
  int margin = 0;
  float gutter = 1; //distance between each cell
  // cellsize is the size of the circle or square created by the relationship between the size
  // of the background, the margin around the edges, the gutter between and the number of cells you
  // want to cram in there - same as earlier in week 2
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      // each circle is given a unique number
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04
      // work out where the x and y values are for each cell
      float x = margin + cellsize * i + gutter * i;
      float y = margin + cellsize * j + gutter * j;
      // call the function and give it the information it needs to create the circle
      movingCircle(x, y, cellsize, circleNumber);
    }  
  }
} //end of draw 


void movingCircle(float x, float y, float cellsize, int circleNumber) {
  // initialise finalAngle
  float finalAngle;
  /* the rotating angle for each circle tempX and tempY postion is affected by
     the frameCount and the number of that circle so each location is unique;*/  
  finalAngle = frameCount + circleNumber; // makes the frame count effect the circle number
  
  /* Trying to explain the tempX and tempY statements below:
     tempX is the rotating location on the edge of the circle =
     circle x + (cellsize / 2) so half the width of the circle (that's the radius)
     times sin of 180 degrees divided by frame rate times the finalAngle 
     (the finalAngle is frame count + the individual circle number), so each tempX is unique.
     So this is really:
     A point spinning around on the edge of the circle = the circle centre point + radius
     times sin of 180 degrees / current frame rate * (frameCount + the circle number)
     so he using any changing variables he has access to or has defined to make moving changes.
     I wonder if he can predict what will result. I sure as hell can't.*/
  
  float tempX = x + (cellsize / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (cellsize / 2) * cos(PI / frame_rate_value * finalAngle);

  //noStroke();
  //fill(x*circleNumber,y,x);
  //rect(tempX, tempY, cellsize/2, cellsize/2);
  //fill(x*circleNumber/5-100,y,x); // so the initial x for each column is the same but the y is different 
  fill(circleNumber,0,0); // so starts 0 so black up to say 20 - shading goes down, then across
  //rect(tempX, tempY, 1, cellsize*5);
  stroke(0); // puts colour around a shape, one number only so it is shade, 0 = black
  // noFill();
  //line(x, y, tempX, tempY);
  ellipse(tempX, tempY, cellsize+1, cellsize);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value--;
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
}



