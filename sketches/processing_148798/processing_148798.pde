
TravellingPoint[] points;
int[] colors = {
  #510FAD, #4E2982, #320571, #8144D6, #976BD6, 
  #EF002A, #Be2D45, #9B001C, #F73E5F, #F76F87, 
  #057D9F, #216477, #025167, #39AECF, #61B7CF
};
int numPoints = 50;
int frames = 0;
int numFrames;
String dirPath = nf(int(random(0, 1000)), 4);

class TravellingPoint {
  float t;
  float stepSize;
  int mColor;
  PVector ctrl1;
  PVector ctrl2;
  PVector anchor1;
  PVector anchor2; 

  TravellingPoint(float _stepSize, int _color, 
  PVector _anchor1, PVector _ctrl1, 
  PVector _ctrl2, PVector _anchor2) {
    t = 0;
    stepSize = _stepSize;
    mColor = _color;
    anchor1 = _anchor1;
    ctrl1 = _ctrl1;
    ctrl2 = _ctrl2;
    anchor2 = _anchor2;
  }

  void run() {
    t += stepSize;
    if (t < 1.0) {
      float x = bezierPoint(anchor1.x, ctrl1.x, ctrl2.x, anchor2.x, t);
      float y = bezierPoint(anchor1.y, ctrl1.y, ctrl2.y, anchor2.y, t);
      this._draw(x, y);
    }

  }

  void _draw(float x, float y) {
    noStroke();
    fill(mColor);
    ellipse(x, y, 5, 5);
  }
}

void setup() {
  size(400, 200);
  background(#000000);
  frameRate(30);

  points = new TravellingPoint[0];
  recreate();
}

void recreate() {
  points = new TravellingPoint[numPoints];
  for (int i = 0; i < numPoints; i++) {
    points[i] = createPoint();
  }
}

void mouseReleased() {
  recreate();
}

TravellingPoint createPoint() {
  int thisColor = colors[int(random(0, colors.length - 0.001))];
  float stepSize = 0.01;
  numFrames = int(1.0 / stepSize) + 10;
  PVector anchor1 = new PVector(0, random(0, height));
  PVector anchor2 = new PVector(width, random(0, height));
  PVector ctrl1 = new PVector(random(-width/2, 1.5*width), 
  random(-height/2, 1.5*height));
  PVector ctrl2 = new PVector(random(-width/2, 1.5*width), 
  random(-height/2, 1.5*height));
  return new TravellingPoint(stepSize, thisColor, anchor1, 
  ctrl1, ctrl2, anchor2);
}

void draw() {
  // Fade the whole screen.
  noStroke();
  fill(#000000, 50);
  rect(0, 0, width, height);

  // Evaluate all the curves at their new points and draw objects. 
  for (int i = 0; i < points.length; i++) {
    points[i].run();
  }
}

class TImage extends PImage implements Runnable {//separate thread for saving images
  String filename;

  TImage(int w, int h, int format, String filename) {
    this.filename = filename;
    init(w, h, format);
  }

  public void saveThreaded() {
    new Thread(this).start();
  }

  public void run() {
    this.save(filename);
  }
}



