
/* litmus2_hextiling
   Hexagonal tiling
   Version: 1.2, 2013-03-21
   
   Written by Phillip Kent for Litmus Paper at the Cheltenham Science Festival
      
   http://design-science.org.uk/litmus-paper/
   http://www.openprocessing.org/collection/1676

   This is a flat space version of the tiling used in the program litmus2_cover
     http://www.openprocessing.org/sketch/64035

   Acknowledgements:
   This code is based on "hextiles" by Maciek Makowski
     http://www.openprocessing.org/sketch/6785 
   Tile patterns are based on "Tiling Generators" published by the 
   Association of Teachers of Mathematics:
     http://www.atm.org.uk/shop/products/mat013.html
     http://www.atm.org.uk/shop/products/gen024.html
     
   History:
   V1.1 (2012-09-23): added PDF output optio
   V1.2 (2013-03-21): sketch ported to Processing version 2 and JavaScript output; no changes to the code
   
   CONTROL KEYS:
   F = tile flips on/off
   H = show hexagons on/off
   O = restart with ordered tiles
   R = restart with random tiles
   < = decrease the tile size
   > = increase the tile size
   E = use all tile patterns in random mix
   1,2,3,4,5 = choose one tile pattern only
   P = save display to PDF; single frame after a restart
   Q = save display to PDF; accumulation of frames after restart (press Q to start, Q again to capture)
*/


import processing.pdf.*;

int tileSize,tileSizeMin,tileSizeMax;
int[] tilesChoice = new int[6];
boolean firstFrame;
boolean startRandom;
boolean randomFlip;
boolean showHexagon;
boolean saveOneFrame;
boolean pdfRecord;
float centreX, centreY, r, theta;

void setup() {
  size(800,700);
  background(255, 255, 255);
  smooth();
  strokeCap(SQUARE);
  frameRate(5);
  tileSize=80; // NOTE!! there is a bug in tile placement when tileSize has odd values
  tileSizeMin=20;
  tileSizeMax=200;
  firstFrame = true;
  startRandom = true;
  randomFlip = true;
  showHexagon = false;
  saveOneFrame = false;
  pdfRecord = false;
  centreX = width/2;
  centreY = height/2;
  for (int i=0; i<=5; i++) { tilesChoice[i] = i+1; }
}

void drawInitial() {
  float dx = tileSize * cos(radians(30)) * 2;
  int startval = int(random(6));
  int l = 0;
  for (float y = 0; y < height + tileSize; y += tileSize/2) {
    for (float x = l % 2 * dx / 2; x < width + tileSize; x += dx) {
      if (showHexagon) { stroke(21,212,224); } else { stroke(255);}
      strokeWeight(1);
      fill(255);
      blankModule(x, y, tileSize);
      noFill();
      if (startRandom) {
        moduleSelect(x, y, tileSize, int(random(6)),tilesChoice[int(random(5.9))]);
      } else {
        moduleSelect(x, y, tileSize, startval,tilesChoice[int(random(5.9))]);
      }
    }
    l++;
  }
}

void draw() {
  
  if (firstFrame) {
      if (saveOneFrame) {
         beginRecord(PDF, "hextile-output-####.pdf");
      }
      drawInitial();
      firstFrame = false;
      if (saveOneFrame) {
        endRecord();
        saveOneFrame=false;
      }
      return;
  }
  
  if (randomFlip) {  // only change tiles if randomFlip=true
    float dx = tileSize * cos(radians(30)) * 2;
    int l = (int) random(2 * height / tileSize);
    float y = l * tileSize / 2;
    float x = l % 2 * dx / 2 + (int) random(width / dx) * dx;
    fill(255);
    strokeWeight(1);
    if (showHexagon) { stroke(21,212,224); } else { stroke(255);}
    blankModule(x, y, tileSize);
    noFill();
    int randnum = int(random(6));
    int tileSelect = tilesChoice[int(random(5.9))];
    moduleSelect(x, y, tileSize, randnum,tileSelect);
  }
  
}

// Erase the current tile with blank space
void blankModule(float cx, float cy, float size) {
  float side = size * tan(radians(30));
  beginShape();
  for (int i = 0; i <= 6; i++) {
    vertex(cx + side*cos(i*PI/3),cy+side*sin(i*PI/3));
  }
  endShape();
}

//Draw new/replacement tile - select tile pattern
void moduleSelect(float cx, float cy, float size, int rotation, int modulePattern) {
  switch (modulePattern) {
    case 1:
       module1(cx,cy,size,rotation);
       break;
    case 2:
       module2(cx,cy,size,rotation);
       break;
     case 3:
       module3(cx,cy,size,rotation);
       break;
     case 4:
       module4(cx,cy,size,rotation);
       break;   
     case 5:
       module5(cx,cy,size,rotation);
       break;
     default:
       module1(cx,cy,size,rotation);
       break;
  }
}
    
