
private boolean julia = false;
private int detail = 3; // try 2, 1 or 0, more detail, less framerate
float zoom = 1, moveX = -0.5f, moveY = 0;
PImage offscreen;

void setup() {
  size(512,512,P2D);
  colorMode(HSB);
  loadPixels();
}

void draw() {
  if (mousePressed) {
    float zoomfactor = 0.3f/zoom;
    // zoom in
    if (mouseButton == LEFT) {
      moveX += ((float)(mouseX-256)/width) * zoomfactor;
      moveY += ((float)(mouseY-256)/height) * zoomfactor;
      zoom *= 1.04;
    }
    // zoom out
    if (mouseButton == RIGHT) {
      moveX += ((256-mouseX)/(float)width) * zoomfactor;
      moveY += ((256-mouseY)/(float)height) * zoomfactor;
      zoom /= 1.04;
      zoom = zoom < 1 ? 1 : zoom;
    }
  }
  float rfactor = 1/(0.3f * width * zoom ); // precalc real factor
  float ifactor = 1/(0.3f * height * zoom); // precalc imaginary factor
  int yoffset = 0;
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float real, imaginary, nextReal, nextImaginary, currentReal, currentImaginary;
      // screen represents a specific area in the complex plane, going from -0.3 to 0.3 in the real axis
      // formula: Zn+1 = Z^2 + C 
      // Z and C are complex numbers
      // if "julia set" then mousse coordinates specify C
      // else Mandelbrot set.
      nextReal = julia ? (x - 256) * rfactor  + moveX : 0;
      nextImaginary = julia ? (y - 256) * ifactor + moveY : 0;
      real = julia ? (mouseX - 256) * rfactor + moveX: (x - 256) * rfactor  + moveX;
      imaginary = julia ? (mouseY - 256) * rfactor + moveX : (y - 256) * ifactor + moveY;

      int maxiterations = 256>>detail; // more detail means more iterations, less framerate
      int iterations = 0;
      for (iterations = 0; iterations < maxiterations; iterations++) {
        currentReal = nextReal;
        currentImaginary = nextImaginary;
        nextReal = currentReal * currentReal - currentImaginary * currentImaginary + real;
        nextImaginary = 2 * currentReal * currentImaginary + imaginary;
        // multiplying complex numbers make them "spin" on the complex plane
        // if they escape a circle with diameter 4 the iterations stop
        if((nextReal * nextReal + nextImaginary * nextImaginary) > 4) break;
      }
      //the number of iterations that take to escape the circle represents the color
      // black, means they did not escape the circle.
      pixels[x+yoffset] = color((iterations<<detail)&0xff,255,(iterations == maxiterations ? 0: 255));
      ; 
    }
    yoffset += width;
  }
  updatePixels();
}

public void keyPressed() {
  if (key == 'j') {
    julia = !julia;
  }
  // space to reset
  if (key == ' ') {
    zoom = 1;
    moveX = -0.5f;
    moveY = 0;
  }
  if (key == 's') {
    saveFrame();
  }
}



