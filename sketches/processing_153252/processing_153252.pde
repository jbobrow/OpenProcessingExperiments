
// Spiral002

// change values here
float rotateAngle = 0.75;
float rotateAngleInc = 0.001;
int xOffset = 45;
float angleInc = 20.85;
float multipler = 2.45;
int circleCount = 1000;
int bubbleSize = 32; // lower value will make the bubbles bigger.

void setup()
{
  size(400, 400);
  smooth();
  noStroke();
  frameRate(12);
}

void draw()
{
  background(128);
  int angle = 0;
  translate(width/2, height/2);
  for (float i = 0; i < circleCount; i+=1)
  {
    rotate(rotateAngle);
    color c1 = color(random(128, 255), random(128, 255), random(128, 255), map(i, 0, circleCount, 255, 0));
    fill(c1);
    ellipse(i*multipler/8+xOffset, 0, sin(radians(angle))+angle/bubbleSize, cos(radians(angle))+angle/bubbleSize);
    if (angle < 360) angle+=angleInc;
    else angle = 0;
  }
  if (rotateAngle <= 360) rotateAngle+=rotateAngleInc;
  else rotateAngle = 0;
}
