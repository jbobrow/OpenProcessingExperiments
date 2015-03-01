
/*
drawing flowers (but not now) - what I like to do : zooming in at max and looking at chaos like picture

feel free to play with phisic constants (cf. physic functions)
 
Interaction (for openprocessing you have to click once on the sketch to interact with keys) :
    mouse button left : new
    mouse button right : center the point pointed by the mouse
    mouse wheel : zoom in zoom out (not working whith openprocessing)

    zoom : key 7 to zoom in, key 1 to zoom out (zoom relatively to the center of the screen)
           or you can use the wheel of the mouse (zoom relatively to the position of the mouse cursor of the screen)
    translation : keys 8 up, 2 down, 6 left, 4 right

key S : save picture
    N : new (you can also click on canva)
    L : switching line displaying beteween the 2 points
    M : switching Middle point displaying beteween the 2 points
    E : switching End points (i.e. the 2 points) displaying
    C : switching the contour i.e. a line connecting the 2 previous points to 2 current points
    Q : plain quad formed by the 2 prevous points to 2 current points
    A : switching display of attraction points (white dots)
    T : switching animation mode (in non animation mode zoom and translation make all redraw)
    D : shifting among distance computation modes (cf. http://en.wikipedia.org/wiki/Minkowski_distance : values : 0:2-norm distance, 1:1-norm distance, 2:infinity norm distance)
    I : shifting among iterations mode (number of iterations bettween each display fixed to 1, 5, 10... Lower it is, smother but slower it is.)
   

 */


int nAttractionPoints = 1; 
float[] x0 = new float[nAttractionPoints], // position of each attraction point  (world coordinates)
        y0 = new float[nAttractionPoints], 
        oldx0 = new float[nAttractionPoints],  // saving position of each attraction point  (world coordinates)
        oldy0 = new float[nAttractionPoints], 
        dx1 = new float[nAttractionPoints], // distance from point 1 to each attraction point (world coordinates) 
        dy1 = new float[nAttractionPoints], 
        d1 = new float[nAttractionPoints], 
        dx2 = new float[nAttractionPoints], // same for point 2
        dy2 = new float[nAttractionPoints], 
        d2 = new float[nAttractionPoints];
float x1, y1, ax1, ay1, vx1, vy1; // current position, acceleration and speed of point 1 (world coordinates)
float x2, y2, ax2, ay2, vx2, vy2; // current position, acceleration and speed of point 2
float oldx1, oldy1, oldax1, olday1, oldvx1, oldvy1; // purpose of old.. variable : saving to restart in same conditions (world coordinates)
float oldx2, oldy2, oldax2, olday2, oldvx2, oldvy2;
float prevx1, prevy1; // previous position 
float prevx2, prevy2;
int distMode = 0; // distance computation mode cf. http://en.wikipedia.org/wiki/Minkowski_distance : values : 0:2-norm distance, 1:1-norm distance, 2:infinity norm distance


// style varriables can be held interactivelly
boolean styleTrait, styleMilieu, styleExtremite, styleQuad, styleContour, styleAnimation; // style or rendering
boolean styleAttraction = false; // show or not attraction point (interactive with key A)
int[] nIter = {1, 5, 10, 50, 100, 500, 1000, 5000}; // number of iterations bettween each display fixed to 1, 5, 10... Lower it is, smother but slower it is.
int nIterMax = nIter.length;                        
int nIterMode =  nIter.length - 3;                  // by default : 500 iterations

int globalIteration;  // working variable to hold global iteration mainly used for color selection

//gestion de la convergence (not used)
int windowSize = 50, nWindow = 0;
float distMax1, distMax2;

//scale and translation management (cf. http://webhome.cs.uvic.ca/~blob/courses/305/notes/pdf/using.pdf)
float xWindow, yWindow, wWindow, hWindow, xViewPort, yViewPort, wViewPort, hViewPort, windowToViewPortScale;

