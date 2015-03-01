
void setup() {
  size(500, 500);

  frame_rate_value = 10;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(#F207EF);
}


void draw() {

  background(#3D07F2);

  int num = 25;
  int margin = 10;
  float gutter = 5; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 5) ) / (num - 5);

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
  float tempX = x + (size / 5) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 3) * cos(PI / frame_rate_value * finalAngle);

  noStroke();
  fill(#02D819);
  rect(tempX, tempY, size/9, size/5);
  rect(tempX, tempY, 1, size*9);
  stroke(3);
  fill(#11791C);
  stroke(0);
  line(x, y, tempX, tempY);
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
}

