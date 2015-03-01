
float circleX = 100;
float circleY = 100;
float circleW = 220;
float circleH = 400;
float circleStroke = 255;
float strokeSize = 1; 
float circleFill = 0;
float backgroundColor = 255;
float change = 1;

float otherChange = 5; 

void setup() {
  size(800,600);
  noSmooth(); 
}

void draw() {
 
  background(backgroundColor);
  stroke(circleStroke);
  strokeWeight(strokeSize);
  fill(circleFill);
  rect(circleX,circleY,circleW,circleH);
  rect(400,100,circleW,circleH);
  
  
  
  circleH = circleH - change;
 
}




