
/*Siomara Jimenez. Version: Clocks. Week 2 exercise 4 
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 * 
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

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      
       if (circleNumber%2==1){
        movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      }
       else{
         movingRectangle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
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
  fill(#000000);
  ellipse(x, y, size, size); // circle

  strokeWeight(2);
  stroke(#FFFFFF);
  line(x, y, tempX, tempY); // red line
}


void movingRectangle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * cos(angle);
  float tempY = y + (size / 2) * sin(angle);

  stroke(0);
  strokeWeight(1);
  fill(#FFFFFF);
  rect(x, y, size, size); // rectangle

  strokeWeight(2);
  stroke(#000000);
  line(x, y, tempX, tempY); // red line
}



