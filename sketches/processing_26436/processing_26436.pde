
float backgroundColour = 255;
float circleStroke = 0;
float rectFill = 175;
float circleFill = 255;
float measureX = 75;
float measureY = 100;
float measureZ = 175;
float change = 0.5;

void setup() {
  size(200, 200); 
}

void draw() {
  background(255);
  stroke(0);
  rectMode(CENTER);
  fill(rectFill);
  rect(measureY, measureY, measureZ, measureZ);
  fill(circleFill);
  ellipse(measureY, measureY, measureX, measureX);
  
  measureX = measureX + change/2;
  circleFill = circleFill - change*1.5;
}

