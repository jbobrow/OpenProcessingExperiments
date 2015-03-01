
/*
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Julio Montabes after an original by Indae Hwang and Jon McCormack
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

  frame_rate_value = 6;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(255);

  int num = 40;
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

void mouseClicked() {
  println(mouseButton);
  if (mouseButton==37) {
    frame_rate_value=(int) map(mouseX, 1, width, 1, 60);
  } else {
    if (mouseX<width/2) {
      frame_rate_value--;
    } else {
      frame_rate_value++;
    }

    frameRate(frame_rate_value);
  }
}

  void movingCircle(float x, float y, float size, int circleNum) {

    float finalAngle;
    finalAngle = frameCount + circleNum;

    //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
    float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
    float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

    noStroke();
    //fill(0);
    fill(random(150, 255), random(150, 255), 0);
    stroke(map(sin(PI / frame_rate_value * finalAngle), -1, 1, 0, 155), 0, map(cos(PI / frame_rate_value * finalAngle), -1, 1, 0, 155));

    ellipse(tempX, tempY, random(size/5, size/2), random(size/5, size/2));

    rect(tempX, tempY, 3, size*4);

    stroke(0);
    noFill();
    //stroke(0);
    //stroke(0,0,255);
    stroke(0, 0, map(circleNum, 1, 400, 0, 255));

    line(x, y, tempX, tempY);
  }


  /*
 * keyReleased function
   *
   * called automatically by Processing when a keyboard key is released
   */
  void keyReleased() {
    println(key);
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
    //println("Current frame Rate is: " + frame_rate_value);

    // print image
    if ( key == 's') {
      saveFrame("w2_05.jpg");
    }
  }



