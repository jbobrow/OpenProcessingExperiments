
//copyright barry li july 2013

float posX, posY,
      rightBound, downBound, 
      velX, velY,
      tx, ty,
      velTX, velTY,
      tDim;
int cValue, cIncrement;
final int STROKEWIDTH = 20,
          BBOTDIM = 120,
          BTOPDIM = 100,
          HEIGHTDIM = 220,
          WIDTHDIM = 410;

void setup() {
  size(800, 800);
  posX = 0;
  posY = 0;
  rightBound = 410;
  downBound = 220;
  velX = 4;
  velY = 3;
  cValue = 255;
  cIncrement = 1;
  tx = 480;
  ty = 300;
  velTX = 12;
  velTY = 14;
  tDim = 30;
  ellipseMode(RADIUS);
}

void draw() {
  background(cValue);
  posX += velX;
  posY += velY;
  rightBound += velX;
  downBound += velY;
  if (rightBound >= width) {
    velX*=-1;
  }
  if (posX <= 0) {
    velX*=-1;
  }
  if (downBound >= height) {
    velY*=-1;
  }
  if (posY <= 0) {
    velY*=-1;
  }
  if (tx-tDim> width) {
    tx = -tDim;
  }
  if (tx+tDim< 0) {
    tx = width+tDim;
  }
  if (ty-tDim> height) {
    ty = -tDim;
  }
  if (ty+tDim< 0) {
    ty = height+tDim;
  }
  if (tx-tDim+velTX < rightBound+velX && tx+tDim+velTX > posX+velX &&
      ty+tDim+velTY > posY+velY && ty-tDim+velTY < downBound+velY) {
    velTY = -velTY;
  }
  if (ty-tDim+velTY < downBound+velY && ty+tDim+velTY > posY+velY && 
      tx-tDim+velTX < rightBound+velY && tx+tDim+velTX > posX+velX) {
    velTX = -velTX;
  }
  tx += velTX;
  ty += velTY;
  noStroke();
  fill(0);
  ellipse(tx, ty, tDim, tDim);
  
  fill(0, 0, 255);
  quad(posX, posY+HEIGHTDIM, posX, posY+STROKEWIDTH, posX+STROKEWIDTH, posY, posX+STROKEWIDTH, posY+HEIGHTDIM);
  rect(posX+STROKEWIDTH, posY, BTOPDIM, BTOPDIM);
  rect(posX+STROKEWIDTH, posY+BTOPDIM, BBOTDIM, BBOTDIM);
  
  fill(cValue);
  rect(posX+STROKEWIDTH, posY+STROKEWIDTH, BTOPDIM-STROKEWIDTH, BTOPDIM-STROKEWIDTH);
  rect(posX+STROKEWIDTH, posY+BTOPDIM+STROKEWIDTH, BBOTDIM-STROKEWIDTH, BBOTDIM-2*STROKEWIDTH);
  
  fill(0, 0, 180);
  quad(posX+150, posY, posX+150, posY+STROKEWIDTH, posX+300, posY+HEIGHTDIM, posX+300, posY+HEIGHTDIM-STROKEWIDTH);
  quad(posX+150, posY+HEIGHTDIM, posX+150, posY+HEIGHTDIM-STROKEWIDTH, posX+300, posY, posX+300, posY+STROKEWIDTH);
  
  fill(0, 0, 116);
  quad(posX+310, posY+HEIGHTDIM, posX+310, posY+STROKEWIDTH, posX+310+STROKEWIDTH, posY,  posX+310+STROKEWIDTH, posY+HEIGHTDIM);
  rect(posX+310+STROKEWIDTH, posY+HEIGHTDIM-STROKEWIDTH, STROKEWIDTH*4, STROKEWIDTH);
}


