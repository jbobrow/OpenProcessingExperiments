
float stepValue = 3;
float x, y;
int gridSize = 100;
float rad = 100;


void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  strokeWeight(0.5);
  smooth();
  stroke(0, 0, 255);


  for (int gridX = gridSize; gridX <= width-gridSize; gridX +=gridSize) {
    for (int gridY = gridSize; gridY <= height-gridSize; gridY +=gridSize) {

      rad = gridSize-10;
      for (float angle = 0; angle <= 360-stepValue; angle +=stepValue) {
        stroke(angle, 100, 100);
        float x = gridX + cos(radians(angle)) * 400;
        float y = gridY + sin(radians(angle)) * 400;

        line(gridX, gridY, x, y);
      }
    }
  }
  saveFrame("bing.png");
}


