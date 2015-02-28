

float circleX = 0;
float circleY = 0;
float circleW = 50;
float circleH = 100;
float circleStroke = 190;
float circleFill = 88;
float backgroundColor = 190;
float change = 0.5;

void setup () {
  size (200,200);
  smooth ();
}

void draw () {
  //draw the background and the ellipse
  background (backgroundColor);
  stroke (circleStroke);
  fill (circleFill);
  ellipse (circleX, circleY, circleW, circleH);
  
  //change the values of all variables
  
  circleX = circleX + change;
  circleY = circleY + change;
  circleW = circleW + change;
  circleH = circleH - change;
  circleStroke = circleStroke - change;
  circleFill = circleFill + change;
}

