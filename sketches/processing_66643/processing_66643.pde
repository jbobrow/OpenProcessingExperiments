
/* Rotation code: http://processing.org/learning/transform2d/ 
 Class notes from Day 6
 Homework for tonight:
Create a function, and use it multiple times.
Each time change at least one variable (color, size, position, speed etc.)

Extra points for creating animation or using mouse interaction
 */

void setup() {

  size(1000, 1000);
  background(255);
  smooth();
  frameRate(3); //slowing frame down to see it properly 
}

void draw() {
  //circle according to width from sketch 
  for (int i = 1; i < width; i++) {
    //color rotation changing 
    drawCircle(i*i, i*i, i*i, color(frameCount * 3 % 255, frameCount * 5 % 255,
      frameCount * 7 % 255));
    translate(50, 50); //still not sure waht this is
    rotate(radians(frameCount * 10  % 360)); //turnning 360
  }
}

void drawCircle(float circX, float circY, int diameter, color c) {

  noFill();
  stroke(c);
  strokeWeight(10);
  rect(2, 10, diameter, diameter);
}