void module1(float cx, float cy, float size, int rotation) {
  translate(cx, cy);
  rotate(rotation * PI / 3);
  float smallArcRadius = size * tan(radians(30)) / 2;
  float bigArcRadius = size * cos(radians(30));
  //arc 1
  // the outline in black
  strokeWeight(7);
  stroke(0);
  arc(-size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, -PI / 3, PI / 3);
  // the filling in greyshade
  strokeWeight(5);
  strokeCap(PROJECT);
  stroke(200);
  arc(-size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, -PI / 3, PI / 3);
  strokeCap(SQUARE);
  //arc 2
  strokeWeight(7);
  stroke(0);
  arc(bigArcRadius, -size / 2, bigArcRadius * 2, bigArcRadius * 2, 2 * PI / 3 , PI);
  strokeWeight(5);
  stroke(200);
  strokeCap(PROJECT);
  arc(bigArcRadius, -size / 2, bigArcRadius * 2, bigArcRadius * 2, 2 * PI / 3, PI);
  strokeCap(SQUARE);
  //arc 3
  strokeWeight(7);
  stroke(0);
  arc(bigArcRadius, size / 2, bigArcRadius * 2, bigArcRadius * 2, PI, 4 * PI / 3);
  strokeWeight(5);
  stroke(200);
  strokeCap(PROJECT);
  arc(bigArcRadius, size / 2, bigArcRadius * 2, bigArcRadius * 2, PI, 4 * PI / 3);
  strokeCap(SQUARE);
  rotate(-rotation * PI / 3);
  translate(-cx, -cy);
}

void module2(float cx, float cy, float size, int rotation) {
  translate(cx, cy);
  rotate(rotation * PI / 3);
  float smallArcRadius = size * tan(radians(30)) / 2;
  float bigArcRadius = size * cos(radians(30));
  //arc 1
  // the outline in black
  strokeWeight(7);
  stroke(0);
  arc(-size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, -PI / 3, PI / 3);
  // the filling in greyshade
  strokeWeight(5);
  strokeCap(PROJECT);
  stroke(200);
  arc(-size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, -PI / 3, PI / 3);
  strokeCap(SQUARE);
  //arc 3
  strokeWeight(7);
  stroke(0);
  arc(bigArcRadius, size / 2, bigArcRadius * 2, bigArcRadius * 2, PI, 4 * PI / 3);
  strokeWeight(5);
  stroke(200);
  strokeCap(PROJECT);
  arc(bigArcRadius, size / 2, bigArcRadius * 2, bigArcRadius * 2, PI, 4 * PI / 3);
  strokeCap(SQUARE);
  //arc 2
  strokeWeight(7);
  stroke(0);
  arc(bigArcRadius, -size / 2, bigArcRadius * 2, bigArcRadius * 2, 2 * PI / 3 , PI);
  strokeWeight(5);
  stroke(200);
  strokeCap(PROJECT);
  arc(bigArcRadius, -size / 2, bigArcRadius * 2, bigArcRadius * 2, 2 * PI / 3, PI);
  strokeCap(SQUARE);
  
  rotate(-rotation * PI / 3);
  translate(-cx, -cy);
}

void module3(float cx, float cy, float size, int rotation) {
  translate(cx, cy);
  rotate(rotation * PI / 3);
  float smallArcRadius = size * tan(radians(30)) / 2;
  //arc 1 small
  strokeWeight(7);
  stroke(0);
  arc(-size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, -PI / 3, PI / 3);
  strokeWeight(5);
  strokeCap(PROJECT);
  stroke(200);
  arc(-size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, -PI / 3, PI / 3);
  strokeCap(SQUARE);
  //arc 2 small
  strokeWeight(7);
  stroke(0);
  arc(+size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, 2*PI / 3, 4*PI / 3);
  strokeWeight(5);
  strokeCap(PROJECT);
  stroke(200);
  arc(+size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, 2*PI / 3, 4*PI / 3);
  strokeCap(SQUARE);
  //straight line
  strokeWeight(7);
  stroke(0);
  line(0,+size/2,0,-size/2);
  strokeWeight(5);
  stroke(200);
  strokeCap(PROJECT);
  line(0,+size/2,0,-size/2);
  strokeCap(SQUARE);
  rotate(-rotation * PI / 3);
  translate(-cx, -cy);
}

