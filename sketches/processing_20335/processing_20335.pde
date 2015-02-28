
int squareSize = 25;
int cols, rows;

void setup() {
  size(500,500);
  cols = width/squareSize;
  rows = height/squareSize;
}

void draw() {

  // columns
  for (int i = 0; i < cols; i++) {
    // rows
    for (int j = 0; j < rows; j++) {

      // draw rectangle at (x,y)
      int x = i*squareSize;
      int y = j*squareSize;
      
      stroke(0);
      strokeWeight(10);
      
      // color
      color colorA = color(squareSize,x,y);
      color colorB = color(y,x,squareSize);
      color fillColor = lerpColor(colorA,colorB,.5);
      
      fill(fillColor);
      rect(x,y,squareSize,squareSize);
    }
  }
}

