
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * by Milagros
 *
 *
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 * In this Assignment I've add a function which draw a square with its red line moving opposite the red line in the circles
 */

void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(180);
  noStroke();

  int num = 5;
  int margin = 80;
  int a=0;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      if(a==0){
          movingCircle2(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
          a=1;
      }
      else{
          movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
          a=0;
      }
    }
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  ellipse(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

void movingCircle2(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempXX = x - (size / 2) * sin(angle);
  float tempYY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  rectMode(CENTER);
  rect(x, y, size, size); // square

  stroke(255, 0, 0);
  line(x, y, tempXX, tempYY); // red line
}