void setup() {
  size(800, 600);
  colorMode(HSB, 100, 100, 100, 100);
  initDepart(width/2, height/2, min( width/2, height/2));
  styleExtremite = (random(10) > 5) && false;
  styleTrait = (random(10) > 5) && false;
  styleQuad = (random(10) > 5) || true;
  styleMilieu = (random(10) > 5) && false;
  styleContour = (random(10) > 5) && false;
  styleAnimation = false;
  initViewPort();
}


//*****************************************************************************************************************
// helper functions
// distance computation mode cf. http://en.wikipedia.org/wiki/Minkowski_distance : values : 0:2-norm distance, 1:1-norm distance, 2:infinity norm distance
float distance(float xi, float yi, float xf, float yf) {
  if (distMode == 0) return sqrt((xf-xi)*(xf-xi)+(yf-yi)*(yf-yi));
  if (distMode == 1) return abs(xf - xi) + abs(yf - yi);
  if (distMode == 2) return max(abs(xf - xi), abs(yf - yi));
  return dist(xi, yi, xf, yf);
}

float magnitude(float x, float y) {
  return distance(0, 0, x, y);
}


//*****************************************************************************************************************
//physic functions
void distances() {
  for (int i = 0; i < nAttractionPoints; i++) {
    dx1[i] = x0[i] - x1;
    dy1[i] = y0[i] - y1;
    d1[i] = distance(x0[i], x1, y0[i], y1);

    dx2[i] = x0[i] - x2;
    dy2[i] = y0[i] - y2;
    d2[i] = distance(x0[i], x2, y0[i], y2);
  }
}

void acceleration() {
  distances();
  ax1 = 0; 
  ay1 = 0; 
  ax2 = 0; 
  ay2 = 0;
  for (int i = 0; i < nAttractionPoints; i++) {
    ax1 += dx1[i] * 5 / pow(d1[i], 1) ;  
    ay1 += dy1[i] * 5 / pow(d1[i], 1) ;
    ax2 += dx2[i] * 5 / pow(d2[i], 1) ;  
    ay2 += dy2[i] * 5 / pow(d2[i], 1) ;
  }
}

void nextStep() {
  acceleration();
  vx1 = vx1 + ax1 - vx1 / 500; 
  vy1 = vy1 + ay1 - vy1 / 500;
  vx2 = vx2 + ax2 - vx2 / 500; 
  vy2 = vy2 + ay2 - vy2 / 500;
  y1 = y1 + vy1; 
  x1 = x1 + vx1;
  y2 = y2 + vy2; 
  x2 = x2 + vx2;
}


//*****************************************************************************************************************
// initialisation functions
void reInitDepart() {
  if (styleAnimation) return;
  background(95, 50, 25);
  for (int i = 0; i < nAttractionPoints; i++) { 
    x0[i] = oldx0[i]; 
    y0[i] = oldy0[i];
  }  
  x1  = oldx1 ; 
  y1  = oldy1 ;
  vx1 = oldvx1; 
  vy1 = oldvy1;
  x2  = oldx2 ; 
  y2  = oldy2 ;
  vx2 = oldvx2; 
  vy2 = oldvy2;
  globalIteration = 0;
}

void initDepart(float ix, float iy, float radius) {
  background(95, 50, 25);
  for (int i = 0; i < nAttractionPoints; i++) {
    x0[i] = random(width / 2) + width / 4;
    y0[i] = random(height / 2) + height / 4;
    oldx0[i] = x0[i];
    oldy0[i] = y0[i];
  }
  x1 = ix + random(-radius, radius); 
  y1 = iy + random(-radius, radius);
  float vi = 20.0;
  vx1 = random(-vi, vi); 
  vy1 = random(-vi, vi);
  x2  = ix + random(-radius, radius); 
  y2  = iy + random(-radius, radius);
  vx2 = random(-vi, vi); 
  vy2 = random(-vi, vi);

  oldx1  = x1 ; 
  oldy1  = y1 ;
  oldvx1 = vx1; 
  oldvy1 = vy1;
  oldx2  = x2 ; 
  oldy2  = y2 ;
  oldvx2 = vx2; 
  oldvy2 = vy2;
  globalIteration = 0;
}


