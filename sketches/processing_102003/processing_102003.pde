
// Establish a range of values on the complex plane
// A different range will allow us to "zoom" in or out on the fractal
// float xmin = -1.5; float ymin = -.1; float wh = 0.15;
//float xmin = -3;
//float ymin = -1.25;
float w = 5;
float h = 2.5;
//----------values------------//
int maxiterations = 100;
float y1T, y2T;
float y1B, y2B;
float x1, x2;
float dx, dy;
float yT, yB;
float ex, wy;
float mU, mD;
float bU, bD;
//-----initialize-----//
y1T = .05;
y2T = .1;
y1B = -.05;
y2B = -.1;
x1 = .25;
x2 = .27;
//--------calc----------//
mU = (y2T-y1T)/(x2-x1);
mD = (y2B-y1B)/(x2-x1);
bU = y1T - (mU*x1);
bD = y1B - (mD*x1);
dx = (x2-x1)/width;
//-----------setup-----------//
size(640, 360);
noLoop();
background(255);
loadPixels();
//----------iter------------//
yT = (mU*x1)+bU;  //ymax
yB = (mD*x1)+bD;  //ymin
dy = (yT-yB)/height;
// Start x
ex = x1;
for (int i = 0;  i < width; i++) {
  // Start y
  wy = yB;
  for (int j = 0; j < height; j++) {

    // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
    float a = ex;
    float b = wy;
    int n = 0;
    while (n < maxiterations) {
      float aa = a * a;
      float bb = b * b;
      float twoab = 2.0 * a * b;
      a = aa - bb + ex;
      b = twoab + wy;
      // Infinty in our finite world is simple, let's just consider it 16
      if (aa + bb > 16.0) {
        break;  // Bail
      }
      n++;
    }
    if (n == maxiterations) {      pixels[i+j*width] = color(0);    }
    else {      pixels[i+j*width] = color(n*16 % 255);    }
    
    yT = (mU*ex)+bU;  //ymax
    yB = (mD*ex)+bD;  //ymin
    dy = (yT-yB)/height;
    wy += dy;
  }
  ex += dx;
}
updatePixels();


