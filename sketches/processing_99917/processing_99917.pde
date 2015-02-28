
int rows = 10;
float circleWidth;
float[] angleStarts;
float angleOffset = 0;

void setup() {
  size(300, 300);
  circleWidth = width / rows;
  
  angleStarts = new float[rows * rows];
  for (int i = 0; i < angleStarts.length; i++) {
    angleStarts[i] = random(TWO_PI);
  }
}

void draw() {
  background(255);
  
  ellipseMode(CORNER);
  strokeWeight(2.5);
  strokeCap(SQUARE);
  stroke(0);
  noFill();
  
  angleOffset += 0.1;
  
  
  for (int row = 0; row < rows; row++) {
    float y = map(row, 0, rows, 0, height);
    for (int col = 0; col < rows; col++) {
      float x = map(col, 0, rows, 0, width);
      
      float angle = angleStarts[(row * rows) + col] + angleOffset;
      
      drawArc(x, y, angle);
    }
  }
}
          
void drawArc(float x, float y, float angle) {
  arc(x+3, y+3, circleWidth / 2, circleWidth / 2, angle, angle + TWO_PI * 0.333);
}
