
// ===================================
// Depth of Focus 2.0
// Copyright 2010 by Trevor Alyn
// ===================================

int screenWidth = 400;
int screenHeight = 400;
int backgroundColor = 0;

float x = screenWidth / 3;
float y = screenHeight / 4;
float speedX = 2;
float speedY = 3;

// Kernel for blurring
float v = 1.0/9.0;
float[][] kernel = { { v, v, v },
                     { v, v, v },
                     { v, v, v } };

// Color vars
boolean colorMutate = true;  // If true, color mutates gradually
float redDef;   // Red RGB component
float greenDef; // Green RGB component
float blueDef;  // Blue RGB component
float redMutate;   // Red component mutation speed
float greenMutate; // Green component mutation speed
float blueMutate;  // Blue component mutation speed
boolean redUp = true;   // Tracks direction of red component mutation
boolean greenUp = true; // Tracks direction of green component mutation
boolean blueUp = true;  // Tracks direction of red component mutation


void setup()
{
  size(screenWidth, screenHeight);
  smooth();
  randomizeColor();
  background(backgroundColor);
}


void randomizeColor()
{
  redDef = random(50, 255);
  greenDef = random(50, 255);
  blueDef = random(50, 255);
  redMutate = random(.5);
  greenMutate = random(.5);
  blueMutate = random(.5);
}

void draw()
{
  // Draw something on the screen
  if (random(1) < .5) {
    stroke(redDef, greenDef, blueDef, 255);
    fill(redDef, greenDef, blueDef, 40);
    float diameter = random(200);
    ellipse(x, y, diameter, diameter);
    x += 50 - random(100);
    y += 50 - random(100);
    if (x > screenWidth) { x = x - screenWidth; }
    if (x < 0) { x = x + screenWidth; }
    if (y > screenHeight) { y = y - screenHeight; }
    if (y < 0) { y = y + screenHeight; }
  }


  // Blur the current image
  PImage edgeImg = createImage(screenWidth, screenHeight, RGB);
  loadPixels();
  for (int y = 1; y < screenHeight - 1; y++) { // Skip top and bottom edges
    for (int x = 1; x < screenWidth - 1; x++) { // Skip left and right edges
      float sumRed = 0;
      float sumGreen = 0;
      float sumBlue = 0;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky) * screenWidth + (x + kx);
          float valRed = red(pixels[pos]);
          sumRed += kernel[ky+1][kx+1] * valRed;
          float valGreen = green(pixels[pos]);
          sumGreen += kernel[ky+1][kx+1] * valGreen;
          float valBlue = blue(pixels[pos]);
          sumBlue += kernel[ky+1][kx+1] * valBlue;
        }
      }
      edgeImg.pixels[y*screenWidth + x] = color(sumRed, sumGreen, sumBlue);
    }
  }
  edgeImg.updatePixels();
  image(edgeImg, 1, 1, screenWidth - 2, screenHeight - 2);


  // Mutate the color
  if (colorMutate) {
    if (redUp) {
      redDef += redMutate;
      if (redDef > 255) { redDef = 255; redUp = !redUp; }
    } else {
      redDef -= redMutate;
      if (redDef < 0) { redDef = 0; redUp = !redUp; }
    }
    if (greenUp) {
      greenDef += greenMutate;
      if (greenDef > 255) { greenDef = 255; greenUp = !greenUp; }
    } else {
      greenDef -= greenMutate;
      if (greenDef < 0) { greenDef = 0; greenUp = !greenUp; }
    }
    if (blueUp) {
      blueDef += blueMutate;
      if (blueDef > 255) { blueDef = 255; blueUp = !blueUp; }
    } else {
      blueDef -= blueMutate;
      if (blueDef < 0) { blueDef = 0; blueUp = !blueUp; }
    }
  }
}


