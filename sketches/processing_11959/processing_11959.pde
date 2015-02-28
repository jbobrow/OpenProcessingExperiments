
/*
  Patern 2: Regular grid using a for loop
  but offsetting postition with random()
 */

float objectSize = 40;
int heightCount = 40;
int widthCount = 40;
int randomRange = 4;
int randomRange2 = 7;
color myColor;

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
  //fill(128);
  
  for (int j = 1; j < heightCount; j = j + 1) {
    //rect(random(widthCount), random(heightCount), 100, 300);
    for (int i = 1; i < widthCount; i = i + 1) {
      noFill();
      stroke(0, 0, 0);
      strokeWeight(random(0, 5));
      //stroke(map(i + j, 50, widthCount + heightCount, 0, 255), 200, 250);
      //color(myColor);
      //rect(random(widthCount), random(heightCount), 100, 300);
      ellipse(map(i, 0, widthCount, 0, width) + random(-randomRange, randomRange),
              map(j, 0, heightCount, 0, height) + random(-randomRange, randomRange),
              width / 10, height / 10);
      noStroke();
      fill(random(345, 320), random(100, 255), random(75, 200), 100);
      rect(map(i, 0, widthCount, 0, width-10) + random(-randomRange2, randomRange2),
        map(j, 0, heightCount, 0, height-10) + random(-randomRange, randomRange),  
        width / 10, height / 10);
    }
  }
}


void mouseMoved() {
  //strokeWeight(random(0, 5));
  //myColor = color(random(250, 300), random(0, 200), random(50, 100));
  widthCount = floor(map(mouseX, 0, width, 0, 40));
  heightCount = floor(map(mouseX, 0, height, 0, 40));
  randomRange = mouseY;
  drawGrid();
}


