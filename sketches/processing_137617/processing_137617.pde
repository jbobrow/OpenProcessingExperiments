
//
//  Final project for "Introduction to Computational Arts: Processing"
//  at https://class.coursera.org/compartsprocessing-001
//  by Axel Tanner
//
//  Description: The tension between colors traditionally called 'warm' and 'cold' is shown on a color grid. 
//  Warm colors diffuse (mostly horizontally) from left and right edges into a colder central space.
//  The diffusion of the colors is modelled similar to heat diffusion as a physical process.
//  With static warm/cold points the picture would reach a static equilibrium - this is avoided by slow random
//  movement of the warm/cold points.
//  Additionally, for experimentation warm and cold spots can be removed/added with the mouse.
//
//  Interaction possibilities:
//    - mouse: toggle warm/cold points: 
//        - any click on a warm/cold point will remove it
//        - left-click on an empty field creates warm point
//        - right-click on an empty field creates cold point
//    - keyboard 'd': show/hide the warm/cold points for debugging and analysis
//    - keyboard 'r': re-initialize with random values
//    - keyboard 'p': suspend diffusion and animation
//    - keyboard 's': save screenshot
//

float[][] colorArr;
int w = 900;
int h = 600;
int nx = 30;
int sqSize = floor(w/float(nx));
int ny = floor(h/float(sqSize));
int shiftX = round( (w-sqSize*nx) /2. );
int shiftY = round( (h-sqSize*ny) /2. );
int screenshotCount = 0;

boolean debug = false;
boolean pause = false;

// ArrayLists for cold/warm points
ArrayList<Point> coldPoints = new ArrayList<Point>();
int nColdPointsMax = nx/2;
ArrayList<Point> warmPoints = new ArrayList<Point>();
int nWarmPointsMax = ny/2;

// Helper ArrayLists for updating the ArrayLists of cold/warm points
ArrayList<Point> warmPointsToRemove = new ArrayList<Point>();
ArrayList<Point> warmPointsToAdd    = new ArrayList<Point>();
ArrayList<Point> coldPointsToRemove = new ArrayList<Point>();
ArrayList<Point> coldPointsToAdd    = new ArrayList<Point>();

// Color scale parameters
float hueMinDiff   = 0.06;
float hueColdLow   = 0.4;
float hueColdHigh  = 0.71;
float hueWarmLow   = 0.0;
float hueWarmHigh  = hueColdLow;
float huePointDiff = 0.0002;
float hueFluctuation = 0.0005;

// Diffusion parameters
float diffConstH   = 0.05;        // horizontal diffusion is faster
float diffConstV   = 0.005;       // ... than vertical
float coldPointCoupling = 0.03;
float warmPointCoupling = 0.02;

// Moving of cold/warm points parameters
float moveWarmProb = 0.001;
float moveColdProb = 0.001;

//--------------------------------------------------------------------------------------------------
void setup() {
  size(900, 600);
  smooth();
  colorMode(HSB, 1.0);
  background(color(1.,0.,0.));
  frameRate(20);
  colorArr = new float[nx][ny];
  colorArr = randomize();
  initializeColdPoints();
  initializeWarmPoints();
  noStroke();
}

//--------------------------------------------------------------------------------------------------
void draw() {
  colorArr = diffuse(colorArr);
  noStroke();
  for (int i=0; i<nx; i++) {
    for(int j=0; j<ny; j++) {
      fill( hueMap( colorArr[i][j] ) , 1.0, brMap(colorArr[i][j]));
      rect(i*sqSize+shiftX, j*sqSize+shiftY, sqSize, sqSize);
    }
  }
  handlePointChanges();    // only here to avoid problems changing ArrayLists inside loops
  if (debug) drawDebugPoints();
}

//---  Helpers for color maps ----------------------------------------------------------------------
// Color map - strech that there is more warm - less green - flat blue again
float hueMap(float inVal) {
  float out;
  float crossX = hueWarmHigh;
  float crossY = hueWarmHigh-0.15;
  float crossX2 = crossX + 0.1;
  float crossY2 = crossY + 0.3;
  if (inVal < crossX) {
    out = map(inVal, 0., crossX, 0., crossY);
  } else if (inVal < crossX2) {
    out = map(inVal, crossX, crossX2, crossY, crossY2);
  } else {
    out = map(inVal, crossX2, 1., crossY2, 1.);
  }
  return out;
}