//*****************************************************************************************************************
// displaying function
void initViewPort() {
  xViewPort = 0; 
  yViewPort =0; 
  wViewPort = width; 
  hViewPort = height; 
  xWindow = xViewPort; 
  yWindow = yViewPort; 
  wWindow = wViewPort; 
  hWindow = hViewPort; 
  windowToViewPortScale = (wWindow/wViewPort > hWindow/hViewPort) ? hWindow/hViewPort : wWindow/wViewPort;
}

void changeWindowSize(float x /* in window */, float y, float r) {
  float xc = xInViewPort(x), yc = yInViewPort(y);
  wWindow = wWindow * r; 
  hWindow = hWindow * r;
  windowToViewPortScale = (wWindow/wViewPort > hWindow/hViewPort) ? hWindow/hViewPort : wWindow/wViewPort;
  xWindow = xWindow + x - xInWindow(xc); 
  yWindow = yWindow + y - yInWindow(yc);
}


float xInViewPort(float x) {
  return (x - xWindow) * windowToViewPortScale + xViewPort;
}
float yInViewPort(float y) {
  return (y - yWindow) * windowToViewPortScale + yViewPort;
}
float xInWindow(float x) {
  return (x - xViewPort) / windowToViewPortScale + xWindow;
}
float yInWindow(float y) {
  return (y - yViewPort) / windowToViewPortScale + yWindow;
}

