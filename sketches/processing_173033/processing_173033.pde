
int[][] order; 
float rWidth, rHeight, rSize;
int c1, c2; 
int numCols, rowCount, colCount; 
float inc; 
float mx, my; 
boolean lastRectV = false;
boolean drawRectV = true; 
boolean lastRectH = false;
boolean drawRectH = true; 
boolean reverse = false; 

void setup() {
  size(400, 400); 
  background(255); 
  noStroke(); 

  mx = width/2; 
  my = height/2; 

  numCols = 8; 
  rSize = round( width/float(numCols) ); 
  rWidth = rSize/2; 
  rHeight = rSize/2;

  c1 = #FFB132;
  c2 = #DE7016;
  inc = 0; 
  rowCount = 0; 
  colCount = 0; 

  fillOrder();
}

void draw() {
  background(255); 
  translate(mx, my); 
  if (reverse) rotate(PI); 

  for (int row = 0; row < numCols; row++) {    
    for (int col = 0; col < numCols; col++) {      
      if (!reverse) {
        drawRectH = ((col <= rowCount && row == colCount) || row < colCount) ? true : false;      
        lastRectH = (col == rowCount && row == colCount) ? true : false;
        drawRectV = ((row <= rowCount && col == colCount) || col < colCount) ? true : false;
        lastRectV = (row == rowCount && col == colCount) ? true : false;
      } else {
        drawRectH = ((col <= numCols-1 - rowCount && row == numCols-1 - colCount) || row < numCols-1 - colCount) ? true : false;      
        lastRectH = (col == numCols-1 - rowCount && row == numCols-1 - colCount) ? true : false;
        drawRectV = ((row <= numCols-1 - rowCount && col == numCols-1 - colCount) || col < numCols-1 - colCount) ? true : false;
        lastRectV = (row == numCols-1 - rowCount && col == numCols-1 - colCount) ? true : false;
      } 

      if (order[row][col] == 0) {
        if (drawRectV) drawRectVert(col, row, lastRectV);
        if (drawRectH) drawRectHori(col, row, lastRectH);
      } else {
        if (drawRectH) drawRectHori(col, row, lastRectH);
        if (drawRectV) drawRectVert(col, row, lastRectV);
      }
    }  // cols
  }  // rows

  inc += 0.05;
  if (inc > 1) {
    inc = 0;

    rowCount++; 
    if (rowCount > numCols) {
      rowCount = 0;
      colCount++; 
      if (colCount > numCols) { 
        colCount = 0;
        reverse = !reverse;
      };
    }
  }
}

void drawRectVert(int _c, int _r, boolean _lr) {
  float x, y;
  float factor = inc; 
  float rectSize = rSize; 
  float s = 5; 

  if (reverse) {
    factor = 1 - inc;
    s *= -1;
  }
  if (_lr) {
    rectSize = lerp(0, rSize, factor);
  }
  x = (_c * rSize) + rSize/2-rWidth/2; 
  y = _r * rSize;
  x -= mx; 
  y -= my; 

  pushMatrix();
  translate(x, y);  
  fill(50, 30); 
  rect(s, 0, rWidth, rectSize);
  fill(c1); 
  rect(0, 0, rWidth, rectSize);
  popMatrix();
}

void drawRectHori(int _c, int _r, boolean _lr) {
  float x, y;
  float factor = inc; 
  float rectSize = rSize; 
  float s = 5; 

  if (reverse) {
    factor = 1 - inc;
    s *= -1; 
  }
  if (_lr) {
    rectSize = lerp(0, rSize, factor);
  }

  x = _c * rSize; 
  y = (_r * rSize) + rSize/2-rHeight/2;
  x -= mx; 
  y -= my; 

  pushMatrix();
  translate(x, y);
  fill(50, 30); 
  rect(0, s, rectSize, rHeight);    
  fill(c2); 
  rect(0, 0, rectSize, rHeight);    
  popMatrix();
}

void fillOrder() {
  int count; 
  order = new int[numCols][numCols]; 

  count = 0; 
  for (int row = 0; row < numCols; row++) {
    count = (row%2 == 0) ? 0 : 1;   
    for (int col = 0; col < numCols; col++) { 
      order[row][col] = (count%2 == 0) ? 0 : 1;  
      count++;
    }
  }
}



