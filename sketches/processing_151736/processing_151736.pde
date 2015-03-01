
/*
 * Futurelearn | Creative Coding
 * Week 2 - 12th June 2014
 * Emergent
 * by Chris Dymond (c)
 *
 * This program created a grid of rotating points and draws virtical lines and semi-transparent circles
 * centred on them. You can change the framerate by using the left and right mouse button, and as the
 * framerate changes different patterns emerge. This exercise is intended to demonstrate "emergence"
 * - complex patterns that emerge from simple procedures.
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {
  size(500, 500);

  frame_rate_value = 6;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(255);

  int num = 30;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; 

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber,i,j);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum, int column, int row) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);
  int fillColour = (int) map(row*column, 0, 900, 0, 255);

  noStroke();
  colorMode(HSB);
  fill(fillColour,200,200);
  rect(tempX, tempY, 2, size*5);
  fill(fillColour,200,200,40);
  ellipse(tempX,tempY,70,70);
}


/*
 * mouseClicked function
 *
 * called automatically by Processing when a mouse button is pressed and released
 */
void mouseClicked() {

  if ( mouseButton == LEFT && frame_rate_value > 1 && mouseX < (width/2)) {
    frame_rate_value--;
  } 
  
  if ( mouseButton == LEFT && frame_rate_value > 1 && mouseX > (width/2)) {
    frame_rate_value++;
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
}
