
//Author: Liliam Rodas
//Purpose: Excersice to practice illustrated lines in Dehlinger's paper.
//Functioning: Shows lines with a hint of reality in order to represent grass.
//Reference: previous excercise provided in class and processing.



void setup() {
  size(300, 500);
  background(153,153,77);
  smooth();
  noLoop();
}
 
void draw() {
  float grassInitialPoint = random (10);
  float borderINscreen = 10;
  float x = width;
  float y =height- height/20;
 
  // draw grass positions
 
  for (x=borderINscreen; x<=width-borderINscreen; x+=grassInitialPoint) {
    point(x, y);
  }
 
  // draw grasses
  stroke(65,65,33,120);
  strokeWeight(1);
  for (x=borderINscreen; x<=width-borderINscreen; x+=grassInitialPoint) {
    float tipy = y - 20 - random(300);
    float tipx = x + random(150);
    float tipxx = x + random(-200);
     float tipyy = y - random(400);
    line(x, y, tipx, tipy);
    line(x, y, tipxx, tipyy);
  }
}

void keyPressed() {
  saveFrame("grass.jpg");
}

