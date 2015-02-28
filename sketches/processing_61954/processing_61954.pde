
int step;

void setup() {
  size(400,400);
  background(0);
  noStroke();
//  smooth();
 
  step = (width - 40) / 10;
 

  for (int gridY = step; gridY <= width - step; gridY += step) {
    for (int gridX = step; gridX <= width - step; gridX += step) {      
      ellipse(gridX, gridY, 1, 1);
    }
  }
  saveFrame("screen.png");
}