//*****************************************************************************************************************
// interaction functions
void mousePressed() {
  background(95, 50, 25);
  if (mouseButton == LEFT) initDepart(mouseX, mouseY, 50.0);
  if (mouseButton == RIGHT) {
    xWindow = xWindow + xInWindow(mouseX) - xInWindow(xViewPort + wViewPort / 2);
    yWindow = yWindow + yInWindow(mouseY) - yInWindow(yViewPort + hViewPort / 2);
    reInitDepart();
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  float zoomStep = 0.1;
  float zoomFactor = 1.0 + e * zoomStep;
  if (zoomFactor != 1.0) {
    changeWindowSize(xInWindow(event.getX()), yInWindow(event.getY()), zoomFactor);
    reInitDepart();
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame();
  }
  if (key == 'l' || key == 'L') {
    styleTrait = !styleTrait; 
    reInitDepart();
  }
  if (key == 'c' || key == 'C') {
    styleContour = !styleContour; 
    reInitDepart();
  }
  if (key == 'e' || key == 'E') {
    styleExtremite = !styleExtremite; 
    reInitDepart();
  }
  if (key == 'm' || key == 'M') {
    styleMilieu = !styleMilieu; 
    reInitDepart();
  }
  if (key == 'a' || key == 'A') {
    styleAttraction = !styleAttraction; 
    reInitDepart();
  }
  if (key == 'q' || key == 'Q') {
    styleQuad = !styleQuad; 
    reInitDepart();
  }
  if (key == 't' || key == 'T') {
    styleAnimation = !styleAnimation; 
    reInitDepart();
  }
  if (key == 'n' || key == 'N') {
    initDepart(width/2, height/2, min( width/2, height/2));
  }
  if (key == 'd' || key == 'D') {
    distMode++; 
    if (distMode > 3) distMode = 0; 
    reInitDepart();
  }
  if (key == 'i' || key == 'I') {
    nIterMode++; 
    if (nIterMode >= nIterMax) nIterMode = 0; 
    reInitDepart();
  }
  if (key == '0') {
    initViewPort(); 
    reInitDepart();
  }
  float step = 10.0, stepx = 0.0, stepy = 0.0;
  stepx = key == '6' ? -step : key == '4' ? +step : 0.0;
  stepy = key == '2' ? -step : key == '8' ? +step : 0.0;
  if (abs(stepx) + abs(stepy) != 0.0) {
    xWindow += stepx / windowToViewPortScale; 
    yWindow += stepy / windowToViewPortScale;
    reInitDepart();
  }
  float zoomStep = 0.1;
  float zoomFactor = 1.0 + (key == '7' ? zoomStep : key == '1' ? -zoomStep : 0.0);
  if (zoomFactor != 1.0) {
    changeWindowSize(xInWindow(wViewPort/2), yInWindow(hViewPort/2), zoomFactor);
    reInitDepart();
  }
}

void draw() {
  //background(95,50,25);
  if (styleAnimation) background(95, 50, 25);

  for (int i = 0; i < nIter[nIterMode]; i++) {
    globalIteration++;
    float xDisp1 = xInViewPort(x1), yDisp1 = yInViewPort(y1);
    float xDisp2 = xInViewPort(x2), yDisp2 = yInViewPort(y2);
    if (styleExtremite) {
      noStroke();
      fill((float)(globalIteration%1000)/10, 100, 100);
      ellipse(xDisp1, yDisp1, 10, 10);
      fill((float)((globalIteration+100)%1000)/10, 100, 100);
      ellipse(xDisp2, yDisp2, 10, 10);
    }
    if (styleMilieu) {
      noStroke();
      fill((float)((globalIteration+50)%1000)/10, 100, 100);
      ellipse((xDisp1+xDisp2)/2, (yDisp1+yDisp2)/2, 10, 10);
    }
    if (styleTrait) {
      stroke((float)((globalIteration+50)%1000)/10, 100, 100);
      line(xDisp1, yDisp1, xDisp2, yDisp2);
    }
    if (globalIteration >=2 && styleQuad) {
      stroke((float)((globalIteration+50)%1000)/10, 100, 100,10);
      fill((float)((globalIteration+50)%1000)/10, 100, 100,10 + random(50));
      quad(prevx1, prevy1, prevx2, prevy2, xDisp2, yDisp2, xDisp1, yDisp1);
    }
    if (globalIteration >=2 && styleContour) {
      stroke((float)((globalIteration+50)%1000)/10 + random(10), 100, 100);
      fill((float)((globalIteration+50)%1000)/10 + random(10), 100, 100);
      line(prevx1, prevy1, xDisp1, yDisp1);
      line(prevx2, prevy2, xDisp2, yDisp2);
    }
    prevx1 = xDisp1; 
    prevy1 = yDisp1;
    prevx2 = xDisp2; 
    prevy2 = yDisp2;
    nextStep();
  }
  stroke(0);
  fill(#FFFFFF);
  if (styleAttraction) for (int j = 0; j < nAttractionPoints; j++) ellipse(xInViewPort(x0[j]), yInViewPort(y0[j]), 10, 10);

  //ellipse(xCenter, yCenter, 20,20);

  String txt = "(S)ave picture - (N)ew - redraw with" + (styleTrait ? "out" : "") + " (L)ine" +
    ", with" + (styleMilieu ? "out" : "") + " (M)iddle point" +
    ", with" + (styleExtremite ? "out" : "") + " (E)nd points" +
    ", with" + (styleContour ? "out" : "") + " (C)ontour" +
    ", with" + (styleQuad ? "out" : "") + " (Q)uad" +
    ", with" + (styleAttraction ? "out" : "") + " (A)ttraction points" +
    ", with" + (styleAnimation ? "out" : "") + " anima(T)ion" +
    ", with other (D)istance comp mode (current :" + distMode + ")" +
    ", with other (I)terations mode (current :" + nIter[nIterMode] + ")";
  textSize(12);
  fill(#000000);
  rect(0, height-15, width, height);
  String txttxt = txt + "    " + txt;
  stroke(#FFFFFF);
  fill(#FFFFFF);
  text("fps : " + int(frameRate) + " / " + txttxt.substring((frameCount / 10) % txt.length()), 0, height-3);
}

