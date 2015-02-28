
/*
  Patern 2: Regular grid using a for loop
  but offsetting postition with random()
 */

float objectSize = 10;
int heightCount = 20;
int widthCount = 940;
int randomRange = -45;

void setup() {
  size(640, 480);
  ellipseMode(CENTER);
  smooth();
  
  drawGrid();

}


void draw() {
  //nothing to do here right now 
}


void drawGrid() {
  background(128, 128, 100);
  noFill();
  fill(128);
  
  for (int j = 5; j < heightCount; j = j + 1) {
    for (int i = 36; i < widthCount; i = i + 1) {
      stroke(map(i+ j, 0, widthCount + heightCount, 0, 255), 250, 20);
      rect(map(i, 0, widthCount, 0, width) + random(-randomRange, randomRange),
              map(j, 0, heightCount, 0, height) + random(-randomRange, randomRange),
              width / widthCount, height / heightCount);
    }
  }
}


void mouseMoved() {
  widthCount = floor(map( mouseX, 0, width, 0, 150));
  heightCount = floor(map( mouseX, 0, height, 0, 100));
  randomRange = mouseY;
  drawGrid();
}


