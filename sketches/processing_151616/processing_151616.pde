
/*
 * Modify the sketch to create a new emergent pattern generator by changing the code in the function movingCircle. You might choose to do one or both of the following:
 * add colour to the elements
 * change the graphics primitives drawn
 * For whatever changes you decide on, make sure they vary over each primitive, which means you’ll have to make use of the circleNum parameter passed to movingCircle. 
 * You’ll notice that this is added to the current frame (frameCount) and used to calculate the end position of a line size/2 units from the origin of the grid point.Modify the sketch to create a new emergent pattern generator by changing the code in the function movingCircle. You might choose to do one or both of the following:
 */

int frame_rate_value;

void setup() {
 size(500, 500);
 frame_rate_value = 9;
 frameRate(frame_rate_value);
 rectMode(CENTER);
 background(255);
}

void draw() {
 background(0);
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
 finalAngle = frameCount + circleNum;
 //the rotating angle for each tempX and tempY postion is affected by frameRate and angle; 
 float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
 float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);
 stroke(255);
 fill(random(0,6)*51,random(0,6)*51,random(0,6)*51);
 //float h = 0.5*sqrt(3)*size;
 //triangle(x, y, tempX+(size/2), tempY+h, tempX-(size/2), tempY+h);
 rect(tempX, tempY, size*.8, size*.8);
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