// brightness map - make colder colors darker
float brMap(float inVal) {
  float out;
  float crossX = hueWarmHigh;
  float crossY = hueWarmHigh-0.15;
  float crossX2 = crossX + 0.1;
  float crossY2 = crossY + 0.25;
  if (inVal < crossX) {
    out = map(inVal, 0., crossX, 0., crossY);
  } else if (inVal < crossX2) {
    out = map(inVal, crossX, crossX2, crossY, crossY2);
  } else {
    out = map(inVal, crossX2, 1., crossY2, 1.);
  }
  return 1.-out;
}

//--- debug helper --------------------------------------------------------------------------------------
// if debug - mark the warm and cold points ...
void drawDebugPoints() {
  fill(hueMap(hueColdHigh), 1, brMap(hueColdHigh));
  stroke(1);
  for (int i=0; i<coldPoints.size(); i++) {
    ellipse((coldPoints.get(i).x +0.5) * sqSize +shiftX, (coldPoints.get(i).y+0.5)*sqSize +shiftY, sqSize/4, sqSize/4);
  } 
  fill(hueMap(hueWarmLow), 1, brMap(hueWarmLow));
  stroke(1);
  for (int i=0; i<warmPoints.size(); i++) {
    ellipse((warmPoints.get(i).x +0.5) * sqSize +shiftX, (warmPoints.get(i).y+0.5)*sqSize +shiftY, sqSize/4, sqSize/4);
  }
}

//--------------------------------------------------------------------------------------------------
// do initial randomness
float[][] randomize() {
  float[][] tmpArr = new float[nx][ny];
  for (int j=0; j<ny; j++) {
    tmpArr[0][j] = random(hueColdLow,hueColdHigh);
    for(int i=1; i<nx; i++) {
      float newHue = tmpArr[i-1][j] + random(-hueMinDiff, hueMinDiff);
      newHue = min(newHue, hueColdHigh);
      newHue = max(newHue, hueColdLow);
      tmpArr[i][j] = newHue;
    }
  }
  return tmpArr;
}

//--------------------------------------------------------------------------------------------------
// main work: diffuse the heat and cold
float[][] diffuse(float[][] colorArr) {
  float[][] tmpArr = new float[nx][ny];
  float diff;
  tmpArr = colorArr;

  // Keep cold and warm points
  tmpArr = setColdPoints(tmpArr);
  tmpArr = setWarmPoints(tmpArr);

  // diffuse
  for (int j=0; j<ny-1; j++) {
    for(int i=0; i<nx-1; i++) {
      //tmpArr[i][j] = colorArr[i][j];
      // N
      diff = (colorArr[i][j] - colorArr[i][j+1]) * diffConstV;
      tmpArr[i][j] -= diff;
      tmpArr[i][j+1] += diff;
      // E
      diff = (colorArr[i][j] - colorArr[i+1][j]) * diffConstH;
      tmpArr[i][j] -= diff;
      tmpArr[i+1][j] += diff;
    }
  }
  // special case lower right corner not yet covered
  //i = nx-1, j = ny-2
  int i = nx-1;
  int j = ny-2;
  // N
  diff = (colorArr[i][j] - colorArr[i][j+1]) * diffConstV;
  tmpArr[i][j] -= diff;
  tmpArr[i][j+1] += diff;
  //i = nx-2, j = ny-1
  i = nx-2;
  j = ny-1;
  // E
  diff = (colorArr[i][j] - colorArr[i+1][j]) * diffConstH;
  tmpArr[i][j] -= diff;
  tmpArr[i+1][j] += diff;

  tmpArr = fluctuate(tmpArr);
  tmpArr = normalize(tmpArr);

  return tmpArr;
}

//--------------------------------------------------------------------------------------------------
float[][] normalize(float[][] tmpArr) {
  for (int j=1; j<ny; j++) {
    for(int i=1; i<nx; i++) {
      tmpArr[i][j] = max(hueWarmLow, tmpArr[i][j]);
      tmpArr[i][j] = min(hueColdHigh, tmpArr[i][j]);
    }
  }
  return tmpArr;
}

