
// Radial motion kaleidoscope
// Sky Meadow 
// 29 August 2008
// Mouse click:  new shapes
// Key 0 through 8:  select the kind of shape

PGraphics kw;            // kaleidoscope workspace - superimposed floating objects
int d = 600;             // dimension. If slow computer, use smaller dimension for display window.
int numShapes = 6;       // randomized in mousePressed
int minShapes = 5;
int maxShapes = 14;      // max that can be created
Shape[] shapes;          // an array of shape objects         
float lc1 = .0005;       // colorchange stepsize parameters
float lc2 = .002;
float outOfBounds = .4;  // d multiplier determines when to retire a shape that has strayed
int fadeOut = -1; 
int fadeIn = 1;
int noFade = 0;
float fadeSpeed = 0.005;    // something between 0 - 1.0 for lerp
int maxLobes = 9;
int shapeKind = -1;         // -1 means random.  0-8 specifies a certain kind. 

void setup() {
  size(d, d, P3D);                    // drawing canvas
  kw = createGraphics(d, d, P3D);     // the kaleidoscope background thing
  kw.beginDraw();                     // we stay in the kw context throughout, so endDraw not needed?
  kw.background(0);
  kw.noStroke();
  kw.colorMode(HSB,255);               
  frameRate(30);                      // default is 60
  shapes = new Shape[maxShapes];      // create 20 arrays, max number randomized when MousePressed.
  for (int i=0; i<maxShapes; i++) {      // construct a set of new shapes
    shapes[i] = new Shape(); 
  }
  background(0);
  noStroke();
  colorMode(HSB,255);                    
}

void draw() {
  kw.background(0);                // somehow this clears the workspace before building each new frame
  for (int i=0; i<numShapes; i++) {
    shapes[i].display();
    shapes[i].mutateColor();
    mirror();                     // copy pixels from kw to display window 
    if ((shapes[i].fadeState != fadeIn) && shapes[i].t < 2) {        // When opacity is near zero, replace it with a new one
      shapes[i].addShape(i);
    }
  }
}

class Shape {
  int kind;                      // for switch
  color c, f;                    // current color, future color
  float lerpc, lerpcstep;        // value from 0.0 to 1.0 for color interpolation from c to f
  int t, tf;                     // opacity (255 = completely opaque)
  int fadeState;
  float fadeAmount;              // between 0 and 1 for lerp
  float xincr, yincr;            // translation movement
  float xoffset, yoffset;        // current offset for 3D functions
  float osize;
  int lobes;
  float steps = 720;
  float rstep = TWO_PI/steps;
  float rot;                     // current precession amount in radians
  float roti;                    // precession increment
  float rotx, rotix;
  float roty, rotiy;
  float owid;                    // variable width
  float mod1,mod2, m1, m2, od, od2,odl, od4; 


  Shape() {
    if (shapeKind == -1) {
      kind = int(random(9)); 
    } 
    else {                 // set to the number of cases + 1
      kind = shapeKind;
    }
    lobes = int(random(maxLobes));
    t = int(random(.15*255,.4*255));       // alpha value specifying desired opacity
    tf = t;
    fadeState = noFade; 
    colorMode(HSB,255);                    // select color for shape
    c = color( int(random(255)), int(random(148,255)), int(random(148,255)));  // initial color
    f = color( int(random(255)), int(random(148,255)), int(random(148,255)));  // future color (mutation)
    lerpc = 0.0;                           // used in color interpolation
    lerpcstep = random(lc1, lc2);          // tiny steps for color mutation              
    xincr = random(-d/400,d/400);          // establish translation speed
    yincr = random(-d/400,d/400);
    xoffset = int(random(-d/8, d/8))+d/4;
    yoffset = int(random(-d/8, d/8))+d/4;
    rot = random(PI, TWO_PI);
    roti = random(-TWO_PI,TWO_PI)/200;
    rotx = random(PI, TWO_PI);
    rotix = random(-TWO_PI,TWO_PI)/200;
    roty = random(PI, TWO_PI);
    rotiy = random(-TWO_PI,TWO_PI)/200;
    osize = random(.05,1);                // size scaler 
    owid = int(osize*1.1 + 1);              // width of rectangles used for drawing
    mod1 = random(.1, 2);
    mod2 = random(.1, 2); 
    m1 = d*osize * mod1;
    m2 = d*osize * mod2;
    od2 = d/2 * osize;
    od = d*osize;
    odl = d*osize/lobes;
    od4 = od2/2;   
  } 

