
/* litmus_litfest_cover
   Version: 1.0, 2012-10-06
   
   Code to generate the cover image for the Litmus Paper magazine at the Cheltenham
   Literature Festival, October 2012
   
   Written by Phillip Kent
   
   http://design-science.org.uk/litmus-paper/
   http://www.openprocessing.org/collection/1676
   
   Both parts of the image (weave and 'intestines') are outputs of the program
   litmus2_hextiling :
   http://www.openprocessing.org/sketch/64839 
  
   Acknowledgements:
   * Code to mask the hextile behind the cut is based on:
       http://processing.org/discourse/beta/num_1229687224.html 
       
   OPTION KEYS:
   > = increase size of cut
   < = decrease size of cut
   
   MOUSE ACTIONS:
   Click mouse over either end of the cut to drag the end to a new position
*/

int tileSize,tileSizeMin,tileSizeMax;
int[] tilesChoice = new int[6];
boolean firstFrame;
boolean startRandom;
boolean randomFlip;
boolean showHexagon;
float centreX, centreY, sinVal, cosVal, r, theta;

PImage hextile;
PGraphics pgTexture;
PGraphics pgMask;
PGraphics pgShape;
int cutTopX,cutTopY,cutBottomX,cutBottomY;
float cutWidth;

void setup() {
  size(800,800);
  smooth();
  
  strokeCap(SQUARE);
  frameRate(5);
  tileSize=24; // NOTE!! there is a bug in tile placement when tileSize has odd values
  tileSizeMin=20;
  tileSizeMax=200;
  firstFrame = true;
  startRandom = false;
  randomFlip = true;
  showHexagon = false;
  centreX = width/2;
  centreY = height/2;
  for (int i=0; i<=5; i++) { tilesChoice[i] = 5; } // use only tile style 5 in this sketch

  //All this code is creating a cut-shaped mask so that
  //the 'hextile-intestine' is revealed by the cut
  PImage hextile = loadImage("hextile-intestine.png");
  pgMask = createGraphics(width, height, JAVA2D);
  pgShape = createGraphics(width, height, P2D);
  // Make tiled texture
  pgTexture = createGraphics(width, height, JAVA2D);
  pgTexture.beginDraw();
  for (int x = 0; x < width; x += hextile.width)
  {
    for (int y = 0; y < height; y += hextile.height)
    {
      pgTexture.image(hextile, x, y);
    }
  }
  pgTexture.endDraw();
  
  cutTopX = width/2-7;
  cutTopY = height/7;
  cutBottomX = width/2-7;
  cutBottomY = 6*height/7;
  cutWidth = 0.15*width;
  
}

void draw() {
  
  //draw the tile/weave background
  drawInitial(3);
 
  // draw the 'cut'
  strokeWeight(4);
  if (cutWidth < 1) {
     stroke(225);
  } else {
     stroke(0);
  }
  sinVal = sin(-atan2(cutTopY-cutBottomY,cutTopX-cutBottomX));
  cosVal = cos(-atan2(cutTopY-cutBottomY,cutTopX-cutBottomX));
  beginShape();
    vertex(cutBottomX,cutBottomY);
    bezierVertex(cutBottomX,cutBottomY,(cutTopX+cutBottomX)/2-cutWidth*sinVal,
      (cutTopY+cutBottomY)/2-cutWidth*cosVal,cutTopX,cutTopY);
    vertex(cutTopX,cutTopY);
    bezierVertex(cutTopX,cutTopY,(cutTopX+cutBottomX)/2+cutWidth*sinVal,
      (cutTopY+cutBottomY)/2+cutWidth*cosVal,cutBottomX,cutBottomY);
    vertex(cutBottomX,cutBottomY);
  endShape();
  
  //draw "hextile" inside the cut
  //(all this code is required to mask the hextile image by the 'cut')
  pgMask.background(0);
  pgMask.fill(255);
  pgMask.noStroke();
  pgMask.beginDraw();
  pgMask.beginShape();
    pgMask.vertex(cutBottomX,cutBottomY);
    pgMask.bezierVertex(cutBottomX,cutBottomY,(cutTopX+cutBottomX)/2-cutWidth*sinVal,
      (cutTopY+cutBottomY)/2-cutWidth*cosVal,cutTopX,cutTopY);
    pgMask.vertex(cutTopX,cutTopY);
    pgMask.bezierVertex(cutTopX,cutTopY,(cutTopX+cutBottomX)/2+cutWidth*sinVal,
      (cutTopY+cutBottomY)/2+cutWidth*cosVal,cutBottomX,cutBottomY);
    pgMask.vertex(cutBottomX,cutBottomY);
  pgMask.endShape(); 
  pgMask.endDraw();
  PImage piMask = pgMask.get(0, 0, width, height);
  pgShape.image(pgTexture, 0, 0);
  pgShape.mask(piMask);
  image(pgShape, 0, 0);
  
}

void drawInitial(int startval) {
  float dx = tileSize * cos(radians(30)) * 2;
  //int startval = int(random(6));
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

// Erase the current tile with blank space
void blankModule(float cx, float cy, float size) {
  float side = size * tan(radians(30));
  beginShape();
  for (int i = 0; i <= 6; i++) {
    vertex(cx + side*cos(i*PI/3),cy+side*sin(i*PI/3));
  }
  endShape();
}

void keyPressed() {
  if (key == ',' || key == '<') {
      if (cutWidth >= 4) { 
         cutWidth=cutWidth-4;
      }
  }
  if (key == '.' || key == '>') {
      if (cutWidth < width/3) { 
         cutWidth=cutWidth+4;
     }
  }
}

void mouseDragged() {
   if (dist(mouseX,mouseY,cutTopX,cutTopY) < 20) {
     cutTopX = mouseX;
     cutTopY = mouseY;
   }
   if (dist(mouseX,mouseY,cutBottomX,cutBottomY) < 20) {
     cutBottomX = mouseX;
     cutBottomY = mouseY;
   }
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
  stroke(225);
  strokeCap(PROJECT);
  arc(0, -size, bigArcRadius * 2, bigArcRadius * 2, PI / 3, 2*PI/3);
  strokeCap(SQUARE);
  //straight line
  strokeWeight(7);
  stroke(0);
  line(0,+size/2,0,-size/2);
  strokeWeight(5);
  stroke(225);
  strokeCap(PROJECT);
  line(0,+size/2,0,-size/2);
  strokeCap(SQUARE);
  //arc 2
  strokeWeight(7);
  stroke(0);
  arc(0, +size, bigArcRadius * 2, bigArcRadius * 2, 4*PI/3, 5 * PI / 3);
  strokeWeight(5);
  stroke(225);
  strokeCap(PROJECT);
  arc(0, +size, bigArcRadius * 2, bigArcRadius * 2, 4*PI/3, 5 * PI / 3);
  strokeCap(SQUARE);
  rotate(-rotation * PI / 3);
  translate(-cx, -cy);
}