// add some small randomness to make it more lively
float[][] fluctuate(float[][] tmpArr) {
  for (int j=1; j<ny; j++) {
    for(int i=1; i<nx; i++) {
      tmpArr[i][j] += random(-hueFluctuation, hueFluctuation);
    }
  }
  return tmpArr;
}

//--------------------------------------------------------------------------------------------------
float[][] setColdPoints(float[][] tmpArr) {
  for (int i=0; i<coldPoints.size(); i++) {
    // Diffusion of coldness
    float diff;
    if (tmpArr[coldPoints.get(i).x][coldPoints.get(i).y] >= coldPoints.get(i).hue) {
      diff = sqrt((tmpArr[coldPoints.get(i).x][coldPoints.get(i).y] -coldPoints.get(i).hue))*coldPointCoupling;
    } else {
      diff = -sqrt(-(tmpArr[coldPoints.get(i).x][coldPoints.get(i).y] -coldPoints.get(i).hue))*coldPointCoupling;
    }
    tmpArr[coldPoints.get(i).x][coldPoints.get(i).y] -= diff;
    
    // move point with low probability - all directions are possible - but not into left/right edges
    // which are reserved for warm points 
    int newX = coldPoints.get(i).x;
    int newY = coldPoints.get(i).y;
    if (random(1.) < moveColdProb) {
      if (round(random(1.)) > 0) {
        if (round(random(1.)) > 0) {          // North
          newY += 1;
          if (newY > ny-1) newY = 0;          // connected y boundaries
        } else {                              // South
          newY -= 1;
          if (newY < 0) newY = ny-1;          // connected y boundaries
        }
      } else {
        if (round(random(1.)) > 0) {          // West - dont use warm space
          newX -= 1;
          if (newX < 1) newX = nx-2;          // not in right/left edge
        } else {                              // East - dont use warm space
          newX += 1;
          if (newX > nx-2) newX = 1;          // not in right/left edge
        }
      }        
      // Move only, if no other point is there
      if (isFree(newX, newY)) {
        coldPoints.get(i).x = newX;
        coldPoints.get(i).y = newY;
      }
      // change hue
      float hue = random(hueColdHigh-huePointDiff, hueColdHigh);
      coldPoints.get(i).hue = hue;
    }
  }
  return tmpArr;
}

float[][] setWarmPoints(float[][] tmpArr) {
  for (int i=0; i<warmPoints.size(); i++) {
    // Diffusion of warmness
    float diff;
    if (tmpArr[warmPoints.get(i).x][warmPoints.get(i).y] >= warmPoints.get(i).hue) {
      diff = sqrt(sqrt((tmpArr[warmPoints.get(i).x][warmPoints.get(i).y] -warmPoints.get(i).hue)))*warmPointCoupling;
    } else {
      diff = -sqrt(sqrt(-(tmpArr[warmPoints.get(i).x][warmPoints.get(i).y] -warmPoints.get(i).hue)))*warmPointCoupling;
    }      
    tmpArr[warmPoints.get(i).x][warmPoints.get(i).y] -= diff;
     
    // move point with low probability - just up and down
    int newX = warmPoints.get(i).x;
    int newY = warmPoints.get(i).y;
    if (random(1.) < moveWarmProb) {
      if (round(random(1.)) > 0) {
        newY += 1;
        if (newY > ny-1) newY = 0;    // connected y boundaries
      } else {
        newY -= 1;
        if (newY < 0) newY = ny-1;    // connected y boundaries
      }
      // change hue
      float hue = random(hueWarmLow, hueWarmLow+huePointDiff);
      warmPoints.get(i).hue = hue;
    }
    // move point with low probability - to other side 
    if (random(1.) < moveWarmProb/2.) {
      if (newX == 0) {
        newX = nx-1;
      } else if (newX == nx-1) {
        newX = 0;
      }
      // Move only, if no other point is there
      if (isFree(newX, newY)) {
        warmPoints.get(i).x = newX;
        warmPoints.get(i).y = newY;
      }
      // change hue
      float hue = random(hueWarmLow, hueWarmLow+huePointDiff);
      warmPoints.get(i).hue = hue;
    }
  }
  return tmpArr;
}

