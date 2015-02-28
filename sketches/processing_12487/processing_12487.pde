
/*
  Patern 2: Regular grid using a for loop
  but offsetting postition with random()
 */

float objectSize = 40;
int heightCount = 40;
int widthCount = 40;
int randomRange = 4;

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
  background(0, 0, 0);
  noFill();
  //fill(128);
  
  for (int j = 1; j < heightCount; j = j + 1) {
    for (int i = 1; i < 5; i = i + 1) {
      stroke(map(i + j, 1, widthCount + heightCount, 0, 250),0, 300);
      ellipse(map(i, 0, widthCount, 0, width) + random(-randomRange, randomRange),
              map(j, 0, heightCount, 0, height) + random(-randomRange, randomRange),
              width, height);
    }
  }
 
}


void mouseMoved() {
  widthCount = floor(map( mouseX, 0, width/2, 0, 10));
  heightCount = floor(map( mouseX, 0, height/4, 0, 20));
 // randomRange = mouseY;
  drawGrid();
}


