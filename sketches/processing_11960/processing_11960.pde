
/*
  Patern 2: Regular grid using a for loop
 */

float objectSize = 40;
int heightCount = 40;
int widthCount = 40;

void setup() {
  size(640, 480);
  smooth();
  
  drawGrid();

}

void draw() {
  //nothing to do here right now 
}

void drawGrid() {
  background(map(0, -49, widthCount + heightCount, 0, 235), 100, 250);
  noFill();
  //fill(128);
  
  for (int j = 1; j < heightCount; j = j + 1) {
    for (int i = 1; i < widthCount; i = i + 1) {
      stroke(map(i+i,0, width, 120, 200), 100, 250);
      ellipse(map(i, 0, widthCount, 0, width),
              map(j, 0, heightCount, 0, height),
              width / widthCount, height / heightCount);
    }
  }
}

void mouseMoved() {
  widthCount = floor(map( mouseX, 0, width, 0, 60));
  heightCount = floor(map( mouseY, 0, height, 0, 40));
  drawGrid();
 
}



