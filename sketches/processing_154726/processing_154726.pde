
/*
 * BASED ON:
 * 
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch builds on the previous sketches, drawing shapes based on the
 * current framerate. The movement of individual shapes combine to create a
 * gestalt field of motion. Use the arrow keys on your keyboard to change the
 * frame rate. 
 */

int frame_rate_value, total_num;
float node_x_one, node_y_one, node_x_two, node_y_two;

void setup() {
  size(800, 800);
  total_num = 20;
  frame_rate_value = 11;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(255);

  int num = total_num;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    if ( i % 2 == 0 ) {
      for (int j=0; j<num; j++) {
        circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

        float ty = margin + cellsize * i + gutter * i;
        float tx = margin + cellsize * j + gutter * j;

        if (circleNumber % 2 == 0) {
          movingCircle(tx, ty, cellsize, circleNumber, 2);
        }
      }
    }
  }

  for (int i=0; i<num; i++) {
    //if (i % 2 == 1){ //this is to skip the orbits with text inside them
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float ty = margin + cellsize * i + gutter * i;
      float tx = margin + cellsize * j + gutter * j;

      if (circleNumber % 2 == 0) {
        movingNode(tx, ty, cellsize, circleNumber, 1);
      } else {
        movingNode(tx, ty, cellsize, circleNumber, 2);
      }

      if (node_x_one >= cellsize/2 && node_x_two >= cellsize/2 
        && node_x_one <= 800-5 && node_x_two <= 800-5 
        && node_y_one >= cellsize/2 && node_y_two >= cellsize/2
        && node_y_one <= 800-5 && node_y_two <= 800-5) {
        line(node_x_one, node_y_one, node_x_two, node_y_two);
      }
    }
    //}
  }
}

void movingCircle(float x, float y, float size, int circleNum, int version) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  noFill();
  stroke(tempX, tempY/8, circleNum/50, 50);
  ellipse(x, y, size, size);
  fill(x/6, y/6, (x+y)/2);
  ellipse(tempX, tempY, size/8, size/8);
  
  if (version == 2) {
    textAlign(CENTER, CENTER);
    textSize(size/3);
    text((int((degrees((atan2(y-tempY, tempX-x))) + 360) % 360)), x, y);
  }
}

void movingNode(float x, float y, float size, int circleNum, int version) {
  float finalAngle;
  finalAngle = frameCount + circleNum;
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);
  if (version == 1) {
    node_x_one = tempX;
    node_y_one = tempY;
  } else if (version == 2) {
    node_x_two = tempX;
    node_y_two = tempY;
  }
}

void keyPressed() {

  // INCREASE
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value++;
  }
  if (keyCode == UP) {
    total_num++;
  }


  // DECREASE
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value--;
  }
  if (keyCode == DOWN) {
    total_num--;
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value + 
    ", number of particles is: " + total_num );
}

