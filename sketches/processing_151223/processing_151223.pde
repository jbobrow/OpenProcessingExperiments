
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * by Indae Hwang and Jon McCormack edited by KJ Morris
 * 
 */

void setup() {
  size(600, 600);
  background(#DEF4F5);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(#DEF4F5);
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
      // if circleNumbe is odd run movingCircle if even movingCircle 2
      if (circleNumber%2 != 0){
        movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0); //orig anti clock
        } else { // runs with half of clocks
          movingCircle2(tx, ty, cellsize, circleNumber * TWO_PI * millis() / -60000.0);
    }
  }
  }
} //end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(#F3E3F5);
  ellipse(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}
void movingCircle2(float x, float y, float size, float angle) { // actuaklly a square

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(#CCEAD8);
  rect (x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}
