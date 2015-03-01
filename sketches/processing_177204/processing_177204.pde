
// Written by Lionel Ringenbach
// December 2014

int n = 20;
int space = 150;
int inc = 5;
int color1 = 0;
int color2 = 255;

float centerX;
float centerY;
int[] triSizes;

void setup() {
  size(800, 800);
  noStroke();

  centerX = width / 2;
  centerY = height / 2;

  triSizes = new int[n];
  for (int i = 0; i < n; ++i) {
    triSizes[i] = i * space;
  }
}

void draw() {
  background(255);

  for (int i = n - 1; i >= 0; --i) {
    int triSize = triSizes[i];

    // draw
    fill(i % 2 == 0 ? color1 : color2);
    equi(centerX, centerY, triSize);

    // increment
    triSize += inc;
    triSizes[i] = triSize;
  }

  int lastSize = triSizes[n - 1];
  if (lastSize >= n * space) {
    // shift elements
    for (int i = n - 1; i > 0; --i) {
      triSizes[i] = triSizes[i - 1];
    }
    triSizes[0] = 0;
    switchColor();
  }
}

void switchColor() {
  int temp = color1;
  color1 = color2;
  color2 = temp;
}

//////////////
// Geometry //
//////////////

void equi(float a, float b, float c) {
  float h = triHeight(c, c / 2);
  float h3 = h / 3;

  float x1 = a;
  float y1 = b - 2 * h3;
  float x2 = a - c / 2;
  float y2 = b + h3;
  float x3 = a + c / 2;
  float y3 = b + h3;

  triangle(x1, y1, x2, y2, x3, y3);
}

float triHeight(float hypo, float a) {
  return sqrt(pow(hypo, 2) - pow(a, 2));
}


