
int detail;
int quality;

void setup() {
  detail = 2; //Int between 1 (lowest) and 5 (highest)
  quality = 1; //Int between 1 (lowest) and 3 (highest)
  size(600, 600);
  colorMode(HSB);
  noLoop();
  if (quality == 3) {
    smooth();
  }
  //Draw the image
  redraw();
}

void draw() {
  //Get current time for draw time calculation
  float startTime = millis();
  
  //Draw the sky
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < 400; y++) {
      stroke(160, noise(x*0.02, y*0.02)*255, 255);
      point(x, y);
    }
  }

  //Draw the ground
  for (int x = 0; x < width; x++) {
    for (int y = 400; y < height; y++) {
      stroke(80, 255, noise(x*0.01, y*0.01)*50+100);
      point(x, y);
    }
  }

  //Draw the grass
  drawGrass(0, 400, width, height);
  
  //Draw trees
  drawTree(100, 500, 60);
  
  println("Time taken to draw: " + (millis()-startTime) + "ms");
}

void drawGrass(int startX, int startY, int endX, int endY) {
  noStroke();
  for (int x = startX; x < endX; x+=6-detail) {
    for (int y = startY; y < endY; y+=6-detail) {
      fill(80, 255, random(100, 150), random(100, 150));
      drawBlade(x, y);
    }
  }
}

void drawBlade(int x, int y) {
  triangle(x-2, y+random(-1, 2), x+2, y+random(-1, 2), x+random(-3, 3), y-random(6, 12));
}

void drawTree(int x, int y, int treeSize) {
  fill(5,200,100);
  rect(x-treeSize/6,y,treeSize/3,treeSize/2.5);
  fill(60,200,100);
  triangle(x-treeSize,y,x+treeSize,y,x,y-treeSize*5);
  if (detail >= 4) {
    //draw grass at base of tree
  }
}

