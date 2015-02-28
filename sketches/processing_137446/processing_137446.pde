
/* @pjs preload="flowers.png, gioconda.png, girasole.png, stars.png, sunday.png, twilight.png"; */

import processing.opengl.*;

float timeX, timeY;
PImage img;

int[][][] colorMatrixRemap;
int[] colorMatrixHuePyramid;
int[] hueVal;
int mapWidth, mapHeight;

int dimension = 240;          //dimension of the 3D Matrix
public int count = 24;        //Subdivions of the 3D Matrix
int mappingSpeed = 256;       //pixel analysed per second during the animated analysis
boolean isMapping = true;

public int currentImg = 2;
public int visMode = 0; //0: RGB Cubes, 1: HUE Steps

int currentPixelX = 0, currentPixelY = 0, currentPixel = 0;

float hueMax = 0, cubeRgbMax = 0;

void setup() {
  frameRate(60);
  setSubdivisions(24);

  size(1000, 500, OPENGL);
  perspective();
  //ortho(0, width, 0, height); //ortho doesn't work in JavaScript mode!

  startProcess();

  timeX = -PI/2;
  timeY = -PI/8;
}

void changeVisMode() {
  if (visMode == 0) {visMode = 1;}
  else {visMode = 0;}
}

void setCurrentImg(int theimg) {
  currentImg = theimg;
}

void setSubdivisions(int subds) {
  if (visMode == 0) {
    count = subds / 2;
  } 
  else {
    count = subds * 2;
  }
}

void startProcess() {
  pickImage(currentImg);

  colorMatrixRemap = new int[count][count][count];
  colorMatrixHuePyramid = new int[count];
  hueVal = new int[360];

  currentPixel = 0;
  currentPixelX = 0;
  currentPixelY = 0;
  cubeRgbMax = 0;
  hueMax = 0;
}

void draw() {
  if (visMode == 1) {background(0, 0, map(230, 0, 255, 0, 100));}
  else {background(230);}
  
  noSmooth();

  readPixels(true, mappingSpeed);

  //timeX += map(mouseX, 0, width, -0.02, 0.02);
  //timeY += map(mouseY, 0, height, -0.01, 0.01);
  timeX += 0.01;

  // Image
  pushMatrix();
  translate(width/2 - width/4, height/2, 0);

  stroke(255);
  if (isMapping) {
    line(-dimension/2 + map(currentPixelX, 0, img.width, 0, dimension), -dimension/2, -dimension/2 + map(currentPixelX, 0, img.width, 0, dimension), dimension/2);
    line(-dimension/2, -dimension/2 + map(currentPixelY, 0, img.height, 0, dimension), dimension/2, -dimension/2 + map(currentPixelY, 0, img.height, 0, dimension));
  }

  fill(255); //ProcessingJS needs this or the image gets tinted red(?).
  img.resize(dimension, dimension);
  image(img, -dimension/2, -dimension/2);
  popMatrix();

  // 3D
  pushMatrix();
  translate(width/2 + width/4 - 64, height/2 - 32, 0);

  rotateX(timeY);
  rotateY(timeX);

  drawPanels(dimension); 
  drawStructure(visMode);
  popMatrix();
}

void pickImage(int imgNumber) {
  switch(imgNumber) {
  case 0: 
    img = loadImage("gioconda.png"); 
    break;  
  case 1: 
    img = loadImage("stars.png"); 
    break;  
  case 2: 
    img = loadImage("twilight.png"); 
    break;  
  case 3: 
    img = loadImage("sunday.png"); 
    break;
  }
}

public void drawStructure(int visualizationMode) {
  switch(visualizationMode) {
  case 0: 
    drawElementsRemap(0, 0, 0, dimension, count, 24);
    break;
  case 1: 
    drawElementsPyramidHue(0, 0, 0, dimension, count, 24);  
    break;
  }
}

// Saves the image when "S" is pressed
void keyPressed() {
  if (key == 's') {
    save("normal.png");
  }
  if (key == CODED) {
    switch (keyCode) {
    case LEFT: 
      timeX -= 0.1; 
      break;

    case RIGHT: 
      timeX += 0.1; 
      break;
    }
  }
}

