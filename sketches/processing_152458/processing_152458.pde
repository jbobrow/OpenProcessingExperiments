
/*
 * Creative Coding
 * Week 2, 06 - Moving Patterns 2
 * by Indae Hwang and Jon McCormack
 * 
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * Pressing the left and right arrow keys changes the lifetime of all the circles globally.
 *
 * Challenge answered by Jessica Fenlon : add mouse interactivity - if clicking on left side of screen,
 * rate increases. If clicking on right side of screen, rate decreases.
 *
 * Additional editing for aesthetic purposes ~ to pull 'clouds' . . . :)
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {

  // edited display size down to suit web hosting -
  size(800, 500);

  frame_rate_value = 20;
  rectMode(CENTER);
  background(#0074FF);
}


void draw() {

  background(#0074FF);

  int num = 20;
  int margin = 0;
  float gutter = -2; //distance between each cell
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
  
    // Save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("drawclose-clouds-.jpg");
  }
} //end of draw 

void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 1.42 * sin(circleAge * HALF_PI);

  strokeWeight(8);
  stroke(41, 106, 183, lerp(0, 116, circleAge));
  fill(lerp(128, 255, circleAge), lerp(120, 255, circleAge));
  ellipse(x-size/3, y-size/3, circleSize, circleSize);
}
/*
 *mouseClicked function
 */
 
 void mouseClicked() {
   if (mouseX <= (800/2) && frame_rate_value < 120) {
    frame_rate_value++;
   } else {
    frame_rate_value--;
  }
 }
   

/*
 * keyReleased function
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

