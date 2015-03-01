
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This simple sketch demonstrates how to read pixel values from an image
 * It simulates a 10 pixel "scanner" that moves from the top to the bottom of the image
 * reading the colour values for 10 equally spaced points, then displaying those colours
 * as vertical bars on the left half of the screen.
 *
 */

PImage myImg;
color[] pixelColors;
float[] pixelBrightness;
int dotNum = 10;
int scanLine;  // vertical position
boolean isShowImage = false;
int dotMargin;

void setup() {
  size(700, 622);
  myImg = loadImage("nasaImage.jpg");

  pixelColors = new color[dotNum];
  pixelBrightness = new float[dotNum];

  scanLine = 0;
  smooth(4);
  
  colorMode(HSB, 360, 100, 100);
  
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  dotMargin = (int)((myImg.width / dotNum - 1) / 2);
  for (int i=0; i < dotNum; i++) {
    pixelColors[i] = myImg.get(dotMargin + i * (2 * dotMargin + 1), scanLine);
  }


  // increment scan line position every second frame
  if (frameCount % 4 == 0) {
    scanLine ++;
  }

  if (scanLine > myImg.height) {
    scanLine = 0;
  }


  //
  //
  //  Ambient
  //
  //
  
  int sz = 30;
  int x = 0;
  int y = 0;
  int el = 0;



  while (y < height + 2*sz) {
      while (x < width) {
          
            noStroke();
            float idx = map (cos(5*el * (frameCount+4000)/190000), -1, 1, 0, dotNum-1);
//            float idx = map (cos(5*el), -1, 1, 0, dotNum-1);
            fill(pixelColors[(int)idx]);
            float k = sin(1.1*el) * cos(el * (frameCount+4000)/160000);
            k = map (k, -1, 1, 2, 4);
            ellipse(x, y, k*sz, k*sz);
            el++;
            x += sz;
      }
      x = 0;
      y += sz;
   }

  
  if (isShowImage) showImage();


}


void showImage() {
    
  pushMatrix();
  translate(width/2, 0);
  float scx = ((float) width / myImg.width ) / 2 ;
  float scy = ((float) height / myImg.height );
  float sc = min(scx, scy);
  scale ( sc );
  // draw the image
  image(myImg, 0, 0);

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i < dotNum; i++) {
    stroke(0, 100, 100);
    strokeWeight(1/sc);
    noFill();
    ellipse(dotMargin + i * (2 * dotMargin + 1), scanLine, 5/sc, 5/sc );
  }
  
  
  popMatrix();
  
}



void keyPressed() {
    if (key == 'o') {
        selectInput("Select a file to process:", "fileSelected");
    }
    if (key == 'i') {
        isShowImage = !isShowImage;
    }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    myImg = loadImage(selection.getAbsolutePath());
    scanLine = 0;

  }
}




