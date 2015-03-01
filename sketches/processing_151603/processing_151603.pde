
/*
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Indae Hwang and Jon McCormack
 * Edited by Jessica Fenlon to meet the challenge
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {
  size(600, 600);

  frame_rate_value = 13;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(#DBB1CC);

 int num = 10;
  int margin = -2;
  float gutter = -2; //distance between each cell
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


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 3) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 3) * cos(PI / frame_rate_value * finalAngle);

 noStroke();
  fill(222,13, 146, 120);
    rect(tempX+26, tempY+34, size/1, size/1);
      fill(250, 230, 242, 180);
  rect(tempX+24, tempY+32, size/1.25, size/1.25);
    fill(222,13, 146, 120);
  rect(tempX+20, tempY+28, size/2, size/2);
          fill(255, 8, 165, 180);
        rect(tempX+12, tempY+20, size/3, size/3);

  stroke(0);
  stroke(222,13, 146);

}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value--;
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
  
  // Save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("relay-.jpg");
  }
}

