
// Coloring the plane in black and white.

int canvasSize = 400;
int y0 = 0;
color black = color(0);
color white = color(255);

boolean horizontal = false;
  
void setup() {
  size(400, 400);
  background(white);
  loadPixels();
}

void draw() {
}

int getX(float slope, int b, int y) { // b is y-intercept
  float result = (y - b) / slope;
  return (int) result;
}

float getSlope(int x1, int y1, int x2, int y2) {
  return (float)(y2 - y1) / (x2 - x1);
}

int getYIntercept(float slope, int x1, int y1) {
  float result = y1 - (slope * x1);
  return (int) result;
}

void mouseClicked() {
  // Draw a random line and set a region
  int[] points = getPoints();
  float slope = getSlope(points[0], points[1], points[2], points[3]);
  int b = getYIntercept(slope, points[2], points[3]);

  for (int i = 0; i < pixels.length; i++) {
    // Iterate over pixels as an array of the whole image.
    int x = i % canvasSize;
    int y = (int) i / canvasSize; // is there a way to get these in one step?

    int limit = getX(slope, b, y);

    if (x < limit) {
      color current = get(x, y);
      if (current == black) {
        pixels[i] = white;
      } 
      else {
        pixels[i] = black;
      }
    }
  }

  horizontal = !horizontal;
  
  updatePixels();
}

int[] getPoints() {
  if (horizontal) { // Get a line that crosses the plane horizontally-ish
    int leftX = 0;
    int leftY = (int) random(y0, canvasSize);
    int rightX = canvasSize;
    int rightY = (int) random(y0, canvasSize);
    int[] points = { 
      leftX, leftY, rightX, rightY
    };
    return points;
  } 

    // Default line is vertical 
    int topX = (int) random(y0, canvasSize);
    int topY = 0;
    int bottomX = (int) random(y0, canvasSize);
    int bottomY = canvasSize;
    int[] points = { 
      topX, topY, bottomX, bottomY
    };
    
  return points;
}



