
/*
 * Creative Coding
 * Week 2, 06 - Moving Patterns 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * Pressing the left and right arrow keys changes the lifetime of all the circles globally.
 * 
 * My Variation
 * click canvas to change framerate
 * press space to pause / restart
 *
 * color is controlled through the x-mouse-position
 */

// variable used to store the current frame rate value
int frame_rate_value;
boolean doLoop = true;     // Loop-Mode

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100); 

  frame_rate_value = 75;
  background(0); 
}


void draw() {

  background(0);
  
  if(mousePressed){
    frame_rate_value = (int) map(mouseX, 0, width, 2, 120);
    println("Current frame Rate is: " + frame_rate_value);
  }
  
  int num = 10;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  
  float cellPos;   
  
  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; 

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      cellPos = abs(j - num/2) + abs(i - num/2); 

      movingCircle(tx, ty, cellsize, circleNumber, cellPos);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int offset, float cpos) {
  float circleAge;
  float circlePeriod = (float)frame_rate_value;  
  
  circleAge = (float) ((frameCount + cpos) % (int)circlePeriod) / circlePeriod;
  
  float circleSize = size * 2.0 * sin(circleAge * HALF_PI); 
  
  strokeWeight(2);
  stroke(255, lerp(0, 255,circleAge));
   
  float h = map(mouseX, 0, width, 0, 360);
  fill(h, lerp(50, 100, circleAge), lerp(50, 100, circleAge), lerp(100, 10, circleAge)); 
  
  ellipse(x, y, circleSize, circleSize);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  if( key == ' '){
    if(doLoop){
      doLoop = false; 
      noLoop(); 
    } else{
      doLoop = true; 
      loop(); 
    }
  }
  
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



