
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 * 
 */

void setup() {
  size(600, 600);
  int BCO = (int) random(0,255);
  background(BCO);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  int BCO = (int) random(0,255);
  background( BCO);
  noStroke();
  
  int C = 0;

  int num = 5;
  int margin = 80;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter*(num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;
      ++C;
      
      if ( C % 2 == 0) {
       
        float tx = margin + cellsize * i + gutter * i;
        float ty = margin + cellsize * j + gutter * j;
int RAN = (int) random(4); 
        if (RAN == 3) {
        movingCircle(tx, ty,1.5 * cellsize, circleNumber * TWO_PI * millis() / 60000.0);
        } 
        movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      
      } else {
        
        float tx = margin + cellsize * i + gutter * i;
        float ty = margin + cellsize * j + gutter * j;
        
        movingsquare(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      }
    }
  }
  if (keyPressed == true && key=='s') {
    saveFrame("shity_angle#.jpg");
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  //stroke(0);
  //strokeWeight(1);
  noStroke();
  fill(140, 180);
  ellipse(x, y, size, size); // circle

//  stroke(255, 0, 0);
//  line(x, y, tempX, tempY); // red line
}

void movingsquare(float x, float y, float size, float angle) {
  
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

    //stroke(0);
  //strokeWeight(1);
  noStroke();
  fill(random(255),random(100),random(150),random(255));
  rect(x, y, size, size);
  
//  stroke(255, 0, 0);
//  line(x, y, tempX, tempY);
}

