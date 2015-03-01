
/*
 * Futurelearn | Creative Coding
 * Week 2 - 12th June 2014
 * All the Clocks
 * by Chris Dymond (c)
 *
 * This program draws a grid of circular and square "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * Attached to the hands are solid round and square shapes that move with them and show the draw layering. 
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(0);
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
      if (circleNumber%2 == 0) {
          movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
        } else {
          movingSquare(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      }
    }
  }
}//end of draw 

// draw the square clocks
void movingSquare(float x, float y, float size, float angle) {

//  x = x + (int) random (-7,7); // offset x
//  y = y + (int) random (-7,7); // offset y
  
  // calculate endpoint of the line
  float tempX = x - (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(2);
  fill(#FFFFFF);
  rect(x, y, size, size);         // draw the square clock face

  stroke(0);
  strokeWeight(2);
  fill(0);
  line(x, y, tempX, tempY);       // draw the line
  ellipse(tempX, tempY, 80, 80);  // draw the circle on the end
}

// draw the circular clocks
void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(2);
  fill(#FFFFFF);
  ellipse(x, y, size, size); // draw the circlular clock face

  
  stroke(0);
  strokeWeight(2);
  fill(0);
  line(x, y, tempX, tempY);     // draw the line
  rect(tempX, tempY, 80, 80);   // draw the square on the end
}



