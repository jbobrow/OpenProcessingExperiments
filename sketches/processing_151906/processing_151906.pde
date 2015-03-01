
/*
 * Written to try and figure out the fuction lerp()
 * by Luvi, June 17th 2014
 *
 * This sketch draws a grid of oscillating ellipses, each with
 * a "lifetime" over which it grows and changes intensity 
 * and opacity. At the end of each lifetime the circle 
 * begins again.
 * Pressing the left and right arrow keys changes 
 * the lifetime of all the circles globally.
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {

  size(800, 500);

  frame_rate_value = 21;
  rectMode(CENTER);
  background(0);
}


void draw() {

  background(0,0,111);

  int num = 20;
  int margin = lerp(0,10,0.1); //varying the margin
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
           
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 3.0 * sin(circleAge * HALF_PI);
  
  //introducing color variables so that lerpColor can be used
  color c1 = color(0,random(50),random(255));
  color c2 = color(0,0,255);
  
  //varying the thickness of the stroke and the color of the fill
  strokeWeight(lerp(0,2,1)); 
  stroke(lerpColor(c1,c2,0.5), lerp(255, 0, circleAge));
  fill(lerpColor(c1,c2,0.5), lerp(120, 0, circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize/4);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 120) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 2) {
    frame_rate_value--;
  }

  // print the current value on the screen
  println("Current frame Rate is: " + frame_rate_value);
}
