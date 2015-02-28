
float backgroundColour = 255;
float circleStroke = 0;
float circleFill = 175;
float circleX = 50;
float circleY = 150;

void setup() {
  size(200, 200);  
}

void draw() {
  background(backgroundColour);
  stroke(circleStroke);
  fill(circleFill);
  ellipse(circleX, circleX, circleX, circleX);
  ellipse(circleY, circleX, circleX, circleX);
  ellipse(circleX, circleY, circleX, circleX);
  ellipse(circleY, circleY, circleX, circleX);
  
}
  



