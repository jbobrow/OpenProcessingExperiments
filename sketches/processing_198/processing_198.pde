
/**
 * The Fern Fractal
 * by Luis Correia.  
 * 
 * Simple rendering of a fern.
 */
 
// Initial point: x0 must be 0 and y0 can be any value >=0.
float x0 = 0;
float y0 = 0;
float x; 
float y;
float r;
int i;
int j;

void setup() {
  size(500, 500);
  noLoop();
}

void draw() {

  background(0);
  
  loadPixels();
  
  // Maximum number of iterations
  int maxiterations = 1000000;
  
  int n = 0;

  while (n++ < maxiterations) {

    r = random(100);

    if (r <= 1) {
      x = 0;
      y = 0.16 * y0;
    }
    else {
      if (r <= 7) {
        x = 0.2 * x0 - 0.26 * y0;
        y = 0.23 * x0 + 0.22 * y0;
      }
      else {
        if (r <= 14) {
          x = -0.15 * x0 + 0.28 * y0;
          y = 0.26 * x0 + 0.24 * y0 + 0.44;
        }
        else {
          x = 0.85 * x0 + 0.04 * y0;
          y = -0.004 * x0 + 0.85 * y0 + 1.6;
        }
      }
    } 

    i = height - int(y * 45);
    j = width / 2  + int(x * 45);

    if (i >= 0 && i < height && j >= 0 && j < width) {
      pixels[i * height + j] += 512;
    }

    x0 = x;
    y0 = y;
 
  }

  updatePixels();

}

