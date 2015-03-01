
/*
 * Written for the Creative Coding Course of Monash University
 * Week 2, 05 - Moving Patterns 1
 * Modified by Luvi, June 16th 2014
 *
 * This sketch builds on the previous sketches, drawing shapes based on the
 * current framerate. The movement of individual shapes combine to create a
 * gestalt field of motion. Use the arrow keys on your keyboard to change the
 * frame rate. 
 * 
 * Challenge: Modify the sketch to create a new emergent pattern generator 
 * changing the graphics primitives drawn. 
 * 
 */


// variable used to store the current frame rate value
int frame_rate_value;

void setup() {
  size(500, 500);

  frame_rate_value = 19;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(255,160,160, 200);

  int num = 20;
  int margin = 10;
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
  
  if (keyPressed == true && key == 's') {
    saveFrame ("emergent_patterns.jpg");
    }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  noStroke();
  fill(random(255), 160, 0, 100);
  triangle(tempX, tempY, tempX+circleNum, tempY+circleNum, tempX-circleNum, tempY-circleNum);
  ellipse(tempX, tempY, size*2, size*2);
  stroke(255);
  noFill();
  stroke(random(255));
  line(x, y, tempX, tempY);
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

