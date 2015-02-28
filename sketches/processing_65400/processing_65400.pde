
//Growing Circles

float circleSize = 80;
float circleX = 100;
float circleY = 100;

void setup() {
  size(400, 400); 
  smooth();
}

void draw() {
  background(180, 150, 5);
  fill(0, 255, circleSize/2);
  //circles
  ellipse(circleX, 100, circleSize, circleSize);
  ellipse(circleX, circleY+200, circleSize, circleSize);
  ellipse(circleX+200, circleY, circleSize, circleSize);
  ellipse(circleX+200, circleY+200, circleSize, circleSize);
  circleSize = circleSize +0.5;
  
}
