
//-----GLOBALS-----------
int width = 640;
int height = 360;
int frameCounter = 0;
int frameCounterMax = 72;  // will run for this many frames before loop
int frameRateNum = 24;
int delayTime = 500;  // in ms
boolean firstRun = true;  // switches off delay after first run
//---
int centerX = width/2;
int centerY = height/2;
int drawX = centerX;
int drawY = centerY;
int circleSizeOrig = 0;
int circleSize = circleSizeOrig;
int circleSizeMax = 300;
int numCircles = 0;
int numCirclesMax = 1000;
int spread = 0;
int bgColor = 0;
int drawColor = 255;
int drawColorSpread = 50;
int splashComplexity = 1;  //splashComplexity must be >= 1;
int splashComplexityMax = 5;
//---
float baseFactor = 1;
float addFactor = 0.0001;  //changes image brightness at current settings
float v = 1.0/9.0;  //original float v = 1.0/9.0;
float[][] kernel = {  
  {
    v, v, v                }
  , {
    v, v, v                }
  , {
    v, v, v                }  
};
PImage img = createImage(width, height, RGB);

//--------MAIN------------------------

void setup() {
  size(width, height);
  smooth();
  frameRate(frameRateNum);
  clear();
}

void draw() {
  startDelay();
  setCenter();
  if (frameCounter < frameCounterMax) {
    //clear();
    drawStuff();
    effects();
    frameCounter++;
  } 
  else {
    reset2();
  }
}

//----------EXTRA-----------------------

void drawStuff() {  
  for (int i = 0; i < splashComplexity; i++) {
    int qq=constrain(int(random(255)), drawColor-drawColorSpread, drawColor+drawColorSpread);
    noStroke();
    fill(qq);
    while (numCircles < numCirclesMax) {
      ellipse(drawX, drawY, circleSize, circleSize);
      drawX += random(spread);
      drawX -= random(spread);
      drawY += random(spread);
      drawY -= random(spread);
      spread++;
      if (circleSize > 0) {
        circleSize--;
      }
      numCircles++;
    }
    reset();
  }
}

//---

void effects() {
  img = get(0,0,width,height);
  img.loadPixels();

  //.....begin effects.............

  for (int y = 1; y < img.height-1; y++) { // Skip top and bottom edges
    for (int x = 1; x < img.width-1; x++) { // Skip left and right edges
      float sum = 1; // Kernel sum for this pixel
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*width + (x + kx);
          // Image is grayscale, red/green/blue are identical
          float val = red(img.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sum += baseFactor * (kernel[ky+1][kx+1] * val);
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      img.pixels[y*img.width + x] = color(sum);
    }
  }
  // State that there are changes to img.pixels[]

  img.updatePixels();
  image(img, 0, 0); // Draw the new image
  //.....end effects.............
  baseFactor += addFactor;
}

//---

void clear() {
  background(bgColor);
}

//--

void reset() {
  numCircles=0;
  spread=0;
  drawX = centerX;
  drawY = centerY;
  circleSize = circleSizeOrig;
  if (circleSizeOrig < circleSizeMax) {
    circleSizeOrig++;
  }
  splashComplexity = 1 + int(random(splashComplexityMax - 1));
}

void reset2() {
  frameCounter = 0;
  numCircles=0;
  spread=0;
  drawX = centerX;
  drawY = centerY;
  circleSize = 0;
  circleSizeOrig = 0;
  numCircles = 0;
  splashComplexity = 1;
  baseFactor = 1;
  reCenter();
  clear();
}

void startDelay() {
  if (firstRun == true) {
    delay(delayTime);
    firstRun = false;
  } 
}

void setCenter() {
  if (mousePressed) {
    centerX = mouseX;
    centerY = mouseY;
    drawX = centerX;
    drawY = centerY;
  }
}

void reCenter() {
centerX = width/2;
centerY = height/2;
drawX = centerX;
drawY = centerY;
}

//-----------END------------------














