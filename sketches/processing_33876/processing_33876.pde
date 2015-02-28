
// AbstractMotion 
//
// Is it art?  You be the judge.  But I like these images more than some of the
// well-regarded cubists and abstract impressionists.  Does this sketch raise
// questions on notions of aesthetics in shape, color, motion, form and composition?
//
// Draw a bezier shape then vary some of its points
// Added shape persistence and motion
//
// Sky Meadow 02 Sep 2008
//
// Reseed a new image by clicking the mouse. 
// 's' to add shape outlining with stroke(0), 'n' for the default noStroke();
// If you don't click anything, the composition is forever changing.  

PGraphics kw;              // kaleidoscope workspace - superimposed floating objects
int d = 600;
int minShapes = 2;
int maxShapes = 6;          // max that can be created  
int numShapes = maxShapes;
Shape[] sh;                 // array of Shape objects
int st = 0;                 // stroke or no stroke - keyboard 's'

void setup () {
  size(d,d);
  kw = createGraphics(d, d, P3D);     // the kaleidoscope background thing
  kw.beginDraw();
  kw.noStroke();
  kw.background(0);
  kw.colorMode(HSB);
//  kw.smooth();
  kw.endDraw();
  frameRate(30);
  sh = new Shape[maxShapes];          // allocate storage for maximum number of Shape objects
  for (int i=0; i<maxShapes; i++) {      // construct a set of new shapes
    sh[i] = new Shape();
  }
  colorMode(HSB);
  noStroke();
  background(0);
  // smooth();
}

void draw() {
  kw.beginDraw();
  kw.background(0);
  for (int i=0; i<numShapes; i++) {
    for (int j=0; j<sh[i].reps; j++) {
      sh[i].drawShape(); 
    }
  }
  image(kw,0,0);
} // end draw

class Shape {
  float[] x1, y1, x2, y2;
  int numpts = 17; // must be an odd number
  int reps;
  color c;
  int t;

  Shape() { // it has to return a pointer, hence, not void
    x1 = new float[numpts+1]; 
    y1 = new float[numpts+1]; 
    x2 = new float[numpts+1]; 
    y2 = new float[numpts+1];  
    c = color (int(random(255)), int(random(148,255)), int(random(148,255)));
    reps = int(random(5,25));
    t = int(random(.05*255/reps, 255/reps))*(st+1); // low opacity - many retraces
     for (int i=0; i<numpts+1; i++) { 
      x1[i] = random(d); 
      y1[i] = random(d);
      x2[i] = random(-.6*d, .6*d) + x1[i];
      y2[i] = random(-.6*d, .6*d) + y1[i];
    }
  }

  void drawShape() {
    kw.beginDraw();
    kw.fill(c,t);
    if (st == 1) { kw.stroke(0); } else {kw.noStroke();}
    kw.beginShape();
    kw.vertex (x1[0], y1[0]);
    for (int i=1; i<numpts; i= i+2) {
      int j = i;
      kw.bezierVertex(x1[j], y1[j], x1[j+1], y1[j+1], x1[j+2], y1[j+1]);
    }
    kw.endShape();
    kw.endDraw();
    //  move the point.  if it reachd its attractor bring it back in bounds with a new attractor   
    for (int i=0; i<numpts; i++) {
      float ll = -0.6 * d;
      float ul = +0.6 * d; // lower and upper limits for random selection fo new point
      x1[i] = lerp( x1[i], x2[i], .05);
      if(abs(x1[i]-x2[i])<.001) {     
        if(x1[i] > d) {  // it's too big move it down
          ul = 0.1 * d; 
        }
        if (x1[i] < 0) {
          ll = -0.1* d;  // too small, move it up
        }
        x2[i] = random(ll, ul) + x1[i]; 
      }
      y1[i] = lerp( y1[i], y2[i], .05);
      ul = +0.6 * d;
      ll = -0.6 * d;
      if(abs(y1[i]-y2[i])<.001) {     
        if(y1[i] > d) {  // it's too big move it down
          ul = 0.1 * d; 
        }
        if (y1[i] < 0) {
          ll = -0.1* d;  // too small, move it up
        }
        y2[i] = random(ll, ul) + y1[i]; 
      }  
    }
  } // end drawShape  
} // end class Shape

void keyPressed() {
  if (key == 's' || key == 'S') {st = 1;}
  if (key == 'n' || key == 'N') {st = 0;}
}

void mousePressed() {
  kw.background(0);
  for (int i=0; i<maxShapes; i++) {      // construct a set of new shapes
    sh[i] = new Shape();
  }
  redraw();
}