  void addShape(int whichOne) {
    int w = whichOne;
    shapes[w] = new Shape();
    shapes[w].c = color( int(random(255)), int(random(148,255)), int(random(148,255))); 
    shapes[w].f = color( int(random(255)), int(random(148,255)), int(random(148,255)));  // and future color: bright
    shapes[w].lerpc = 0.0;                         // reset color interpolation
    shapes[w].lerpcstep = random(lc1, lc2);  // colorchange step size 
    shapes[w].fadeState = fadeIn;
    shapes[w].fadeAmount = fadeSpeed;
    shapes[w].t = 1;                            // from zero opacity
    shapes[w].tf = int(random(.15*255,.5*255)); // to alpha value specifying desired opacity
  }  

  void display() {
    int j;
    kw.fill(c,t);
    kw.pushMatrix();
    kw.translate(xoffset += xincr, yoffset += yincr);
    kw.rotateX(rotx += rotix);
    // kw.rotateY(roty += rotiy);
    kw.rotateZ(rot += roti); // initial angle + precession
    switch(kind) {  // randomized .. unless key pressed 0 thru 8
    case 0:      
      for (j=0; j<steps; j++) {
        kw.rotateZ(rstep);    
        kw.rect(0,0, odl*sin(j*lobes*rstep), owid); // lobe left
      }   
      break;
    case 1:    
      for (j=0; j<steps; j++) {
        kw.rotateZ(rstep);    
        float jrs = j * rstep;
        kw.rect(0,0, od*cos(jrs)*sin(jrs), owid); // 4 lobes
      }        
      break;
    case 2:             
      for (j=0; j<steps; j++) {
        kw.rotateZ(rstep);     
        kw.rect(0,0, od4*tan(j*rstep), owid); // 2 lobes 
      }        
      break;
    case 3:
      for (j=0; j<steps; j++) {
        kw.rotateZ(rstep);  
        float jrs = j * rstep;
        kw.rect(m1*tan(jrs), 0, m2*sin(jrs), owid);
      }        
      break;
    case 4:
      for (j=0; j<steps; j++) {
        kw.rotateZ(rstep);  
        float jrs = j * rstep;
        kw.rect(m2*sin(jrs), 0, m1*sin(jrs), owid);
      }        
      break;
    case 5:
      for (j=0; j<steps; j++) {
        kw.rotateZ(rstep);  
        float jrs = j * rstep;
        kw.rect(0, odl*sin(jrs*lobes), od2*sin(jrs), owid);
      }        
      break;
    case 6:
      for (j=0; j<steps; j++) {
        float jrs = j * rstep;
        kw.rotateZ(rstep);
        kw.rect(0, odl*cos(jrs*lobes), od2*tan(jrs), owid);
      }
      break;
    case 7:
      for (j=0; j<steps; j++) {
        float jrs = j * rstep;
        kw.rotateZ(rstep);
        kw.rect(0, odl*sin(jrs*lobes), od2*tan(jrs), owid);
      }
      break;
    case 8:
      for (j=0; j<steps; j++) {
        float jrs = j * rstep;
        kw.rotateZ(rstep);
        kw.rect(od2*tan(jrs), odl*sin(jrs*lobes), od2*tan(jrs), owid);
      }
      break;
    }
    kw.popMatrix();
    // if shape strays too far, mark for replacement by running opacity to zero
    if (max( abs(xoffset),abs(yoffset)) > d*outOfBounds)
    { 
      if(fadeState != fadeOut) {
        fadeState = fadeOut;
        fadeAmount = fadeSpeed;
      }
    } 
  }

  void mutateColor() {                      // Change color from c to f stepwise.  reset if c = f.
    if (fadeAmount >= 1) {
      fadeState = noFade;                  // done with the fade operation
    } 
    else {
      if (fadeState == fadeIn) { 
        t = int(lerp (t, tf, fadeAmount += fadeSpeed));  // opacity goes from t to tf
      } 
      else if(fadeState == fadeOut) { 
        t = int(lerp (t, 0, fadeAmount += fadeSpeed));   // opacity goes to 0
      }
    }
    lerpc = lerpc + lerpcstep; 
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
    }
  }
}

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
    shapes[i] = new Shape();
  }
  shapeKind = -1;
}

void keyPressed() {
  switch (key) {
  case '0':   
    shapeKind = 0;
    break;
  case '1':
    shapeKind = 1;
    break;
  case '2':
    shapeKind = 2;
    break;
  case '3':
    shapeKind = 3;
    break;
  case '4':
    shapeKind = 4;
    break;
  case '5':
    shapeKind = 5;
    break;
  case '6':
    shapeKind = 6;
    break;
  case '7':
    shapeKind = 7;
    break;
  case '8':
    shapeKind = 8;
    break;    
  }
  numShapes = int(random(minShapes,maxShapes));
  println("Numshapes = "+numShapes);
  for (int i=0; i<maxShapes; i++) {      // construct a set of new shapes
    shapes[i] = new Shape();
  }
}




