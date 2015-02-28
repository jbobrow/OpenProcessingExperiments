
// Trade and exchange on thr marketplace
// Sorting like Bubble-sort first for each row and then for each column
// Written by: Michal Huller
// Date: Aug 15, 2013
// a special version with no sound


Sack[][] manySacks;
PVector [][] centers;
PShape onesack;
PImage market;
int matrows=4;
int matcols=4;
float boxw = 60;
float boxh = 60;
boolean objectDragged=false;
int rowD = -1;
int colD = -1;
int countChanges = 0;
float maxH = 120;
float maxfactor = 1;

void setup() {
  size(700, 600);
  shapeMode(CENTER);
  rectMode(CENTER);
  market = loadImage("Javanese_market_place.jpg");
  onesack = loadShape("sack1.svg");
  maxfactor = maxH/(max(onesack.width, onesack.height));
  boxw = onesack.width * maxfactor;
  boxh = onesack.height * maxfactor;
  matrows = floor(height/boxh) - 1;
  matcols = floor(width/boxw) - 1;
  centers = new PVector[matrows][matcols];
  manySacks = new Sack[matrows][matcols];
  for (int i=0; i < matrows; i++) {
    for (int j=0; j < matcols; j++) {
      centers[i][j] = new PVector(20.0 + boxw*(j+1), 
      20.2 + boxh*(i + 1), 0);
      //manySacks[i][j] = new Sack(random(maxfactor/4, maxfactor), 
      manySacks[i][j] = new Sack(random(0.3, 1), 
      centers[i][j].x, centers[i][j].y, i, j);
    }
  }
}

void draw() {
  background(0);
  tint(122, 122, 90);
  image(market, 0, 0);
  drawGrid();
  pushMatrix();
  for (int i=0; i < matrows; i++) {
    for (int j=0; j < matcols; j++) {
      manySacks[i][j].display();
      pushStyle();
      stroke(255);
      textSize(16);
      fill(80, 255, 50);
      text(countChanges, mouseX, mouseY);
      popStyle();
    }
  }
  popMatrix();
}

void mouseClicked() {
  PVector mousenow = new PVector(float(mouseX), float(mouseY), 0.0);
  for (int i=0; i < matrows; i++) {
    for (int j=0; j < matcols; j++) {
      //if (manySacks[i][j].isDragged()) {
      if (centers[i][j].dist(mousenow) < boxw/2) {
        rowD = i;
        colD = j;
        objectDragged = true;
        break;
      }
      if (objectDragged) break;
    }
  }
}
void mouseDragged() {
  PVector mousenow = new PVector(float(mouseX), float(mouseY), 0.0);
  if (objectDragged) {
    if (rowD >= 0) {
      manySacks[rowD][colD].drag(mousenow);
    }
  }
  else mouseClicked();
}

void mouseReleased() {
  int i, j;
  boolean changed = false;
  PVector mousenow = new PVector(float(mouseX), float(mouseY), 0.0);
  if (objectDragged) {

    for (i = 0; i < matrows; i++) {
      for (j = 0; j < matcols; j++) {

        if ((i != rowD || j != colD) && 
          centers[i][j].dist(mousenow) < boxw/2) {
          // change 
          changed = true;
          
          //count changes to display near the cursor         
          countChanges++;
          manySacks[rowD][colD].release();
          Sack keepsack = manySacks[i][j];
          manySacks[i][j] = manySacks[rowD][colD];
          manySacks[rowD][colD] = keepsack; 

          manySacks[i][j].moveto(centers[i][j], i, j);
          manySacks[rowD][colD].moveto(centers[rowD][colD], rowD, colD);
          manySacks[rowD][colD].setTremble();
          manySacks[i][j].setTremble();

          break;
        } // end of exchange
      } // end of cols
      if (changed) break;
    } // end of rows   

    if (!changed) {
      manySacks[rowD][colD].moveto(centers[rowD][colD], rowD, colD);
      manySacks[rowD][colD].release();
    }
  } // end of is dragged

  objectDragged = false;
  rowD = -1;
  colD = -1;
}


void drawGrid() {  
  pushStyle();
  rectMode(CENTER);
  stroke(120, 160, 130);
  noFill();
  for (int i=0; i < matrows; i++) {
    for (int j=0; j < matcols; j++) {
      rect(centers[i][j].x, centers[i][j].y, boxw, boxh);
    }
  }
  popStyle();
}

// The drawings for commodities created by Michal Huller
// using Inkscape

class Sack {
  PShape sackShape;
  PVector center;
  PVector origin;
  int row;
  int col;
  boolean tremble;
  float scaleto;
  int framestart;
  float rot;
  boolean dragged;

  Sack(float scalef, float centx, float centy, 
  int irow, int icol) {
    framestart = frameCount;
    center = new PVector(centx, centy);   
    origin = new PVector(centx, centy);
    sackShape = loadShape("sack"+int(random(1, 5))+".svg");

    sackShape.scale(scalef);
    //sackShape.translate(center.x, center.y);
    scaleto = scalef;
    row = irow;
    col = icol;

    tremble = false;
    rot = 0;
    dragged = false;
  }

  void display() {
    if (tremble) {
      sackShape.rotate(rot);
      rot = -rot;
      if (frameCount - framestart >= 10) {
        rot = 0;
        tremble = false;
      }
    }
    shape(sackShape, center.x, center.y, boxw, boxh);
  }

  void drag(PVector dragto) {
    dragged = true;
    center = dragto;
  }
  
  void setTremble() {
    tremble = true;
    framestart = frameCount;
    rot = 0.06;
  }

  void release() {
    dragged = false;
  }


  boolean isDragged() {
    return dragged;
  }

  void moveto(PVector place, int irow, int icol) {
    center = place;
    origin = place;
    row = irow;
    col = icol;
  }

  PVector getOrigin() {
    return origin;
  }

  void setOrigin(PVector or) {
    origin = or;
  }
}



