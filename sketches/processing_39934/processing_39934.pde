
boolean drawMosaic = false;

void drawMosaicScreen() {
  drawMainImage(255);
  
  if (!mosaicComplete) {
    makeMosaic();
    mosaicComplete = true;
  } else {
    if (drawMosaic) {
      drawMosaic();
      
      if (useOverlay) {
        drawMainImage(70);
      }
    }
  }
}

void drawMainImage(int opacity) {
  imageMode(CENTER);
  tint(255, opacity);
  image(mainImage, width/2, height/2, mosaicW, mosaicH);
  tint(255, 255); // reset tint
}

void drawMosaic() {
  for (int row=0; row<numRow; row++) {
    for (int col=0; col<numCol; col++) {
      PVector loc = getTilePos(row,col);
      int tileRef = mosaicRef[row][col];
      image(imgTiles[tileRef], loc.x+marginLR, loc.y+marginTB, tileW, tileH);
    }
  }
}


void mosaicScreenClick() {
  drawMosaic = !drawMosaic;
}

void backToSelectScreen () {
  // if user presses b, return to select screen
  mosaicScreen = false;
  selectScreen = true;
  mosaicComplete = false;
  drawMosaic = false;
}



