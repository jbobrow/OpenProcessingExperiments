
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
 *
 * Alterations made during course on Futurelearn by Ron Leunissen, june 14 2014
 */

void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(150,150,35);
  noStroke();

  int num = 5;
  int margin = 80;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  int randomNumber; // random number to have hand go randomly
  
  

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      randomNumber = (int) random(300,500); 

    if (circleNumber%2 == 0){
       movingCircle1(tx, ty, cellsize, circleNumber * randomNumber * millis() / 60000.0);
     }else{
       movingCircle2(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
     }

      
    } // end of inner FOR
  } // end of outer FOR
}//end of draw 

// this is the example function provided by the course
void movingCircle1(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  int colorNumber1;
  int colorNumber2;
  int colorNumber3;
  colorNumber1 = (int) random(1,999);  // ADDED CODE, RANDOM COLOR
  colorNumber2 = (int) random(1,999); 
  colorNumber3 = (int) random(1,999); 

  stroke(0);
  strokeWeight(1);
  fill(colorNumber1, colorNumber2, colorNumber3); // random fill color, opaque
  ellipse(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

// this is the changed function, hand is shorter and is running clockwise now, and clock is rectangular, 
void movingCircle2(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 3) * cos(angle);  // hand goes clockwise now
  float tempY = y + (size / 3) * sin(angle);

  int colorNumber1;
  int colorNumber2;
  int colorNumber3;
  colorNumber1 = (int) random(1,999);  // ADDED CODE, RANDOM COLOR
  colorNumber2 = (int) random(1,999); 
  colorNumber3 = (int) random(1,999); 

  stroke(0);
  strokeWeight(1);
  fill(colorNumber1, colorNumber2, colorNumber3); // random fill color, opaque
  rect(x, y, size, size); // rectangle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

// example code to test voor odd or even
/* if (sec%2 == 0){
   x = 50;
 }else{
   x = 100;
 }
 */


