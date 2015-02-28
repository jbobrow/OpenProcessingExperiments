
final int tempo = 120;

int yUnit;
int xUnit;
float ns;
float lineColorHue;
float lineColorHueStep;
float bgColor;

void setup() {
  size(480, 480);
//size(1280, 720);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  frameRate(12);
  reset();

  lineColorHueStep = (frameRate * 60.0 / tempo);
  
  xUnit = width / 80;
  yUnit = height / 45;
}

void drawLine(float x, float lineHeight, float vr) {
  final float degStep = (lineHeight / yUnit);

  int deg = 90;
  beginShape();
  for (int y = -yUnit; y <= height + (yUnit * 2); y += yUnit) {
    curveVertex(x + vr * cos(radians(deg)), y);

    deg += degStep;
    if (360 <= deg) {
      deg -= 360;
    }
  }
  endShape();
}

void draw() {
  fill(30 * cos(radians(bgColor)), 4);
  bgColor += (frameRate * 60.0 / tempo) /32;
  if (360 <= bgColor) {
      bgColor -= 360;
  }
  
  noStroke();
  rect(0, 0, width, height);

  noFill();
  strokeWeight(width / 640);
  final float vr = width / (64 * noise(ns));
  float startLineColorHue = lineColorHue;
  for (int x = -xUnit * 2; x <= width + (xUnit * 2); x += xUnit) {
    stroke(startLineColorHue, 67, 100, 33);
    drawLine(x, height - (x / 2), vr);

    startLineColorHue += 0.5;
    if (360 <= startLineColorHue) {
      startLineColorHue -= 360;
    }
  }
  
  lineColorHue += lineColorHueStep;
  if (360 <= lineColorHue) {
      lineColorHue -= 360;
  }
  
  ns += 0.1;
}

void keyPressed()
{
  if (keyCode == ' ') {
    reset();
  }
  else if (keyCode == ENTER) {
    saveFrame();
  }
}

void mouseClicked()
{
  reset();
}

void reset()
{
    background(0);
    bgColor = 0;
    ns = random(100);
    lineColorHue = 224;
}


