
// kieran's twinkle program

int x = 750, y = 450; 
int spacing = 6, sqrSize = 2;
int twinkleSize = floor(x * 0.75);
int xnum, ynum;
int speed = 5;
float dots[ ][ ] = new float[floor(x / spacing)][floor(y / spacing)];

void setup() {
  size(x, y, P2D);
  background(0, 0, 0);
  noStroke(); noSmooth();
  
  xnum = width / spacing; ynum = height / spacing;
  
  for (int i = 1; i < xnum; i ++) {
    for (int j = 1; j < ynum; j ++) {
      dots[i][j] = floor(random(255));
    }
  }
}

void draw() {
  drawDots();
}

void drawDots() {
  float dis, x, y, colx, coly, col;
  float disx, disy;
  noStroke();
  for (int i = 1; i < xnum; i ++) {
    for (int j = 1; j < ynum; j ++) {
      dots[i][j] += random(speed);
      dots[i][j] = dots[i][j]%256;
      
      x = (i * spacing) - (sqrSize / 2); y = (j * spacing) - (sqrSize / 2);
      
      disx = abs(x - mouseX); disy = abs(y - mouseY);
      dis = sqrt((disx * disx) + (disy * disy));
      
      col = 2 * (abs(dots[i][j] - 127) * (1 - (dis / twinkleSize)));
      fill(0.25 * col, 0.75 * col, col);

      rect(x, y, sqrSize, sqrSize);
    }
  }
}

