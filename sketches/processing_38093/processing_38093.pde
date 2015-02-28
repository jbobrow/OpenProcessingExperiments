
float circleX = 0;
float circleY = 0;
float circleW = 100;
float circleH = 100;
float circleStroke = 255;
float circleFill = 0;
float backgroundColor = 255;
float change = 0.5;

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {
  stroke(circleStroke);
  fill(circleFill);
  ellipse(circleX+150, circleY+150, circleW+150, circleH+150);
  ellipse(circleX+150, circleY+450, circleW+150, circleH+150);
  ellipse(circleX+450, circleY+150, circleW+150, circleH+150);
  ellipse(circleX+450, circleY+450, circleW+150, circleH+150);

  
  circleW = circleW - change; 
  circleH = circleH - change;
}


