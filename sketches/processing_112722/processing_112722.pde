
// A Julia set fractal explorer
// Clicking will give you the Julia Set for that complex
// number

final int maxIter = 20;
final float upperLeftX = -2.5;
final float upperLeftY = 2.5;
final float viewWidth = 5.0;
PFont f;

//  Set the size and font
void setup() {
  size(700, 700);
  drawJuliaSet(-1, 0);
  //f = loadFont("Monospaced-24.vlw");
  textFont(f, 24);
}

// Empty, but needs to be here in order
// for mouse interaction
void draw() {
}

// When the mouse moves, update the coordinates
void mouseMoved() {
  fill(0);
  float a = getReal(mouseX);
  float b = getImaginary(mouseY);
  writeCoordinates(a, b);
}

// Draws the Julia Set for the given complex number ca + cb*i
void drawJuliaSet(float ca, float cb) {
  
  float escapeValue = max(dist(ca, cb, 0, 0), 2.0);

  for (float row = 0; row <= height; row++)
    for (float col = 0; col <= width; col++) {

      int iterations = 0;

      float a = getReal(col);
      float b = getImaginary(row);

      while (dist(a,b, 0,0) < escapeValue && iterations < maxIter) {
        float newA = a*a - b*b + ca;
        float newB = 2*a*b + cb;
        a = newA;
        b = newB;
        iterations++;
      }

      if (dist(a,b, 0,0) < escapeValue) // didn't escape
        stroke(255);
      else
        stroke(1.0*iterations/maxIter * 255);

      point(col, row);
    }
}

// If the mouse is pressed, draw the Julia set for the new coordinates
void mousePressed() {
  drawJuliaSet(getReal(mouseX), getImaginary(mouseY));
  writeCoordinates(getReal(mouseX), getImaginary(mouseY));
}

// Compute the real component for a given x coordinate on
// the grid, scaled by the window size.
float getReal(float x) {
  return upperLeftX + 1.0 * x / width * viewWidth;
}

// Compute the real component for a given y coordinate on
// the grid, scaled by the window size.
float getImaginary(float y) {
  return upperLeftY - 1.0 * y / height * viewWidth;
}

// Writes the coordinates to the screen
void writeCoordinates(float x, float y) {
  fill(0);  
  rect(0, 0, 350, 50);  
  fill(255);
  text(String.format("%.3f + %.3fi", x, y), 25, 25);
}
