
PVector old_point;
int i;
int j;
int quant;

void setup() {
  size(500, 500);
  background(0);
  old_point = new PVector(0, 0);
  quant = 1000;//Use larger number for faster, but less smooth, image creation
}

void draw() {
  loadPixels();
  for (int k=0; k<quant; k++) {

    PVector plottedpoint = runFernFractal(old_point);
//    PVector plottedpoint = runSierpinskiGasket(old_point);

    i = height - int(plottedpoint.y);
    j = width / 2  + int(plottedpoint.x);

    if (i >= 0 && i < height && j >= 0 && j < width) {
      pixels[i * height + j] += 512;
    }
    updatePixels();
  }
}

PVector runFernFractal(PVector point) {
  float r = random(100);
  float x0 = point.x;
  float y0 = point.y;
  float x=0;
  float y=0;
  if (r <= 1) {
    x = 0;
    y = 0.16 * y0;
  }
  else {
    if (r <= 7) {
      x = 0.2 * x0 - 0.26 * y0;
      y = 0.23 * x0 + 0.22 * y0;
    }
    else if (r <= 14) {
      x = -0.15 * x0 + 0.28 * y0;
      y = 0.26 * x0 + 0.24 * y0 + 0.44;
    }
    else {
      x = 0.85 * x0 + 0.04 * y0;
      y = -0.004 * x0 + 0.85 * y0 + 1.6;
    }
  } 
  old_point = new PVector(x, y);
  return PVector.mult(old_point, 45);//Multiply so the fractal will be visible!
}

//Sierpinski Gasket based on exposition at:
//http://ecademy.agnesscott.edu/~lriddle/ifs/siertri/siertri.htm
PVector runSierpinskiGasket(PVector point) {
  float r = random(100);
  float x0 = point.x;
  float y0 = point.y;
  float x=0;
  float y=0;
  if (r<=33) {
    x = 0.5*x0;
    y = 0.5*y0 + 0.5;
  }
  else if (r<=66) {
    x = 0.5*x0 - 0.5;
    y = 0.5*y0;
  }
  else {
    x = 0.5*x0+0.5;
    y = 0.5*y0;
  }
  old_point = new PVector(x, y);
  return PVector.mult(old_point, 300);//Multiply so the fractal will be visible!
}
