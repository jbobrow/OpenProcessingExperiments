
//Set number of elements
  int numCol = 5, numRow = 5;
//Declare functions for calculating size of elements
  float colSize, rowSize;
//Declare functions for element dependent color/alpha selection
  int scaleColorW, scaleColorH, scaleAlphaW, scaleAlphaH;
//Set gap size, based on number of elements (gap rising with number of elements)
  int gap = 10;
//Set border size
  int border = 40;
//Set maximum alpha value, not used
  //int maxAlpha = 255;

void setup() {
  //Set canvas size
    size(800, 800);
  //Set background color
    //background(255);
  //Set iteration speed, 1 = 1 frame per second
    frameRate(1);
  //Center ellipse to canvas
    ellipseMode(CORNER);
  //Determine element size
    colSize = ((width - border) - ((numCol+1) * (gap)))/numCol;
    rowSize = ((height - border) - ((numRow+1) * (gap)))/numRow;
  //Find base increment for color based on number of elements
    scaleColorW = 255/numCol;
    scaleColorH = 255/numRow;
  //Find base increment for alpha based on number of elements, not used
    //scaleAlphaW = maxAlpha/numCol;
    //scaleAlphaH = maxAlpha/numRow;
}


void draw() {
  //Flush background each frame
    background(255);
  
  //Interpolate rectangles an ellipses
  for (int i=0; i<numCol; i++){
    for (int j=0; j<numRow; j++){
      //Hide stroke
        stroke(0, 0);
      //Calculate fill color based on position
        fill(scaleColorW * (i+1), 255 - (scaleColorW * (i+1)), 0, 100);
      //Calculate rectangle position
        rect((colSize * i) + (gap * (i+1)) + random(-10, 20) + (border / 2), (rowSize * j) + (gap * (j+1)) + random(-20, 10) + (border / 2), colSize, rowSize);
      //Set ellipse color range
        fill(255 - (scaleColorH * (j+1)), 255 - (scaleColorH * (j+1)), scaleColorH * (j+1), 150);
      //Calculate ellipse position
        ellipse(((colSize * i) + (gap * (i+1))) + random(-20, 10) + (border / 2), ((rowSize * j) + (gap * (j+1))) + random(-10, 20) + (border / 2), colSize, rowSize);
    }
  }
}


