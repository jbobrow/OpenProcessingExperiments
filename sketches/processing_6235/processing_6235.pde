
// acd 20091123
// Sinusoidal Columns

public static final int GRID_SIZE = 16;
public static final int BLOCK_SIZE = 20;
public static final int SIZE = 640;
float[][] h;
color c0, c1, c2;
int a0, a1, a2;  // colour angles
int d0, d1, d2;  // colour deltas
float xfactor, yfactor;

void setup() {
  size(640, 640);  // SIZE above
  h = new float[GRID_SIZE][GRID_SIZE];
  colorMode(HSB, 360);
  initialise();
  smooth();
  frameRate(20);
}

void initialise() {
  d0 = int(random(-6, 6));
  d1 = int(random(-6, 6));
  d2 = int(random(-6, 6));
  a0 = (int)random(360);
  a1 = (int)random(360);
  a2 = (int)random(360);
  xfactor = random(-2, 2);
  yfactor = random(-2, 2);
}

void mousePressed() {
  initialise();
}

void keyPressed() {
  saveFrame("columns_####.png");
  delay(1000);
}

int index = 1;

void draw() {
  a0 = (a0 + d0) % 360;
  a1 = (a1 + d1) % 360;
  a2 = (a2 + d2) % 360;
  c0 = color(a0, 360, 360);  
  c1 = color(a1, 360, 360);  
  c2 = color(a2, 360, 360);  
  background(255);
  for (int x = 0 ; x < GRID_SIZE ; x++) {
    for (int y = 0 ; y < GRID_SIZE ; y++) {
      h[x][y] = 1 + cos((float)(xfactor * x + yfactor * y + index) / 5);
      drawColumn(x, y, h[x][y]);
    }
  }
  index++;
}

float XFACTOR = .866;
float YFACTOR = .5;
float ZFACTOR = -50;

//  0
// 1 2
//  3
void drawColumn(int x, int y, float h) {
  float x0 = SIZE / 2 + BLOCK_SIZE * XFACTOR * (y - x);
  float y0 = SIZE / 4 + BLOCK_SIZE * YFACTOR * (x + y);
  float x1 = SIZE / 2 + BLOCK_SIZE * XFACTOR * (y - (x + 1));
  float y1 = SIZE / 4 + BLOCK_SIZE * YFACTOR * ((x + 1) + y);
  float x2 = SIZE / 2 + BLOCK_SIZE * XFACTOR * ((y + 1) - x);
  float y2 = y1; //SIZE / 4 + BLOCK_SIZE * YFACTOR * (x + (y + 1));
  float x3 = x0; //SIZE / 2 + BLOCK_SIZE * XFACTOR * ((y + 1) - (x + 1));
  float y3 = SIZE / 4 + BLOCK_SIZE * YFACTOR * ((x + 1) + (y + 1));
  // top
  fill(c0);
  quad(x0, y0 + h * ZFACTOR, x1, y1 + h * ZFACTOR, x3, y3 + h * ZFACTOR, x2, y2 + h * ZFACTOR);
  // left
  fill(c1);
  quad(x2, y2 + h * ZFACTOR, x3, y3 + h * ZFACTOR, x3, y3, x2, y2);
  // right
  fill(c2);
  quad(x1, y1 + h * ZFACTOR, x1, y1, x3, y3, x3, y3 + h * ZFACTOR);
}

