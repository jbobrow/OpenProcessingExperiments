
/*Mandelbrot Set Attractors*/
/*John Clavin*/

float mXmin = -1.5;
float mYmin = -1.0;
float mWidth = 2.0;
float mHeight = 2.0;
float mXmax;
float mYmax;
float mXincrement;
float mYincrement;
int scrWidth;
int scrHeight;
int maxIterations;
PImage mImage;
PImage currentImage;

void setup() {
  size(640, 640);
  frameRate(30);
  scrWidth = width;
  scrHeight = height;
  noStroke();
  maxIterations = 5000;
  mXmax = mXmin + mWidth;
  mYmax = mYmin + mHeight;
  mXincrement = mWidth / scrWidth;
  mYincrement = mHeight / scrHeight;
  drawMandelbrot();
  mImage = get(0, 0, scrWidth, scrHeight);
  currentImage = mImage;
}

void draw() {
  image(currentImage, 0, 0);
  drawAttractor(mouseX, mouseY);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    currentImage = get(0, 0, scrWidth, scrHeight);
  } else {
    currentImage = mImage;
  }
}

void drawAttractor(int scrXpoint, int scrYpoint) {
  float mXpoint;
  float mYpoint;
  float scrXratio;
  float scrYratio;
  float scrXiPoint;
  float scrYiPoint;
  scrXratio = float(scrXpoint) / scrWidth;
  mXpoint = mXmin + (scrXratio * mWidth);
  scrYratio = float(scrHeight - scrYpoint) / scrHeight;
  mYpoint = mYmin + (scrYratio * mHeight);
  // println(" "+mXpoint+" "+mYpoint+" ");
  float a = mXpoint;
  float b = mYpoint;
  int n = 0;
  while (n < maxIterations) {
    scrXiPoint = (a - mXmin) / mWidth * scrWidth;
    scrYiPoint = scrHeight - (b - mYmin) / mHeight * scrHeight;
    fill(255);
    ellipse(scrXiPoint, scrYiPoint, 3, 3); 
    float aa = a * a;
    float bb = b * b;
    float twoab = 2.0 * a * b;
    a = aa - bb + mXpoint;
    b = twoab + mYpoint;
    if (aa + bb > 10.0) {
      break;
    }    
    n++;
  }
}  

void drawMandelbrot() {
  float manXpoint;
  float manYpoint;
  loadPixels();
  manYpoint = mYmax;
  for (int j = 0; j < scrHeight; j++) {
    manXpoint = mXmin;
    for (int i = 0;  i < scrWidth; i++) {
      float a = manXpoint;
      float b = manYpoint;
      int n = 0;
      while (n < maxIterations) {
        float aa = a * a;
        float bb = b * b;
        float twoab = 2.0 * a * b;
        a = aa - bb + manXpoint;
        b = twoab + manYpoint;
        if (aa + bb > 16.0) {
          break;
        }
        n++;
      }
      if (n == maxIterations) {
        pixels[i+j*scrWidth] = color(0);
      } else {
        pixels[i+j*scrWidth] = color(n*16 % 255);
      }
      manXpoint += mXincrement;
    }
    manYpoint -= mYincrement;
  }
  updatePixels();
}


