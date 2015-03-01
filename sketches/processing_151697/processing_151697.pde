
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * by Indae Hwang and Jon McCormack
 * amended by K Vickery
 * Copyright (c) 2014 Monash University
 *
 * This program draws a grid of circular and square "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" and moving circle 2 is used to draw each clock. Moving circle 3 draws the middle clock in a different colour.
 *  It is passed the position, size and hand angle
 * as arguments.
 * 
 */

void setup() {
  size(600, 600);
  background(255);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(255);
  noStroke();

  int num = 5;
  int margin = 80;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
       
        if ( circleNumber ==num+8){
        movingCircle3(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
    }
        else if (circleNumber % 2 !=0 ){
        
      movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
    }
    
      else     
      movingCircle2(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
    }
    
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(150,120,200);
  strokeWeight(1);
  fill(88,30,198,100);
  ellipse(x, y, size, size); // lilac circle

  stroke(150,120,200);
  line(x, y, tempX, tempY); // purple line
  
}
void movingCircle2(float x, float y, float size, float angle) {
  // calculate endpoint of the line
  float tempX = x - (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(140,10);
  strokeWeight(1);
  fill(140,200);
 rect(x, y, size, size); // circle2 ie square

  stroke(255);
  line(x, y, tempX, tempY); // white line
}
void movingCircle3(float x, float y, float size, float angle) {
  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(140,10);
  strokeWeight(1);
  fill(200,30,180,100);
ellipse(x, y, size, size); // circle3 

  stroke(200,30,180);
  line(x, y, tempX, tempY); // pink line
}


