
/*
  Patern 2: Regular grid using a for loop
 */

float objectSize = 40;
int heightCount = 40;
int widthCount = 40;

void setup() {
  size(640, 480);
  ellipseMode(CENTER);
  smooth();
  colorMode(HSB, 360, 255, 255);
  
  drawGrid();
}

void draw() {
  //nothing to do here right now
}

void drawGrid() {
  //background(128, 128, 100);
  noFill();
  //fill(128);

  for (int j = 1; j < heightCount; j = j + 1) {
    for (int i = 1; i < widthCount; i = i + 1) {
      
      if((widthCount % 2) == 0) {
        noStroke();
        fill(random(330, 360), random(50, 100), random(75, 200));
        rect(map(i, 0, widthCount, 75, width-75),
        map(j, 0, heightCount, 20, height-20),
        width / 50, height / 50);
        
      } else {
        
      noFill();
      stroke(map(i + j, 1, widthCount, 0, 50), 100, 0);
      rect(map(i, 0, widthCount, 75, width-75),
        map(j, 0, heightCount, 20, height-20),
        width / 50, height / 50);
//      ellipse(map(i, 0, widthCount, 75, width-75),
//        map(j, 0, heightCount, 20, height-20),
//        width / 50, height / 50);
//      noStroke();
//      fill(random(345, 320), random(100, 255), random(75, 200));
//      rect(random(0, 640), random(0, 480),  
//        width / widthCount, height / heightCount);
     }
  }
}
}

void mouseMoved() {
//  fill(random(300, 345), 100, 100);
  background(0, 0, 200); 
  widthCount = floor(map( mouseX, 0, width, 0, 40));
  heightCount = floor(map( mouseY, 0, height, 0, 40));
  //fill(random(0, 255), random(0, 255), random(0, 255));
  drawGrid();
}


