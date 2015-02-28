
boolean first = true;
int col = 0;
int step = 5;
int NumCurves = 3;
int NumPoints = (3*NumCurves)+1;  // 3 points per curve, plus 1 at the start
PVector[] curvePoints = new PVector[NumPoints];
int Border = 100;  // how far to keep endpoints from the edges. The curve can still swirl off-screen.

void setup() {
  size(600, 400);
  background(#202020);
  colorMode(HSB, 360, 100, 100);
  //stroke(0,100);
  noFill();
  frameRate(10);
  //drawStuff();
}

void draw() {
  drawStuff();
}

void drawStuff() {
  drawCurve();
  first = false;
  col += 10;
}


void keyPressed() {
  if (key=='s') {
    saveFrame("image-#####.tif");
  } 
  else {
    background(#202020);
    col = 0;
    initCurve();
  }
}

PVector getBezXY(int i) {
  return(new PVector(random(Border, width-Border), random(Border, height-Border)));
}

void drawCurve() {
  stroke(col%360, 90, 90, 100);
  if (first) {
    initCurve();
  } 
  else {
    alterCurve();
  }
  beginShape();
  vertex(curvePoints[0].x, curvePoints[0].y);
  for (int i=0; i<NumCurves; i++) {
    int p = 1+(i*3);  // index of starting point
    bezierVertex(curvePoints[p].x, curvePoints[p].y, curvePoints[p+1].x, curvePoints[p+1].y, curvePoints[p+2].x, curvePoints[p+2].y);
  }
  endShape();

}

void initCurve() {
  for (int i=0; i<NumCurves; i++) {
    if (i==0) { // first curve, so no continuity from before. Fill 4 points
      for (int j=0; j<4; j++) {
        curvePoints[j] = getBezXY(i);
      }
    } 
    else { // continuation of curve
      int p = 1+(i*3);  // index of starting point
      // first point is a control point. We need to follow the continuity rules for
      // smoothness. Find the difference between the preceding two points, and add
      // that to the last point of the previous curve
      PVector diffcurvePoints = curvePoints[p-1].get();  // get the previous point
      diffcurvePoints.sub(curvePoints[p-2]);             // and find the vector to it from the point before
      curvePoints[p] = curvePoints[p-1].get();           // put the previous point into curvePoints[p]
      curvePoints[p].add(diffcurvePoints);               // and add in the difference we just found
      // the next points can be anywhere
      curvePoints[p+1] = getBezXY(i);
      curvePoints[p+2] = getBezXY(i);
    }
    if (i==NumCurves-1) {
      
      PVector diffcurvePoints = curvePoints[NumPoints-4].get();            // get the previous point
      diffcurvePoints.sub(curvePoints[NumPoints-5]);                       // and find the vector to it from the point before
      curvePoints[NumPoints-3] = curvePoints[NumPoints-4].get();           // put the previous point into curvePoints[p]
      curvePoints[NumPoints-3].add(diffcurvePoints);

      diffcurvePoints = curvePoints[0].get();                    // get the previous point
      diffcurvePoints.sub(curvePoints[1]);                       // and find the vector to it from the point before
      curvePoints[NumPoints-2] = curvePoints[0].get();           // put the previous point into curvePoints[p]
      curvePoints[NumPoints-2].add(diffcurvePoints);
      
      curvePoints[NumPoints-1] = curvePoints[0].get(); 
    }
  }
}

void alterCurve() {
  for (int i=0; i<curvePoints.length; i++) {
    curvePoints[i].x += random(-step, step);
    curvePoints[i].y += random(-step, step);
  }
  ///*
  for (int i=0; i<curvePoints.length; i++) {
    if (i> 3 && (i-1)%3==0 ) {
      PVector diffcurvePoints = curvePoints[i-1].get();  // get the previous point
      diffcurvePoints.sub(curvePoints[i-2]);             // and find the vector to it from the point before
      curvePoints[i] = curvePoints[i-1].get();           // put the previous point into curvePoints[p]
      curvePoints[i].add(diffcurvePoints);
    }
  }
  curvePoints[NumPoints-1] = curvePoints[0].get(); 
  //*/
}
