
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
  background(180);
  rectMode(CORNER
  );
  noStroke();
}


void draw() {
  background(180);
  noStroke(777
  );

  int num = 5;
  int margin = 80;

  float gutter = -30; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int shapeNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++shapeNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
        if(shapeNumber%2==0){
      movingSquare(tx, ty, cellsize, - shapeNumber * TWO_PI * millis() / 800.0);
        }// even numbers goto circle function
        else {
      movingCircle(tx, ty, cellsize, - shapeNumber * 0.2 *  PI * millis() / 60.0);    
    }// odd numebers go to square function 
    }
  }
}//end of draw 


void movingSquare(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 98) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 155, 120, 180);
  rectMode(CENTER);
  rect(x, y, size, size);

  stroke(255, 777, 0);
  line(x, y, tempX, tempY); // red line
}

void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(777);
  strokeWeight(1);
  fill(250, 180);
  ellipse(x, y, size, size); // circle

  stroke(255, 777, 0);
  line(x, y, tempX, tempY); // red line
}



