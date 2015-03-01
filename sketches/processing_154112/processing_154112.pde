
int quadDepth = 9;
int currentDepth = 0;
int currentX = 0;
int sizeInPixels = (1 << quadDepth);
boolean rotateMode = false;
int shimmySize = 0;
PImage myImg;

void setup() {
  myImg = loadImage("DSC01533.jpg");

//  size(sizeInPixels, sizeInPixels);
  size(512,512);
  background(0);
}

void draw() {
  int pSize = sizeInPixels / (1 << currentDepth);
  color pixelColour = getDepthPixel(currentX, myY, currentDepth);
    
  if (currentDepth == quadDepth) {
    // Finesse an extra run with rectangular "pixels"
    pSize = 1;
  }
  
  if (rotateMode) {
    translate(width/2,height/2);
    rotate(frameCount);
    translate(-width/2,-height/2);
  }

  for (int myY=0; myY<sizeInPixels; myY+=pSize) {
    int tempX = currentX;
    int tempY = myY;
    
    if (currentDepth == quadDepth) {
      // Finesse an extra run with rectangular "pixels"
      pixelColour = getDepthPixel(currentX, myY, quadDepth-1);
    }
    else {
      // Normal mode - elliptical "pixels"
      pixelColour = getDepthPixel(currentX, myY, currentDepth);
    }
    
    tempX += int(shimmySize*pSize*sin(frameCount));
    tempY += int(shimmySize*pSize*cos(frameCount));
    
    noStroke();
    fill(pixelColour, 1<<currentDepth);
    if (currentDepth < quadDepth) {
      ellipse((int(tempX/pSize) * pSize) + pSize/2, (int(tempY/pSize) * pSize) + pSize/2, pSize, pSize);
    }
    else {
      rect((int(tempX/pSize) * pSize), (int(tempY/pSize) * pSize), pSize, pSize);
    }
  }
  
  currentX += pSize;
  if (currentX >= sizeInPixels) {
    currentX = 0;
    currentDepth++;

    if (currentDepth > quadDepth) {
      currentDepth = 0;
    }
  }
}

color getDepthPixel(int x_, int y_, int pDepth_) {
  int quadSize = sizeInPixels / (1 << (pDepth_));
  int xOffset = int(x_ / quadSize)*quadSize + quadSize/2;
  int yOffset = int(y_ / quadSize)*quadSize + quadSize/2;

  return getPixel(xOffset, yOffset);
}

color getPixel(int x_, int y_) {
  return myImg.get(x_, y_);
}

void keyReleased() {
  if (key == 'r') {
    rotateMode = !rotateMode;
  }
  if (key == 'c') {
    background(0);
    currentDepth = 0;
    currentX = 0;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    shimmySize--;
  }
  if (keyCode == RIGHT) {
    shimmySize++;
  }
  shimmySize = constrain(shimmySize, 0, 32);
}



