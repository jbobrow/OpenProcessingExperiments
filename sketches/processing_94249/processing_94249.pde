
/*

 blend curves
 
 author: Alessio Erioli - Co-de-iT
         www.co-de-it.com
 
 date: 23.03.2013
 
 __________________________________________________
 
 draw periodic closed curves with curveVertex()
 and tween them in the 2D plane
 
 __________________________________________________
 
 keys:
 
 SPACE ........ display data
 +/-   ........ increase/decrease number of tweening curves
 
 
 */

int nCurves = 20;
int nPoints = 25;
float rad = 140;
float radIn = 50;
float var = 50;
float damp = 1.0;

boolean pDisp = false;

PVector[] pt = new PVector[nPoints]; // source points (external) for tweening
PVector[] p2 = new PVector[nPoints]; // target points (internal) for tweening

void setup() {

  size(600, 600);
  smooth();
  noFill();

  // initialize point sets
  for (int i=0; i<nPoints; i++) {
    float a = TWO_PI/nPoints*i;
    pt[i] = new PVector((rad+random(var))*cos(a), (rad+random(var))*sin(a));
    p2[i] = new PVector(radIn*cos(a), radIn*sin(a));
  }
  noiseDetail(2, 1.5);
  textSize(10);
}

void draw() {

  background(220);
  pushMatrix();
  translate(width/2, height/2);

  //float t = map(mouseX, 0, width, -5, 5); // activate thins if you want to see what
  //curveTightness(t); // curve tightness does

  for (int j=0; j<nCurves; j++) {
    float ind = (j/float(nCurves));
    color c = lerpColor(color(0), color(220), ind);
    stroke(c, 255-red(c));
    strokeWeight(0.3);

    beginShape();

    // the trick is to include in the curve points the points 0,1 and 2 again
    // draw the curves
    for (int k=0; k<nPoints+3; k++) {
      // this is how to get a clock-like periodic index
      int i = k%nPoints; 
      // noise just to give some variation
      float n =noise(frameCount/50.00, i/5.00)-0.5; 
      PVector newp = new PVector(pt[i].x, pt[i].y);
      newp.mult(1+n*damp);
      // tweening between points at factor ind
      PVector mp = tweenPt(newp, p2[i], ind);
      curveVertex(mp.x, mp.y);
    }
    endShape(CLOSE);
  }

  // draw the outer points
  
  if (pDisp){
  for (int i=0; i<nPoints; i++) {
    float n =noise(frameCount/50.00, i/5.00)-0.5;
    PVector newp = new PVector(pt[i].x, pt[i].y);
    newp.mult(1.1+n*damp);
    stroke(255);
    strokeWeight(0.5);
    line(pt[i].x, pt[i].y, newp.x, newp.y);
    stroke(0);
    strokeWeight(2);
    point(newp.x, newp.y);
    text (n, newp.x, newp.y);
    stroke(255, 0, 200);
    point(pt[i].x, pt[i].y);
  }
  }
  popMatrix();
}


// point tweening function

public PVector tweenPt(PVector a, PVector b, float factor) {
  PVector mp = PVector.sub(b, a);
  mp.mult(factor);
  mp = PVector.add(mp, a);
  return mp;
}

public void keyPressed() {
  switch(key) {
  case '+':
    nCurves += 5;
    if (nCurves > 40) nCurves = 40;
    break;

  case '-':
    nCurves -= 5;
    if (nCurves <5) nCurves = 5;
    break;
    
  case ' ':
    pDisp = !pDisp;
    break;
  }

  //if (key == 'i') saveFrame("images/blendCurves_####.png"); // uncheck this to save screenshots
}


