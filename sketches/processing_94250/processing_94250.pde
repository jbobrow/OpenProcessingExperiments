
/*

 tween curves 3D
 
 author: Alessio Erioli - Co-de-iT
 www.co-de-it.com
 
 date: 23.03.2013
 
 __________________________________________________
 
 draw periodic closed curves with curveVertex()
 and tween them in 3D
 
 __________________________________________________
 
 keys:
 
 SPACE .............. display data
 +/-   .............. increase/decrease number of tweening curves
 mouse LEFT/RIGHT ... rotates camera
 mouse UP/DOWN ...... zooms out/in
 
 */

int nCurves = 20;
int nPoints = 33;
float rad = 150;
float radIn = 50;
float var = 50;

boolean pDisp = false;

PVector[] pt = new PVector[nPoints]; // source points (external) for tweening
PVector[] p2 = new PVector[nPoints]; // target points (internal) for tweening

void setup() {

  size(600, 600, P3D);
  smooth();
  noFill();

  // initialize point sets
  for (int i=0; i<nPoints; i++) {
    float a = TWO_PI/nPoints;
    pt[i] = new PVector((rad+random(var))*cos(a*i), (rad+random(var))*sin(a*i), var*random(-1, 1));
    p2[i] = new PVector(radIn*cos(a*i), radIn*sin(a*i), 0);
  }
  noiseDetail(2, 1.5);
  textSize(10);
}

void draw() {

  background(220);

  // camera control
  float an = map (mouseX, 0, width, 0, TWO_PI);
  float d = map (mouseY, 0, height, 800, 50);
  beginCamera();
  camera(d*cos(an), d*sin(an), 400, 0, 0, -20, 0, 0, -1);
  endCamera();

  // draw curves
  for (int j=0; j<nCurves; j++) {
    float ind = (j/float(nCurves));
    color c = lerpColor(color(0), color(220), ind);
    stroke(c, 220-red(c));
    strokeWeight(0.5);

    beginShape();

    // the trick is to include in the curve points the points 0,1 and 2 again
    // draw the curves
    for (int k=0; k<nPoints+3; k++) {
      // this is how to get a clock-like periodic index
      int i = k%nPoints; 
      // noise just to give some variation
      float n =noise(frameCount/50.00, i/5.00)-0.5; 
      // the PVector is useful for noise variation and tweening
      PVector newp = new PVector(pt[i].x, pt[i].y, pt[i].z);
      newp.mult(1+n);
      // tweening between points at factor ind
      PVector mp = tweenPt(newp, p2[i], ind);
      curveVertex(mp.x, mp.y, mp.z);
    }
    endShape(CLOSE);
  }

  // draw the outer points
  if (pDisp) {
    for (int i=0; i<nPoints; i++) {
      float n =noise(frameCount/50.00, i/5.00)-0.5;
      PVector newp = new PVector(pt[i].x, pt[i].y, pt[i].z);
      newp.mult(1.1+n);
      stroke(255);
      strokeWeight(0.5);
      line(pt[i].x, pt[i].y, pt[i].z, newp.x, newp.y, newp.z);
      stroke(0);
      strokeWeight(2);
      point(newp.x, newp.y, newp.z);
      text (n, newp.x, newp.y);
      stroke(255, 0, 200);
      point(pt[i].x, pt[i].y, pt[i].z);
    }
  }
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

