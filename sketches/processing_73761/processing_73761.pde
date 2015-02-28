
// create little blobs
// 's' to make smaller
//'g' to make bigger
//'b' to place a blob at the current mouse position
// any other key to toggle bezier point display


int numPnts = 15;
float ellipseR = 5;
float thetaRange = radians(3);
float len = 20;
float lenRange = 4;
float dim = 1;
float maxDim = 20;
float minDim = .25;

boolean drawEllipses = false;


void setup() {
  //noLoop();
  background(255);
  size(900, 900);
  smooth();
}

void draw() {
  fill(0);
  
  //background(0);
}

void keyPressed() {
  if (key == 'b') {
    makeBloop(numPnts, mouseX, mouseY, len, dim, drawEllipses);
  } 
  else if (key == 's') {
    dim *=.5;
  } else if (key == 'g'){
    dim *=1.5;
  }  else {
    drawEllipses = !drawEllipses;
  }
  dim = constrain(dim,minDim,maxDim);
}


void makeBloop(int numPnts, float x, float y, 
float len, float dim, boolean drawEllipses) {
  PVector trans = new PVector(x, y);
  PVector[] pnts = new PVector[numPnts];
  //Generate the points that will be used to draw the bloop
  genPnts(pnts, x, y, len, dim);

  noFill();
  stroke(255);


  beginShape();
  PVector vert1 = (PVector)pnts[0];

  stroke(255, 0, 200);
  if (drawEllipses) {
    ellipse(vert1.x, vert1.y, ellipseR, ellipseR);
  }

  vertex(vert1.x, vert1.y); //Initial Anchor point

  //draw beziers
  for (int i =1; i< numPnts-2; i+=3) {
    PVector pnt1 = (PVector)pnts[i];
    PVector pnt2 = (PVector)pnts[i+1];
    PVector pnt3 = (PVector)pnts[i+2];
    bezierVertex(pnt1.x, pnt1.y, pnt2.x, pnt2.y, pnt3.x, pnt3.y);

    //draw anchor points pink
    stroke(255, 0, 255);
    if (drawEllipses) {
      ellipse(pnt3.x, pnt3.y, ellipseR, ellipseR);
    }
    //draw cntrl points grey
    stroke(255, 255, 255, 100);
    if (drawEllipses) {
      ellipse(pnt1.x, pnt1.y, ellipseR, ellipseR);
      ellipse(pnt2.x, pnt2.y, ellipseR, ellipseR);
    }
  }

  //Final bezier
  PVector pnt1 = (PVector)pnts[numPnts-2];
  PVector pnt2 = (PVector)pnts[numPnts-1];
  PVector pnt3 = (PVector)pnts[0];
  bezierVertex(pnt1.x, pnt1.y, pnt2.x, pnt2.y, pnt3.x, pnt3.y);

  //draw cntrl pnts
  stroke(255, 255, 255, 100);
  if (drawEllipses) {
    ellipse(pnt1.x, pnt1.y, ellipseR, ellipseR);
    ellipse(pnt2.x, pnt2.y, ellipseR, ellipseR);
  }

  fill(255, 255, 255, 190);
  strokeWeight(2);
  stroke(0);
  endShape();
}

void genPnts(PVector pnts[], float x, float y, float len, float dim) {
  PVector trans = new PVector(x, y);
  float xLoc;
  float yLoc;

  float theta = 0;
  for (int i =0; i< numPnts; i++) {
    len += random(-lenRange, lenRange);
    theta += TWO_PI/numPnts + random(-thetaRange, thetaRange);
    xLoc = len*cos(theta);
    yLoc = len*sin(theta);

    if ((i-1)%3 == 0 && (i>2) ) {  
      //this is a pnt that needs to be colinear with its two predicesors
      //in order to make smooth curve transition

      PVector anchPnt = (PVector)pnts[i-1];
      PVector cntrlPnt = (PVector)pnts[i-2];
      PVector newCntrlPnt = lineIntersection(cntrlPnt.x, cntrlPnt.y, 
      anchPnt.x, anchPnt.y, 0, 0, xLoc, yLoc);

      pnts[i] = newCntrlPnt;
    }
    else if (i == numPnts-1) {
      PVector anchPnt = (PVector)pnts[0];
      fill(0, 0, 255);

      PVector cntrlPnt = (PVector)pnts[1];
      PVector lastCntrlPnt = lineIntersection(anchPnt.x, anchPnt.y, 
      cntrlPnt.x, cntrlPnt.y, 0, 0, xLoc, yLoc);

      pnts[i] = lastCntrlPnt;
    }
    else {
      PVector pnt = new PVector(xLoc, yLoc);
      pnts[i] = pnt;
    }
  }

  //scale then translate that shit
  for (int i =0; i < pnts.length;i++) {
    PVector pnt = (PVector)pnts[i];
    pnt.mult(dim);
    pnt.add(trans);
    pnts[i] = pnt;
  }
}




PVector lineIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4)
{
  float bx = x2 - x1;
  float by = y2 - y1;
  float dx = x4 - x3;
  float dy = y4 - y3; 
  float b_dot_d_perp = bx*dy - by*dx;
  if (b_dot_d_perp == 0) {
    return null;
  }
  float cx = x3-x1; 
  float cy = y3-y1;
  float t = (cx*dy - cy*dx) / b_dot_d_perp; 

  return new PVector(x1+t*bx, y1+t*by);
}
