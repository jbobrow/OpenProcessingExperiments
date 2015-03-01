
// Spiral001

// change values here
float rotateAngle = 0.75;
float rotateAngleInc = 0.001;
int xOffset = 45;
float angleInc = 10.85;
float multipler = 2.45;
int circleCount = 50;

void setup()
{
  size(640, 480);
  smooth();
  noStroke();
  frameRate(12);
}

void draw()
{
  background(64);
  int angle = 0;
  translate(width/2, height/2);
  for (float i = 0; i < circleCount; i+=1) 
  {
    rotate(rotateAngle);
    if (i > xOffset) {
      color c1 = color(random(128,255), random(128, 255), random(128, 255), map(i, circleCount/2, circleCount, 255, 0));
      fill(c1);
      ellipse(i*rotateAngle*multipler, 0, sin(radians(angle))+random(25, 50), cos(radians(angle))+random(25, 50));
      angle+=angleInc;
    }
  }
  rotateAngle+=rotateAngleInc;
}