void module4(float cx, float cy, float size, int rotation) {
  translate(cx, cy);
  rotate(rotation * PI / 3);
  float smallArcRadius = size * tan(radians(30)) / 2;
  float side = size * tan(radians(30));
  //arc 1 small
  strokeWeight(7);
  stroke(0);
  arc(-size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, -PI / 3, PI / 3);
  strokeWeight(5);
  strokeCap(PROJECT);
  stroke(200);
  arc(-size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, -PI / 3, PI / 3);
  strokeCap(SQUARE);
  //arc 2 small
  strokeWeight(7);
  stroke(0);
  arc(side*cos(PI/3),side*sin(2*PI/3), smallArcRadius * 2, smallArcRadius * 2, 3*PI / 3, 5*PI/3);
  strokeWeight(5);
  strokeCap(PROJECT);
  stroke(200);
  arc(side*cos(PI/3),side*sin(2*PI/3), smallArcRadius * 2, smallArcRadius * 2, 3*PI / 3, 5*PI/3);
  strokeCap(SQUARE);
  //arc 3 small
  strokeWeight(7);
  stroke(0);
  arc(side*cos(PI/3),-side*sin(2*PI/3), smallArcRadius * 2, smallArcRadius * 2, PI/3, PI);
  strokeWeight(5);
  strokeCap(PROJECT);
  stroke(200);
  arc(side*cos(PI/3),-side*sin(2*PI/3), smallArcRadius * 2, smallArcRadius * 2, PI/3,PI);
  strokeCap(SQUARE);
  rotate(-rotation * PI / 3);
  translate(-cx, -cy);
}

void module5(float cx, float cy, float size, int rotation) {
  translate(cx, cy);
  rotate(rotation * PI / 3);
  float bigArcRadius = size * cos(radians(30));
  //arc 1
  strokeWeight(7);
  stroke(0);
  arc(0, -size, bigArcRadius * 2, bigArcRadius * 2, PI / 3 , 2*PI/3);
  strokeWeight(5);
  stroke(200);
  strokeCap(PROJECT);
  arc(0, -size, bigArcRadius * 2, bigArcRadius * 2, PI / 3, 2*PI/3);
  strokeCap(SQUARE);
  //straight line
  strokeWeight(7);
  stroke(0);
  line(0,+size/2,0,-size/2);
  strokeWeight(5);
  stroke(200);
  strokeCap(PROJECT);
  line(0,+size/2,0,-size/2);
  strokeCap(SQUARE);
  //arc 2
  strokeWeight(7);
  stroke(0);
  arc(0, +size, bigArcRadius * 2, bigArcRadius * 2, 4*PI/3, 5 * PI / 3);
  strokeWeight(5);
  stroke(200);
  strokeCap(PROJECT);
  arc(0, +size, bigArcRadius * 2, bigArcRadius * 2, 4*PI/3, 5 * PI / 3);
  strokeCap(SQUARE);
  rotate(-rotation * PI / 3);
  translate(-cx, -cy);
}

void keyPressed() {
  if (key == 'h' || key == 'H') {
      showHexagon = !showHexagon;
  }
  if (key == 'f' || key == 'F') {
      randomFlip = !randomFlip;
  }
  if (key == 'r' || key == 'R') {
      firstFrame=true;
      startRandom=true;
  }
  if (key == 'o' || key == 'O') {
      firstFrame=true;
      startRandom=false;
  }
  if (key == ',' || key == '<') {
      if (tileSize > tileSizeMin) { 
         tileSize=tileSize-2 ;
         firstFrame=true;
         //startRandom=true;
      }
  }
  if (key == '.' || key == '>') {
      if (tileSize < tileSizeMax) { 
         tileSize=tileSize+2; 
         firstFrame=true;
         //startRandom=true;
     }
  }
  
  if (key == 'e' || key == 'E') {
    for (int i=0; i<=5; i++) { tilesChoice[i] = i+1; }
    firstFrame=true;
  }
  
  if (key == 'p' || key == 'P') {
    saveOneFrame=true;
    firstFrame=true;
  }
  
  if (key == 'q' || key == 'Q') {
    if (pdfRecord == false) {
      pdfRecord = true;
      firstFrame = true;
      beginRecord(PDF, "hextile-output-####.pdf");
      return;
    }
    
    if (pdfRecord == true) {
      pdfRecord = false;
      endRecord();
    }
    
  }
  
  if (key == '1') {
    for (int i=0; i<=5; i++) { tilesChoice[i] = 1; }
    firstFrame=true;
  }
  
  if (key == '2') {
    for (int i=0; i<=5; i++) { tilesChoice[i] = 2; }
    firstFrame=true;
  }
  
  if (key == '3') {
    for (int i=0; i<=5; i++) { tilesChoice[i] = 3; }
    firstFrame=true;
  }
  
  if (key == '4') {
    for (int i=0; i<=5; i++) { tilesChoice[i] = 4; }
    firstFrame=true;
  }
  
  if (key == '5') {
    for (int i=0; i<=5; i++) { tilesChoice[i] = 5; }
    firstFrame=true;
  }
}