void readPixels(boolean _animated, int _animSpeed) {
  if (currentPixel < img.width * img.height) {
    // Animated
    if (_animated) {
      isMapping = true;
      for (int i = 0; i < _animSpeed; i++) {
        readPixelsAnimated(count, currentPixelX, currentPixelY);
        currentPixel += 1;
        currentPixelX = currentPixel % img.width;
        currentPixelY = int(floor(currentPixel / img.height));
        //print("Total: " + currentPixel + ", X: " + currentPixelX + ", Y: " + currentPixelY + "\n");
      }
    }
    // Instant
    else {
      for (int i = 0; i < img.width * img.height; i++) {
        if (currentPixel < img.width * img.height) {
          readPixelsAnimated(count, currentPixelX, currentPixelY);
          currentPixel += 1;
          currentPixelX = currentPixel % img.width;
          currentPixelY = int(floor(currentPixel / img.height));
        }
      }
    }
  } 
  else isMapping = false;
}

public void ChangeVisualization(int theValue) {
  if (visMode < 1) {
    visMode = 1;
    count = 48;
  } 
  else {
    visMode = 0;
    count = 12;
  }  
  start();
}

public void ChangeImage(int theValue) {
  if (currentImg < 3) {
    currentImg += 1;
  } 
  else {
    currentImg = 0;
  }
  start();
}


// read color values of the image and store them in different arrays
void readPixelsRemap(int count) {
  color currentCol;
  float r, g, b;
  int buffer = 0;
  int pxHue = 0;
  float currentValue;
  for (int i = 0; i < img.width; i++) {
    currentPixelX = i;
    for (int j = 0; j < img.height; j++) {  
      currentPixelY = i;

      currentCol = img.get(i, j);  
      r = red(currentCol);
      g = green(currentCol);
      b = blue(currentCol);
      pxHue = int(hue(currentCol));

      // RGB Cube Matrix
      if (i % count == 0 && j % count == 0) { //if both are on the countTh pixel
        colorMatrixRemap[int(map(r, 0, 255, 0, count-1))][int(map(g, 0, 255, 0, count-1))][int(map(b, 0, 255, 0, count-1))]  += buffer;
        currentValue = colorMatrixRemap[int(map(r, 0, 255, 0, count-1))][int(map(g, 0, 255, 0, count-1))][int(map(b, 0, 255, 0, count-1))];
        //Sets new max value
        cubeRgbMax = getMaxValue(cubeRgbMax, currentValue);
        buffer = 0;
      }
      else {
        buffer +=1;
      }

      // Hue Pyramid Matrix      
      colorMatrixHuePyramid[int(map(pxHue, 0, 360, 0, count))] += 1;
      currentValue = colorMatrixHuePyramid[int(map(pxHue, 0, 360, 0, count))];
      //Sets new max value
      hueMax = getMaxValue(hueMax, currentValue);

      // increase whole hue array for debug purposes
      hueVal[pxHue] ++;
    }
  }
}

void readPixelsAnimated(int count, int currentPixelX, int currentPixelY) {
  color currentCol = 0;
  float r, g, b;
  int pxHue = 0;
  float currentValue = 0;

  currentCol = img.get(currentPixelX, currentPixelY);  
  r = constrain(red(currentCol), 0, 255);
  g = constrain(green(currentCol), 0, 255);
  b = constrain(blue(currentCol), 0, 255);
  pxHue = int(hue(currentCol));
  
  colorMatrixRemap[floor(map(r, 0, 255, 0, count-1))][floor(map(g, 0, 255, 0, count-1))][floor(map(b, 0, 255, 0, count-1))]  += 1;
  currentValue = colorMatrixRemap[floor(map(r, 0, 255, 0, count-1))][floor(map(g, 0, 255, 0, count-1))][floor(map(b, 0, 255, 0, count-1))];
  //Sets new max value
  cubeRgbMax = getMaxValue(cubeRgbMax, currentValue);

  // Hue Pyramid Matrix      
  colorMatrixHuePyramid[int(map(pxHue, 0, 360, 0, count))] += 1;
  currentValue = colorMatrixHuePyramid[int(map(pxHue, 0, 360, 0, count))];
  //Sets new max value
  hueMax = getMaxValue(hueMax, currentValue);
}

