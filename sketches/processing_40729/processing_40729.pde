
int maxDepth;
int thickness;
int leavesMethod;
boolean highQuality;

void setup() {
  size(600, 600);
  noLoop();
  maxDepth = 6;
  thickness = maxDepth + 2;
  leavesMethod = 2;
  highQuality = true;
  //Draw the image
  redraw();
}

void draw() {
  //Get current time for draw time calculation
  float startTime = millis();

  drawTree(width/2, height*0.75);

  println("High Quality " + (highQuality ? "on" : "off"));
  println("Leaves Method " + leavesMethod);
  println("Time taken to draw: " + (millis()-startTime) + "ms");
}

void drawTree(float x, float y) {
  drawTree(int(x), int(y));
}

void drawTree(int x, int y) {
  drawBranch(x, y, 270, int(random(20, 30)), 60, 1);
}

void drawBranch(int startX, int startY, int direction, int craziness, int maxLength, int depth) {
  for (int i = 0; i < depth; i++) {
    strokeWeight(thickness-depth);
    stroke(#391605);
    direction += random(-craziness, craziness);
    float ang = (direction) * PI / 180;
    int endX = (int)(startX+cos(ang)*maxLength);
    int endY = (int)(startY+sin(ang)*maxLength);
    line(startX, startY, endX, endY);
    if (depth < maxDepth) {
      drawBranch(endX, endY, direction, int(craziness*1.1), int(maxLength*0.85), depth+1);
    } 
    else {
      drawLeaves(endX, endY);
    }
  }
}

void drawLeaves(int x, int y) {
  int sizeX;
  switch (leavesMethod) {
  case 0:
    noStroke();
    sizeX = (int)random(30, 50);
    int sizeY = (int)random(30, 50);
    //the less perfect the circle, the more transparent the "leaf"
    fill(#195508, abs(sizeX-sizeY)*20);
    ellipse(x, y, (int)random(40, 60), (int)random(40, 60));
    break;
  case 1:
    noStroke();
    fill(#195508);
    sizeX = (int)random(5, 10);
    ellipse(x, y, sizeX, sizeX);
    break;
  case 2:
    noStroke();
    fill(#195508, 50);
    sizeX = (int)random(40, 60);
    ellipse(x, y, sizeX, sizeX);
    break;
  }
}

void keyPressed() {

  switch (key) {
  case ' ':
    fill(#CCCCCC);
    rect(0, 0, width, height);
    redraw();
    break;
  case 'l':
    if (++leavesMethod > 2) {
      leavesMethod = 0;
    }
    break;
  case 'q':
    if (highQuality) {
      highQuality = false;
    } 
    else {
      highQuality = true;
    }
    break;
  }
}


