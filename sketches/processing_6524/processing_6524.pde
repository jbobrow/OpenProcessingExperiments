
/* 
 Based on sketch available at 
   http://www.processing.org/learning/basics/noise1d.html
 
 */

float xOffset = random(.5);
float yOffset = random(.5);
float xIncrement = random(0.05);
float yIncrement = random(0.05);

void setup() {
  size(200, 200);
  background(0);
  frameRate(30);
  smooth();
  noStroke();
}

void draw() {
  fill(0, 17);
  rect(0, 0, width, height);

  float noiseValueX = noise(xOffset)*width;
  float noiseValueY = noise(yOffset)*height;

  xOffset += xIncrement;
  yOffset += yIncrement;

  fill(255);
  ellipse(noiseValueX, noiseValueY, width/15, height/15);
}




