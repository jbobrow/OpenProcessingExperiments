
// Kaleidoscope with 4-fold symmetry made from rotating bezier shapes, with color and shape mutation
// Sky Meadow 
// 01 Sep 2008

// global constants and variables
PGraphics kw;              // kaleidoscope workspace - superimposed floating objects
int d = 600;               // dimension. If slow computer, use smaller dimension for display window.
int numShapes = 10;         // randomized in mousePressed
int minShapes = 5;
int maxShapes = 40;         // max that can be created       
int maxv = 15;             // max points defining the bezier shape
int maxp = maxv * 2 + 1;    // max x points
float lc1 = .0005;          // colorchange stepsize parameters
float lc2 = .002;
float outOfBounds = 1;   // d multiplier determines when to retire a shape that has strayed
int fadeOut = -1; 
int fadeIn = 1;
int noFade = 0;
float fadeSpeed = 0.01;    // something between 0 - 1.0 for lerp
Shape[] sh;                 // array of Shape objects

void setup() {
  size(d, d, P3D);                    // drawing canvas
  kw = createGraphics(d, d, P3D);     // the kaleidoscope background thing
  kw.beginDraw();                     // we stay in the kw context throughout, so endDraw not needed?
  kw.background(0);
  kw.noStroke();
  kw.colorMode(HSB,255);               
  frameRate(30);                      // default is 60
  sh = new Shape[maxShapes];          // allocate storage for the Shape objects
  for (int i=0; i<maxShapes; i++) {   // construct them 
    sh[i] = new Shape(); 
  }
  background(0);
  noStroke();
  colorMode(HSB,255);                    
}

void draw() {
  kw.background(0);                   // erase then rebuild frame
  for (int i=0; i<numShapes; i++) {
    sh[i].display();
    sh[i].mutateColor();
    mirror();                        // copy pixels from kw to display window 
//    image(kw, 0, 0);               // for debugging
    if ((sh[i].fadeState != fadeIn) && sh[i].t < 2) {        // When opacity is near zero, replace it with a new one
      sh[i].addShape(i);
      println("Added shape "+i);
    }
  }
}

class Shape {
  color c, f;                    // current color, future color
  float lerpc, lerpcstep;        // value from 0.0 to 1.0 for color interpolation from c to f
  int t, tf;                     // opacity (255 = completely opaque)
  int fadeState;
  float fadeAmount;              // between 0 and 1 for lerp
  float xincr, yincr;            // translation movement
  float xoffset, yoffset;        // current offset for 3D functions
  float angleX, angleY, angleZ;  // amount to rotate
  int n;                         // number of vertices this object has
  float[] xpts, ypts;
  float rots;                   // number of rotations
  float cx, cy;                 // centering

  Shape() {
    xpts = new float[maxp+1]; // allocate the maximum possible storage
    ypts = new float[maxp+1];
    n = int(random(7, maxp+1)); // 
    for (int i=0; i<maxp; i++) { // select some vertices
      xpts[i] = random(-.05*d, 1.05*d);  
      ypts[i] = random(-.05*d, 1.05*d); 
    }
    cx = (max(xpts) - min(xpts))/2;     
    cy = (max(ypts) - min(ypts))/2;
    for (int i=0; i<maxp; i++) { // select some vertices
      xpts[i] = xpts[i]-cx;  
      ypts[i] = ypts[i]-cy;  
    }
    xpts[n] = xpts[0];   
    ypts[n] = ypts[0]; // set last coord equal to 1st coord
    t = int(random(.3*255,.5*255));       // alpha value specifying desired opacity
    tf = t;
    fadeState = noFade; 
    colorMode(HSB, 255);                    // select color for shape
    c = color( int(random(255)), int(random(200,255)), int(random(148,255)));  // initial color
    f = color( int(random(255)), int(random(200,255)), int(random(148,255)));  // future color (mutation)
    lerpc = 0.0;                           // used in color interpolation
    lerpcstep = random(lc1, lc2);          // tiny steps for color mutation              
    angleX = random(-PI, PI)/360;          // determine shape's rotation speed
    angleY = random(-PI, PI)/360;          // determine shape's rotation speed
    angleZ = random(-PI, PI)/360;          // determine shape's rotation speed
    rots = 0;                              // initialize number of rotation                
    xincr = random(-d/400,d/400);          // establish translation speed
    yincr = random(-d/400,d/400);
    xoffset = 0; 
    yoffset = 0;
  } 

