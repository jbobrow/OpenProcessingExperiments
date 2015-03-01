
/*
 * Creative Coding
 * W2_06 - MouseTrap 3S
 * DEFurugen
 *
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * Pressing the left and right arrow keys changes the lifetime of all the circles globally.
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {

  // make the display window the full size of the screen
  size(1500, 1200);

  frame_rate_value = 19;
  rectMode(CENTER);
  background(0);
}


void draw() {

  background(50);

  int num = 20;
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


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);

  strokeWeight(2);
  stroke(random(255),random(255),random(255), lerp(random(255),random(255), circleAge));
  fill(lerp(random(255),random(255), circleAge), lerp(120,random(50), circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}


void mousePressed() {

// right button -- increase frame_rate_value 
if ( mouseX <= (displayWidth/2) && frame_rate_value >= 2) { 
frame_rate_value--; 
} 
else if (mouseX >= (displayWidth/2) && frame_rate_value <= 120) { 
frame_rate_value++; 
}

  // print the current value on the screen
  println("Current frame Rate is: " + frame_rate_value);
}