//--------------------------------------------------------------------------------------------------
void initializeColdPoints() {
  coldPoints.clear();
  for (int i=0; i<nColdPointsMax; i++) {
    int x = floor( random(nx-2) ) + 1;
    int y = floor( random(ny) );
    float hue = random(hueColdHigh-huePointDiff, hueColdHigh);
    coldPoints.add( new Point(x, y, hue) );
  }  
}

void initializeWarmPoints() {
  warmPoints.clear();
  for (int i=0; i<nWarmPointsMax; i++) {
    int x = round( random(1.0) ) * (nx-1);
    int y = floor( random(ny) );
    float hue = random(hueWarmLow, hueWarmLow+huePointDiff);
    warmPoints.add( new Point(x, y, hue) );
  }  
}

boolean isFree(int x, int y) {
  for (int i=0; i<warmPoints.size(); i++) {
    Point p = warmPoints.get(i);
    if ((p.x == x) && (p.y == y)) {
      return false;
    }
  }
  for (int i=0; i<coldPoints.size(); i++) {
    Point p = coldPoints.get(i);
    if ((p.x == x) && (p.y == y)) {
      return false;
    }
  }
  return true;
}

boolean toggleOff(int x, int y) {
  for (int i=0; i<warmPoints.size(); i++) {
    Point p = warmPoints.get(i);
    if ((p.x == x) && (p.y == y)) {
      warmPointsToRemove.add(p);
      return true;
    }
  }
  for (int i=0; i<coldPoints.size(); i++) {
    Point p = coldPoints.get(i);
    if ((p.x == x) && (p.y == y)) {
      coldPointsToRemove.add(p);
      return true;
    }
  }
  return false;
}

void handlePointChanges() {
  for (int i=0; i<warmPointsToRemove.size(); i++) {
    warmPoints.remove(warmPointsToRemove.get(i));
  }
  warmPointsToRemove.clear();
  for (int i=0; i<coldPointsToRemove.size(); i++) {
    coldPoints.remove(coldPointsToRemove.get(i));
  }
  coldPointsToRemove.clear();
  for (int i=0; i<warmPointsToAdd.size(); i++) {
    warmPoints.add(warmPointsToAdd.get(i));
  }
  warmPointsToAdd.clear();
  for (int i=0; i<coldPointsToAdd.size(); i++) {
    coldPoints.add(coldPointsToAdd.get(i));
  }
  coldPointsToAdd.clear();
}

//--- interaction -------------------------------------------------------------------------------------
void keyPressed() {
  switch(key) {
    case 'd':    // debug - toggle debug flag to show/hide the warm/cold points
      debug = debug ? false : true;
      break;
    case 'r':    // randomized reset
      colorArr = randomize();
      initializeColdPoints();
      initializeWarmPoints();
      break;
    case 'p':    // pause
      pause = pause ? false : true;
      if (pause) {
        noLoop();
      } else {
        loop();
      }
      break;
//    case 's':    // screenshot
//      screenshotCount++;
//      String file = "screenshot"+screenshotCount+".png";
//      saveFrame(file);
//      println("Screenshot saved as '"+file+"'");
//      break;
  }
}

void mousePressed() {
  // where is the mouse
  int ix = floor(mouseX/float(sqSize));
  int iy = floor(mouseY/float(sqSize));
  if (! toggleOff(ix, iy)) {          // in case there is already a point, toggle it off, if not ...
    if (mouseButton == LEFT) {
      // toggle a warm point with LEFT mouse button
      float hue = random(hueWarmLow, hueWarmLow+huePointDiff);
      warmPointsToAdd.add( new Point(ix, iy, hue) ); 
    } else if (mouseButton == RIGHT) {
      // toggle a cold point with RIGHT mouse button  
      float hue = random(hueColdHigh-huePointDiff, hueColdHigh);
      coldPointsToAdd.add( new Point(ix, iy, hue) );
    }
  }
}

//--------------------------------------------------------------------------------------------------
// Helper class for warm/cold points
class Point {
  int x, y;
  float hue;
  Point(int x, int y, float hue) {
    this.x = x;
    this.y = y;
    this.hue = hue;
  }
}


