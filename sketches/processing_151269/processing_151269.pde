
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

// colorscheme: zenburn
color[] colors = { color(143,175,159),  
                    color(220,163,163), 
                    color(240,223,175), 
                    color(239,239,239)
                  };
color bg = color(63,63,63);

void setup() {
  size(500, 500);

  frame_rate_value = 9;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(bg);
}


void draw() {

  background(bg);

  int num = 20;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {
  color c = colors[circleNum % 4];
  float finalAngle;
  finalAngle = frameCount + circleNum;
  float radiusX = sin(finalAngle) + PI;
  float radiusY = cos(finalAngle) + PI;
  float a = map(radiusX, 0, PI * 2, 50, 255); 
  
  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  stroke(c, a);
  strokeWeight(radiusX);
  noFill();
  ellipse(tempX, tempY, size * radiusX / 5, size * radiusY / 5);
  
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
  
  if ( keyCode == 83) {
    saveFrame("emergence.jpg");
    print("saved");
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
}

