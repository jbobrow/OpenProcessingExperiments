
float xOffset = 25;
float yOffset = 25;

float xScale = 10;
float yScale = 10;

float xCount;
float yCount;

int pointColor = color(27, 25, 9);

void setup() {
  size (550, 550);
  stroke(pointColor);
  strokeWeight(4);
  xCount = (width-xOffset*2)/xScale;
  yCount = (height-yOffset*2)/yScale;
}

void draw() {
  background(color(245,247,232));

  for (int y=0; y<yCount; y++) {
    for (int x=0; x<=xCount; x++) {
      float xWaveScale = map (mouseX, 0, width, 0.5, 10.0);
      float yWaveScale = map (mouseY, 0, height, 0.5, 10.0);
      float xShift = sin((y*x+frameCount/2.0)/xWaveScale)*xScale/2;
      float yShift = sin((y+x+frameCount/3.0)/yWaveScale)*yScale/2;
      point (xOffset+x*xScale+xShift, yOffset+y*yScale+yShift);
    }
  }
}
