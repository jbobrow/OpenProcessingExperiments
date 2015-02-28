
// A quick implementation of Frieder Nake's "13/9/65 No. 2" 
// (also known as "Hommage a Paul Klee", 1965. 
// Golan Levin, January 2012. For more information, see: 
// http://www.vam.ac.uk/content/articles/a/computer-art-history/


int nHorizontals = 9;
Horizontal HArray[];
ArrayList verticalArray;
int nCircles = 7;
Circle[] circles;

void setup() {
  size (600, 600); 
  createHorizontals();
  createVerticals();
  createCircles();
}


void createHorizontals() {
  HArray = new Horizontal[nHorizontals];
  for (int i=0; i<nHorizontals; i++) {
    float ySpacing = 1.0/(float)(nHorizontals+1); 
    float y01 = (float)(i+1) / (float)(nHorizontals+1);
    y01 += random (0-ySpacing*0.20, 0+ySpacing*0.20); 
    y01 = constrain (y01, 0, 1); 
    int nH = 8;
    HArray[i] = new Horizontal (y01, ySpacing, nH);
  }
}

void createVerticals() {
  verticalArray = new ArrayList();
  verticalArray.clear();
  for (int i=0; i<2000; i++) {

    int idA = (int) random (nHorizontals +1);
    int N = (random(0, 1) < 0.15) ? 2:1;
    int idB = max(-1, idA - N); 
    float x01 = random(0, 1); 

    float noiseVal = noise (x01*5.0 + idA*15.0, idA/100.0);
    if (noiseVal < 0.22) {
      for (int j=0; j<4; j++) {
        float deltaA = 0.4 * random(-noiseVal - 0.02, 0.02 + noiseVal);
        float deltaB = 0.4 * random(-noiseVal - 0.02, 0.02 + noiseVal);
        float x01A = constrain (x01 + deltaA, 0, 1); 
        float x01B = constrain (x01 + deltaB, 0, 1); 
        Vertical v = new Vertical (idA, idB, x01A, x01B); 
        verticalArray.add(v);
      }
    } 
    else if (noiseVal < 0.35) {
      for (int j=0; j<1; j++) {
        Vertical v = new Vertical (idA, idB, x01); 
        verticalArray.add(v);
        x01 += random (-0.05, 0.05);
      }
    }
  }
}

void createCircles() {
  nCircles = 7; 
  circles = new Circle [nCircles];
  for (int i=0; i<nCircles; i++) {
    boolean bIntersects = true;
    
    while (bIntersects == true) { 
      float rr = random (0, 1);
      rr = pow(rr, 2.0); 
      rr = map(rr, 0, 1, 0.02, 0.18); 
      float rx = random (rr, 1.0-rr);
      float ry = random (rr, 1.0-rr);
      circles[i] = new Circle (rx, ry, rr);
      if (i == 0){
        bIntersects = false;
      } else {
        boolean bFoundBad = false;
        for (int j=0; j<i; j++){
          float jx = circles[j].x;
          float jy = circles[j].y;
          float jr = circles[j].r;
          float dx = jx-rx;
          float dy = jy-ry;
          float dh = sqrt (dx*dx + dy*dy);
          if (dh < (jr + rr)){
            bFoundBad = true;
          }
        }
        if (bFoundBad == false){
          bIntersects = false;
        }
      }
    }
  }
}


void draw() {
  background (255); 
  strokeWeight (1.0) ;
  stroke (0); 
  smooth();


  drawHorizontals();
  drawVerticals();
  drawCircles();
}


void mousePressed(){
  keyPressed();
}

void keyPressed() {
  for (int h=0; h<nHorizontals; h++) {
    HArray[h].reset();
  }
  noiseSeed(millis());
  createVerticals();
  createCircles();
}


void drawCircles() {
  for (int i=0; i<nCircles; i++) {
    circles[i].draw();
  }
}

void drawHorizontals() {
  for (int h=0; h<nHorizontals; h++) {
    HArray[h].draw();
  }
}

