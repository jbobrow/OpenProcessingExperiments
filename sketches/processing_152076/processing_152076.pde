

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {
  size(500, 500);

  frame_rate_value = 8;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);

  }


void draw() {
  background(255);

  int num = 30;
  int margin = 50;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      if ( circleNumber % 2==0) {
        movingCircle(tx, ty, cellsize, circleNumber);
      } else {
        movingCircle2(tx, ty, cellsize, circleNumber);
      }

      //    movingCircle(tx, ty, cellsize, circleNumber);
    }
  }

} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  fill(#346F9B, 130);  // blau #346F9B - dunkel;  #54b5ff - hell
  noStroke();
  ellipse(tempX, tempY, size/2, size/2);
}

void movingCircle2(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x - (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  fill(#ff5460, 130); // rot
  noStroke();
  rect(tempX, tempY, size/2.5, size/2.5);
}