float getMaxValue( float _oldValue, float _newValue) {
  if (_newValue > _oldValue) {
    return _newValue;
  }
  else return _oldValue;
}

void drawPanels(int size) {    
  rectMode(CENTER);
  stroke(100);
  noFill();  

  fill(220);
  pushMatrix();
  translate(0, size/2, 0);
  rotateX(PI/2);
  drawGrid(0, 0, size, 12);
  rect(0, 0, size, size);
  popMatrix();
  noFill();

  pushMatrix();
  translate(-size/2, 0, 0);
  rotateY(PI/2);
  drawGrid(0, 0, size, 12);
  rect(0, 0, size, size);
  popMatrix();

  pushMatrix();
  translate(0, 0, -size/2);
  rotateZ(PI/2);
  drawGrid(0, 0, size, 12);
  rect(0, 0, size, size);
  popMatrix();
}

void drawGrid(int _x, int _y, int size, int count) {
  for (int i = 0; i < count; i++) {
    for (int j = 0; j < count; j++) {
      point((_x - size/2) + i * (size/count), (_y - size/2) + j * (size/count));
    }
  }
}

void drawElementsRemap(int _x, int _y, int _z, int size, int count, int scale) {
  int snap = size/count;
  float scaleValue = (cubeRgbMax) / (size);
  float sizeValue;

  for (int i = 1; i < count; i++) {
    for (int j = 1; j < count; j++) {
      for (int k = 1; k < count; k++) {
        pushMatrix();

        // move to center of each "slot"
        translate((_x - size/2) + i * (size/count), (_y - size/2) + j * (size/count), (_z - size/2) + k* (size/count));

        // get the color by mapping the current slot against the color array
        colorMode(RGB, 255);
        fill(map(i, 0, count, 0, 255), map(j, 0, count, 0, 255), map(k, 0, count, 0, 255));
        stroke(map(i, 0, count, 0, 128), map(j, 0, count, 0, 128), map(k, 0, count, 0, 128));

        // draw a cube if bigger than treshold value
        //box(map(colorMatrixRemap[i][j][k], 0, cubeRgbMax, 0, cubeRgbMax/scaleValue/count));
        sizeValue = constrain(colorMatrixRemap[i][j][k]/count, 0, size/count);
        if (sizeValue > 0) {
          box(sizeValue);
        }
        popMatrix();
      }
    }
  }
}

void drawElementsPyramidHue(int _x, int _y, int _z, int size, int count, int scale) {
  float stepSize;
  float scaleValue = (hueMax) / (size/1.5);
  for (int i = 0; i < count; i++) {
    pushMatrix();

    // move to center of each "slot"
    translate(_x, (_y - size/2) + i * (size/count), _z);

    // get the color by mapping the current slot against the color array
    colorMode(HSB, 360, 100, 100);
    fill(map(i, 0, count, 0, 360), 90, 75);
    stroke(map(i, 0, count, 0, 360), 90, 25);
    
    // draw a cube if bigger than treshold value
    //stepSize = constrain(map(colorMatrixHuePyramid[i], 0, size*size, 0, size/2), 0, size);
    stepSize = map(colorMatrixHuePyramid[i], 0, hueMax, 0, hueMax/scaleValue);
    if (stepSize > 0) {
      box(stepSize, size/count, stepSize);
    }

    popMatrix();
  }
}

void drawHueLines(int _x, int _y) {
  for (int i = 0; i < 360; i++) { 
    colorMode(HSB, 360, 100, 100);
    stroke(i, 100, 100);
    line(_x - i, _y - (360/2), _x - i, _y - (360/2) + hueVal[i]/10);
  }
}



