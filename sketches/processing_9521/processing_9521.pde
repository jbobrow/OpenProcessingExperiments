
//-------GLOBALS----------------
int stageWidth = 480;
int stageHeight = 360;
int frameRateNum = 24;
int bgColor = 228;
//--
int strokeWeightNum = 1;
int strokeWeightMax = 5;
int scatterCount = 0;
int scatterMax = 15;
int scatterDistanceOrig = 10;
int scatterDistance = scatterDistanceOrig;
int scatterStrokeOrig = 10;
int scatterStroke = scatterStrokeOrig;
//--
float v = 1.0/9.0;  //original float v = 1.0/9.0;
float[][] kernel = {  
  {
    v, v, v              }
  , {
    v, v, v              }
  , {
    v, v, v              }  
};
PImage img = createImage(width, height, RGB);

//---------MAIN------------------------

void setup() {
  size(stageWidth, stageHeight);
  frameRate(frameRateNum);
  clear();
  smooth();
}

void draw() {
drawStuff();
effects();}

//---------FUNCTIONS-------------------

void drawStuff() {
  if (mousePressed == true) {
    stroke(0);
    strokeWeightNum = ((abs(mouseX - pmouseX)) + (abs(mouseY - pmouseY)))/2;
    if (strokeWeightNum > strokeWeightMax) {
      strokeWeightNum = strokeWeightMax;
    }
    strokeWeight(strokeWeightNum);
    line(pmouseX, pmouseY, mouseX, mouseY);
    //--
    while (scatterCount < scatterMax) {
      stroke(0);
      strokeWeight(scatterStroke);
      float qq = mouseX + random(scatterDistance) - random(scatterDistance);
      float ww = mouseY + random(scatterDistance) - random(scatterDistance);
      point(qq,ww);
      scatterCount ++;
      scatterDistance --;
      if (scatterStroke > 0) {
        scatterStroke --;
      }
    }
    scatterCount = 0;
    scatterStroke = scatterStrokeOrig;
    //---------
        while (scatterCount < scatterMax) {
      stroke(0);
      strokeWeight(scatterStroke/2);
      float qq = mouseX + random(scatterDistance*2) - random(scatterDistance*2);
      float ww = mouseY + random(scatterDistance*2) - random(scatterDistance*2);
      point(qq,ww);
      scatterCount ++;
      scatterDistance --;
      if (scatterStroke > 0) {
        scatterStroke --;
      }
    }
    scatterCount = 0;
    scatterStroke = scatterStrokeOrig;
  }
  scatterDistance = scatterDistanceOrig;
}

//--

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
          sum += (kernel[ky+1][kx+1] * ((0.25 + random(1.5))*val));
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
}

void clear() {
  background(bgColor);
}

//-------------END-----------------------

