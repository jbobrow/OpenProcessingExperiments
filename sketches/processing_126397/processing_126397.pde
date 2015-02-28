
//Random

float circleX;
float circleY;
float strokecolorR;
float strokecolorG;
float strokecolorB;

void setup () {
  size (640, 360);
  background(255);
}

void draw() {

  circleX= random(width);
  circleY= random(height);
  strokecolorR = random (0, 255);
  strokecolorG = random (0, 255);
  strokecolorB = random (0, 255);

  stroke(strokecolorR, strokecolorG, strokecolorB);
  fill(strokecolorR, strokecolorG, strokecolorB);
  ellipse (circleX, circleY, 10, 10);
}
