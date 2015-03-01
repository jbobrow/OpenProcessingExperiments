
int xSize = 600;
int ySize = 600;
boolean done = false;
color[] worldChampionshipColors = new color[6];
int colorIndex = 0;
int wheelToTyreSizeRatio = 10;
int wheelToHubSizeRatio = 40;
int wheelToSpokeSizeRatio = 200;
int numberOfSpokes = 24;

void setup() {
  background(#FFFFFF);
  fill(#FFFFFF, 0);
  size(xSize, ySize);
  frameRate(5);
  initialiseWorldChampionshipColors();
}

void initialiseWorldChampionshipColors() {
  worldChampionshipColors[0] = color(0, 97, 255);
  worldChampionshipColors[1] = color(255, 0, 0);
  worldChampionshipColors[2] = color(0, 0, 0);
  worldChampionshipColors[3] = color(238, 245, 0);
  worldChampionshipColors[4] = color(4, 111, 0);
  worldChampionshipColors[5] = color(255, 255, 255);
}

void draw() {
  stroke(generateRandomWorldChampionshipColor());
  int wheelSize = generateRandomWheelSize();
  int x = generateRandomX();
  int y = generateRandomY();
  drawTyre(x, y, wheelSize);
  drawHub(x, y, wheelSize);
  drawSpokes(x, y, wheelSize);
}

int generateRandomX() {
  return int(random(xSize));
}

int generateRandomY() {
  return int(random(ySize));
}

color generateRandomWorldChampionshipColor() {
  colorIndex = colorIndex == worldChampionshipColors.length ? 0 : colorIndex;
  return worldChampionshipColors[colorIndex++];
}

void drawTyre(int wheelPlotX, int wheelPlotY, int wheelSize) {
  fill(#FFFFFF, 0);
  strokeWeight(wheelSize / wheelToTyreSizeRatio);
  ellipse(wheelPlotX, wheelPlotY, wheelSize, wheelSize);
}

void drawHub(int wheelPlotX, int wheelPlotY, int wheelSize) {
  int hubSize = wheelSize / wheelToHubSizeRatio;
  strokeWeight(wheelSize / wheelToHubSizeRatio);
  ellipse(wheelPlotX, wheelPlotY, hubSize, hubSize);
}

void drawSpokes(int wheelPlotX, int wheelPlotY, int wheelSize) {
  int halfWheelSize = wheelSize / 2;
  strokeWeight(wheelSize / wheelToSpokeSizeRatio);
  for (int spokeAngle = 0; spokeAngle < 360; spokeAngle += 360 / numberOfSpokes) {
    drawSpoke(wheelPlotX, wheelPlotY, halfWheelSize, spokeAngle);
  }
}

void drawSpoke(int wheelPlotX, int wheelPlotY, int halfWheelSize, int angle) {
  line(wheelPlotX + halfWheelSize * cos(angle * PI / 180), 
    wheelPlotY + halfWheelSize * sin(angle * PI / 180), 
    wheelPlotX + halfWheelSize * cos((angle + 180) * PI / 180), 
    wheelPlotY + halfWheelSize * sin((angle + 180) * PI / 180));
}

int generateRandomWheelSize() {
  return int(random(30, xSize / 10));
}
