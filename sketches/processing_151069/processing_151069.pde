
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
void movingCircle(float x, float y, float size, int circleNum) {
  float finalAngle;
  finalAngle = frameCount + circleNum*mouseX;
  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);
  noStroke();
  fill(0);
  rect(tempX, tempY, size/5, size/5);
  rect(tempX, tempY, 1, size*5);
  stroke(0);
  noFill();
  stroke(0);
  line(x, y, tempX, tempY);
}
void keyReleased() {
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value++;
  }
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value--;
  }
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
}
