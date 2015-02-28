
RotatingCurve[] curves;
int NUM_CURVES = 256;
String dirPath = nf(int(random(0, 1000)), 4);
int[] colors = {
  #D2006B, #9D2763, #880045, #E83A93, #E869AA, // magenta
  #133AAC, #2B4181, #062170, #476BD6, #6D87D6, // blue
  #FFAE00, /*#BF9230,*/ /*#A67100,*/ #FFC340, #FFD373 // orange 
};

void setup() {
  frameRate(60);
  size(1024, 768);
  smooth();
  noStroke();
  fill(#000000);
  rect(0, 0, width, height);
  
  curves = new RotatingCurve[NUM_CURVES];
  for (int i = 0; i < curves.length; i++) {
    curves[i] = new RotatingCurve(
      width, height, colors[int(random(colors.length))],
      PI / 16
    );
  }
}

void draw() {
  // Draw bg
  noStroke();
  fill(#000000, 10);
  rect(0, 0, width, height);
  
  // Might be cool to randomize the order on each pass?
  for (int i = 0; i < curves.length; i++) {
    curves[i].run();
  }
}

void mouseReleased() {
  // Save a single frame.
  TImage frame = new TImage(width, height, RGB, 
    sketchPath(dirPath + "/frame_" + nf(frameCount, 3) + ".png"));
  frame.set(0, 0, get());
  frame.saveThreaded();
}

class RotatingCurve {
  
  RotatingPoint anch1;
  RotatingPoint ctrl1;
  RotatingPoint anch2;
  RotatingPoint ctrl2;
  float t;
  float dt = random(0.001, 0.005);
  int mColor;
  float rad1;
  float rad2;
  int radCt;
  
  RotatingCurve(float _maxX, float _maxY, int _color, float _maxDTheta) {
    // Generate our four points "randomly"
    anch1 = createPoint(0, _maxX, 0, _maxY, _maxDTheta);
    anch2 = createPoint(0, _maxX, 0, _maxY, _maxDTheta);
    ctrl1 = createPoint(0, _maxX, 0, _maxY, 0);
    ctrl2 = createPoint(0, _maxX, 0, _maxY, 0);
    mColor = _color;
    t = random(1);
    rad1 = random(10);
    rad2 = random(30);
    radCt = 0;
  } 
  
  RotatingPoint createPoint(float _minX, float _maxX, float _minY, float _maxY, float _maxDTheta) {
    PVector org = new PVector(random(_minX, _maxX), random(_minY, _maxY));
    float radius = random(height / 8);
    float startTheta = random(TWO_PI);
    float dTheta = random(-_maxDTheta, _maxDTheta);
    return new RotatingPoint(org, radius, startTheta, dTheta);
  }
  
  void run() {
    // Move all of our points.
    anch1.run();
    ctrl1.run();
    anch2.run();
    ctrl2.run();
    
    radCt += 1;
    if (radCt >= 10) {
      radCt = 0;
      rad1 = random(10);
      rad2 = random(30);
    }

    // Draw an ellipse allong the bezier curve.
    t += dt;
    if (t > 1) {
      t = 1;
      dt = dt * -1;
    } else if (t < 0) {
      t = 0;
      dt = dt * -1;
    }
    
    float x = bezierPoint(anch1.pt.x, ctrl1.pt.x, ctrl2.pt.x, anch2.pt.x, t);
    float y = bezierPoint(anch1.pt.y, ctrl1.pt.y, ctrl2.pt.y, anch2.pt.y, t);
    
    noStroke();
    fill(mColor);  // Alpha?
    ellipse(x, y, rad1, rad2); // TODO(joe): Ellipse size can change.
  }
}

class RotatingPoint {
  PVector pt;
  PVector org;
  float radius;
  float theta;
  float dTheta;
 
  RotatingPoint(PVector _org, float _radius, 
                float _theta, float _dTheta) {
    org = _org;
    radius = _radius;
    theta = _theta;
    dTheta = _dTheta;
    pt = new PVector(0, 0);
    update();
  } 
 
  void run() {
    theta += dTheta;
    update();
  } 
  
  void update() {
    pt.x = org.x + sin(theta) * radius;
    pt.y = org.y + cos(theta) * radius;
  }
}

/**
 * Threaded Image saving
 */
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


