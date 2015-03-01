
float theta;
float alteration;
float rotationSpeed;
float rotation;
 
//DECLARE
ArrayList mandelbrotCollection;
 
int depth = 5;
int mandelbrots = 1;
int screenSize = 1000;
 
void setup() {
  size(1000, 1000);
  //size(screenSize, screenSize);
  smooth();
  mandelbrotCollection = new ArrayList();
 
  for (int i = 0; i < mandelbrots; i++) {
 
    PVector origin = new PVector(0, 0);
    Mandelbrot myMandelbrot = new Mandelbrot(origin);
    mandelbrotCollection.add(myMandelbrot);
  }
}
 
void draw() {
  background(0);
  translate(0.5*screenSize, 0.5*screenSize);
 
  rotationSpeed = rotationSpeed += 0.025;
  rotation = (rotationSpeed);
 
  rotate(rotation);

  for (int i = 0; i < mandelbrotCollection.size (); i++) {
    rotate(TWO_PI/mandelbrots);
    
    pushMatrix();
    Mandelbrot mb = (Mandelbrot) mandelbrotCollection.get(i);
    mb.run();
    popMatrix();
  }
}
 
 
class Mandelbrot {
 
  float strokeWidth_min = 1;
  float strokeWidth_max = 5;
  float strokeWidth = (random(strokeWidth_min, strokeWidth_max));
  float randomTheta = random(0, 50);
 
  PVector loc = new PVector (0, 0, 0);
 
  Mandelbrot(PVector _loc) {
 
    loc = _loc;
  }
 
  void run() {
    display();
  }

  void display() {
    //theta = map(0, 0, 500, 0, PI/2);
    //translate(0.5*width, 0.50*height);
    
    background(255);

theta = theta += (0.03125);
alteration = tan(theta);

float w = 10;
float h = (w * width) / height;

float xmin = -w/2;
float ymin = -h/2;

loadPixels();

int maxiterations = 2;

float xmax = xmin + w;

float ymax = ymin + h;

float dx = (xmax - xmin) / (width);
float dy = (ymax - ymin) / (height);

float y = ymin;
for (int j = 0; j < height; j++) {
  // Start x
  float x = xmin;
  for (int i = 0; i < width; i++) {

    float a = x;
    float b = y;
    int n = 0;
    while (n < maxiterations) {
      float aa = a * a;
      float bb = b * b;
      float twoab = alteration * a * b;
      //a = sq(aa + bb) % x;
      //b = sq(twoab) * y;
      a = sq(aa + bb)/10 / x;
      b = sq(twoab)/10 / y;
      if (aa + bb > 50.0) {
        break;
      }
      n++;
    }

    if (n == maxiterations) {
      pixels[i+j*width] = color(255);
    } else {
      pixels[i+j*width] = color(0);
    }
    x += dx;
  }
  y += dy;
}
updatePixels();
}
}
