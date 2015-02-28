
class Clickable {
  int x;
  int y;
  int boxWidth;
  int boxHeight;
  int numRows;
  int numColumns;
  int rowHeight;
  int columnWidth;
  int[] selected;

  Clickable(int xLoc, int yLoc, int boxW, int boxH, int nRows, int nColumns) {
    x = xLoc;
    y = yLoc;
    boxWidth = boxW;
    boxHeight = boxH;
    numRows = nRows;
    numColumns = nColumns;
    rowHeight = boxH/nRows;
    columnWidth = boxW/nColumns;
    selected = new int[2];
    selected[0] = nColumns;
    selected[1] = nRows;
  } 

  int[] clicked(int mX, int mY) {
      if ((mX >= x)&& (mX <= x + boxWidth) && (mY >= y)&& (mY<=y + boxHeight)) {
        //mouse must be in area of boxes
        //check which row and column are selected
        //
        selected[0] = int ((mX - x)/columnWidth);
        selected[1] = int ((mY -y)/rowHeight);
      }
      else{
        selected[0] = numColumns;
        selected[1] = numRows;
      }
    return selected;
  }

  void display(int boxFill, int textFill, int idx, String[] buttonLabel, int tSize, PFont tFont) {
    stroke(255);
    textFont(tFont);
    textSize(tSize);
    textAlign(CENTER);
    for (int i = 0; i < numColumns; i++) {
      for (int n = 0; n < numRows; n ++) {
        fill(boxFill);
        rect(x+(columnWidth*i), y+rowHeight*n, columnWidth, rowHeight);
        fill(textFill);
        text(buttonLabel[idx+numRows*i+n], x + (i+.5)*columnWidth, (int) (y+rowHeight*n+(rowHeight+tSize)/2));
      }
    }
  }
}


