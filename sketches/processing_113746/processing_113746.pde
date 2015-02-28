
final float TEMPO = 120;

int originX;
int originY;
float baseLeftWidth;
float baseRightWidth;
float baseHeight;
float degPerFrame;
float strokeHue;

void setup()
{
//  size(1280, 720);
  size(640, 360);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  frameRate(12);

  originX = width / 3 * 2;
  originY = height / 3 * 2;
  final float unitX = originX / 3;
  final float unitY = originY / 3;
  baseLeftWidth = unitX * 2;
  baseRightWidth = unitX;
  baseHeight = unitY;

  degPerFrame = (60.0 / frameRate) * (TEMPO / 30);

  background(0);
  strokeHue = 240;
}

void draw()
{
  noStroke();
  fill(0, 4);
  rect(0, 0, width, height);

  noFill();
  strokeWeight(width / 640);
  translate(originX, originY);
  
//  float step = 0.1 + (frameCount * 0.005);
  final float step = 0.2;
  
  float leftWidth = baseLeftWidth;
  float rightWidth = baseRightWidth;
  float arcHeight = baseHeight;
  while (8 < leftWidth && 8 < rightWidth && 8 < arcHeight) {
    drawArc(leftWidth, rightWidth, arcHeight);
    leftWidth *= (1 - step);
    rightWidth *= (1 - step);
    arcHeight *= (1 - step);
  }
  
  leftWidth = baseLeftWidth;
  rightWidth = baseRightWidth;
  arcHeight = baseHeight;
  for (int count = 0; count < 15; count++) {
    leftWidth *= (1 + step);
    rightWidth *= (1 + step);
    arcHeight *= (1 + step);
    drawArc(leftWidth, rightWidth, arcHeight);
  }
  strokeHue += (frameRate / 24.0) / 4;
  if (360 <= strokeHue) {
    strokeHue -= 360;
  }
}
void drawArc(float leftWidth, float rightWidth, float arcHeight)
{
  stroke(strokeHue, 33, 100, 33);
  pushMatrix();
  rotate(radians((frameCount * degPerFrame) % 360));
  arc(0, 0, leftWidth, arcHeight, PI / 2, PI);
  arc(0, 0, leftWidth, arcHeight, PI, PI + PI / 2);
  arc(0, 0, rightWidth, arcHeight, PI + PI / 2, TWO_PI);
  arc(0, 0, rightWidth, arcHeight, 0, PI / 2);
  popMatrix();
}


