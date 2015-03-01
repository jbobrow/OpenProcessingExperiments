
/* @pjs preload="myImage.jpg"; 
 */

PImage myImg;
color[] pixelColors;
int scanLine;
int scanPoints;
float r;
float shrinkage;
int mode, old_mode;
int transparency=128;


void setup() {
  size(600, 600);
  background(255);
  noStroke();
  // setup variables
  myImg = loadImage("myImage.jpg");
  scanPoints = 40;
  pixelColors = new color[scanPoints];
  scanLine = 0;
  mode = 1;

  frameRate(60);
}


void draw() {
  if (mode != -1) {
    if (mode == 1 || mode == 2) { 
      background(255);
    }
    if (mode == 0) { 
      DisplaySource();
      transparency=128;
    }
    ReadColours();
    DrawShapes();
    ChangeScanLine();
  }
}


void DrawShapes() {
  float mx;
  float my;
  mx = width/2;
  my = height/2;

  r +=0.01;
  if (mode == 3) { 
    shrinkage +=.1;
  }
  if (mode == 4) { 
    shrinkage = random(200);
  }
  if (mode == 5) { 
    shrinkage = random(200);
  }

  translate(mx, my);
  for (int i=0; i<scanPoints; i++) {
    rotate(r);
    fill(pixelColors[i], transparency);
    float r1 = (map(i, 0, scanPoints, 2, 20)*10)-shrinkage; // tightness of pattern
    float r2 = (map(i, 0, scanPoints, 2, 20)*8)-shrinkage; // size of ellipses
    if (mode==2) {
      rect( sin(r)*r1, cos(r)*r1, sin(r)*r2, cos(r)*r2 );
    } else {
      ellipse( sin(r)*r1, cos(r)*r1, sin(r)*r2, cos(r)*r2 );
    }
  } // end of for(i)
}


void DisplaySource() {
  // draw the image
  image(myImg, 0, 0);
  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<scanPoints; i++) {
    int pos = (int) map(i, 0, scanPoints, 0, width) + (width/(scanPoints*2));
    fill(255, 255, 0);
    ellipse(pos, scanLine, 5, 5 );
  }
}


void ReadColours() {
  // read the colours for the current scanLines
  for (int i=0; i<scanPoints; i++) {
    float pos = (float) map(i, 0, scanPoints, 0, width) + (width/(scanPoints*2));
    pixelColors[i] = myImg.get((int) pos, scanLine);
  }
}


void ChangeScanLine() {
  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }
  // keep within bounds
  if (scanLine > height) {
    scanLine = 0;
  }
}


void keyPressed() {
  switch (key) {
  case '1':
    mode = 1;
    transparency=128;
    shrinkage = 0;
    break;
  case '2':
    mode = 2;
    shrinkage = 0;
    transparency=128;
    break;
  case '3':
    mode = 3;
    shrinkage = 220;
    transparency=32;
    break;
  case '4':
    mode = 4;
    shrinkage = 0;
    transparency=32;
    background(255);
    break;
  case '5':
    mode = 5;
    shrinkage = 0;
    transparency=4;
    background(255);
    break;
  case '0':
    mode = 0;
    shrinkage = 0;
    transparency=192;
    break;
  case ' ':
    if (mode != -1) {
      old_mode = mode;
      mode = -1;
    } else {
      mode=old_mode;
    }
    break;
  }
}