  void display() {
    kw.pushMatrix();
    kw.translate(xoffset += xincr, yoffset += yincr);     // translate first
    kw.popMatrix();
    kw.pushMatrix();
    kw.translate(cx, cy);          // rotate shape around its center second
    kw.rotateX(angleX * rots++);
    kw.rotateY(angleY * rots++);
    kw.rotateZ(angleZ * rots++);    // rotate by angle ... z axis is normal to the screen
    kw.fill(c,t); 
    kw.beginShape();
    kw.vertex(xpts[0], ypts[0]);  // first vertex x,y
    for (int i=0; i<n-1; i = i+2) {
      kw.bezierVertex( xpts[i], ypts[i], xpts[i+1],ypts[i+1],xpts[i+2],ypts[i+2] );
    }   
    kw.endShape(CLOSE);
    kw.popMatrix();
    // if shape strays too far, mark for replacement by running opacity to zero
    if (((max( abs(max(xpts)), abs(min(xpts))) + abs(xoffset)) > d*outOfBounds) || 
      ((max( abs(max(ypts)), abs(min(ypts))) + abs(yoffset)) > d*outOfBounds))
    { 
      if(fadeState == fadeOut) {
      } 
      else {
        println("Flagged out of bounds");
        fadeState = fadeOut;
        fadeAmount = fadeSpeed;
      }
    }
  } // end display method

    void addShape(int whichOne) {
    int w = whichOne;
    sh[w] = new Shape();
    sh[w].c = color( int(random(255)), int(random(148,255)), int(random(148,255))); 
    sh[w].f = color( int(random(255)), int(random(148,255)), int(random(148,255)));  // and future color: bright
    sh[w].lerpc = 0.0;                         // reset color interpolation
    sh[w].lerpcstep = random(lc1, lc2);  // colorchange step size 
    sh[w].fadeState = fadeIn;
    sh[w].fadeAmount = fadeSpeed;
    sh[w].t = 1;                            // from zero opacity
    sh[w].tf = int(random(.15*255,.5*255)); // to alpha value specifying desired opacity
  }  // end addShape method

  void mutateColor() {                      // Change color from c to f stepwise.  reset if c = f.
    if (fadeAmount >= 1) {
      fadeState = noFade;                  // done with the fade operation
      //      println("Completed fade; noFade set");
    } 
    else {
      if (fadeState == fadeIn) { 
        t = int(lerp (t, tf, fadeAmount += fadeSpeed));  // opacity goes from t to tf
        //        println("Fading in t, tf, fadeAmount "+t+" "+tf+" "+fadeAmount);
      } 
      else if(fadeState == fadeOut) { 
        t = int(lerp (t, 0, fadeAmount += fadeSpeed));   // opacity goes to 0
        //        println("Fading out t, 0, fadeAmount "+t+" "+tf+" "+fadeAmount);
      }
    }
    lerpc = lerpc + lerpcstep; 
    //    println("lerpc "+lerpc);
    if (lerpc < 1.0) {
      c = lerpColor(c, f, lerpc);
    } 
    else {                                  // pick a new future color and start again
      c = f; 
      f = color( int(random(255)), int(random(148,255)), int(random(148,255)));
      lerpc = 0.0;                
      lerpcstep = random(lc1, lc2);          // tiny steps    
      fadeState = noFade;
      t = int(random(.15*255,.5*255));
      //      println("picked new color; no fade");
    }
  }  

} // end class Shape

void mirror() { 
  color p;
  for (int y=0; y<(d/2); y++) {  // copy wedge-shaped 1/8 of square
    for (int x=y; x<(d/2); x++) {
      p = kw.get(x,y);           // get one pixel from the workspace
      set (x,y,p);               // put it to the display window 
      set (y,x,p);
      set (x,d-y-1,p);
      set (y,d-x-1,p);  
      set (d-x-1,y,p);
      set (d-x-1,d-y-1,p);
      set (d-y-1,x,p);
      set (d-y-1,d-x-1,p);    
    }
  }
}

void mousePressed() {    // randomize many of the variables, clear screen, create new shapes
  numShapes = int(random(minShapes,maxShapes));
  println("Numshapes = "+numShapes);
  for (int i=0; i<maxShapes; i++) {      // construct a set of new shapes
    sh[i] = new Shape();
  }
}

