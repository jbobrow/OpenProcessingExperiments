
void setup() {
size(500, 500);
smooth();
background(0);
noStroke();
}
void draw() {
  background(0);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  //strokeWeight(1);
  fill(255, 255, 255, 150);
  ellipse(250, 250, s*8.3, s*8.3);
  //strokeWeight(1);
  fill(255, 255, 255, 150);
  ellipse(250, 250, m*8, m*8);
  //strokeWeight(1);
  fill(255, 255, 255, 150);
  ellipse(250, 250, h*20, h*20);
}      