void drawVerticals() {
  for (int i=0; i<verticalArray.size(); i++) {
    Vertical v = (Vertical) verticalArray.get(i);
    v.draw();
  }
}

class Vertical {
  int HorizontalIdA;
  int HorizontalIdB; 
  float x01A; 
  float x01B;
  float yA;
  float yB;


  Vertical (int idA, int idB, float x) {
    HorizontalIdA = idA;
    HorizontalIdB = idB;
    x01A = x;
    x01B = x;
  }

  Vertical (int idA, int idB, float xA, float xB) {
    HorizontalIdA = idA;
    HorizontalIdB = idB;
    x01A = xA;
    x01B = xB;
  }

  void draw() {


    float yA = 0; 
    float yB = 0; 
    if (HorizontalIdA < 0) {
      yA = 0;
    } 
    else if (HorizontalIdA >= nHorizontals) {
      yA = height;
    } 
    else {
      Horizontal HA = HArray[HorizontalIdA];
      yA = height * HA.getYGivenX (x01A);
    }

    if (HorizontalIdB < 0) {
      yB = 0;
    } 
    else if (HorizontalIdB >= nHorizontals) {
      yB = height;
    } 
    else {
      Horizontal HB = HArray[HorizontalIdB];
      yB = height * HB.getYGivenX (x01B);
    }

    line (x01A*width, yA, x01B*width, yB);
  }
}


//=============================================================
class Horizontal {
  int nHPoints;
  float baseY; 
  float ySpacing; 
  HPoint pointArray[];

  void reset() {
    float x01 = 0; 
    float xSpacing = 1.0/nHPoints;
    float y01 = baseY;

    for (int i=0; i<nHPoints; i++) {
      x01 += (float)i/(float)(nHPoints+1) + random (0-xSpacing*0.25, xSpacing*0.25); 
      x01 = min(x01, 1.0); 
      if (i== 0) {
        x01 = 0;
      }
      else if (i==  (nHPoints-1)) {
        x01 = 1.0;
      }
      y01 += random(0-ySpacing*0.25, ySpacing*0.25); 
      y01 = constrain (y01, 0, 1);

      pointArray[i] = new HPoint(x01, y01);
    }
  }


  float getYGivenX(float x01) {
    float out = 0; 
    if (x01 <= 0) {
      out = pointArray[0].y;
    } 
    else if (x01 >= 1) {
      out = pointArray[nHPoints-1].y;
    } 
    else {

      int testID = 0; 
      float testX1 = pointArray[testID].x;
      while ( (testX1 < x01) && (testID < nHPoints)) {
        testID++;
        testX1 = pointArray[testID].x;
      }

      int leftID = max(0, testID-1);
      float x0 = pointArray[leftID].x;
      float y0 = pointArray[leftID].y;
      float x1 = pointArray[testID].x;
      float y1 = pointArray[testID].y;

      out = map(x01, x0, x1, y0, y1);
    }

    return out;
  }

  Horizontal (float y01, float yS, int nH) {
    baseY = y01;
    ySpacing = yS;
    nHPoints = nH;
    pointArray = new HPoint[nHPoints];

    for (int i=0; i<nHPoints; i++) {
      pointArray[i] = new HPoint(0, 0);
    }
    reset();
  }

  //---------------------------------
  void draw() {
    noFill();
    beginShape();
    for (int i=0; i<nHPoints; i++) {
      float x = width  * pointArray[i].x;
      float y = height * pointArray[i].y;
      vertex(x, y);
    }
    endShape();
  }
}

class HPoint {
  float x;
  float y;

  HPoint (float inx, float iny) {
    x = inx;
    y = iny;
  }
}

class Circle {
  float x;
  float y;
  float r;
  Circle (float rx, float ry, float rr) {
    x = rx;
    y = ry; 
    r = rr;
  }
  void draw() {
    noFill();
    ellipse (x*width, y*height, r*width, r*width) ;
  }
}


