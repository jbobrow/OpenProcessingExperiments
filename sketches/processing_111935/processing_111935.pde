
/*  glidingArcs01
 *  - a "parent" circle and "children" arcs.
 *
 *  The arcs are given new lengths and starting points
 *  when space is pressed.
 *
 *  - by Toke Frello, 2013
 */


int nNumberOfArcs;
float fArcSpeed;

ArcParent a;
int nMaxNumberOfArcs = 30;  //This number of arcs will be created.
                            //A number of these will then be hidden.

void setup() {
  size(800, 800);

  nNumberOfArcs = 5;
  fArcSpeed = 0.07;
  

  a = new ArcParent(new PVector(width/2, height/2), nMaxNumberOfArcs, 120, 8, color(220));
}

void draw() {
  background(#202020);
  a.update();
}

void keyPressed() {
  if (key == ' ') {
    for (int aaa = 0; aaa < a.oArcs.length; aaa++) {
      a.oArcs[aaa].fNewArcStart = a.oArcs[aaa].fCurrentArcStart + random(-PI/2, PI/2);
      a.oArcs[aaa].fNewArcLength = a.oArcs[aaa].fCurrentArcLength + random(-PI/2, PI/2);
    }
  }
}

/*  A class that holds a circle
 *  and surrounding arcs.
 */ 

class ArcParent {
  PVector vLoc;        //The location of the circle
  int nArcs;           //Number of arcs
  float fSize;         //The size of the circle
  float fSpace;        //The space between each arc
  color cFill;         //The color of the circle and the arcs
  
  OuterArc[] oArcs;
  
  ArcParent(PVector vLoc_, int nArcs_, float fSize_, float fSpace_, color cFill_) {
    vLoc = vLoc_;
    nArcs = nArcs_;
    fSize = fSize_;
    fSpace = fSpace_;
    cFill = cFill_;
    oArcs = new OuterArc[nArcs];
    
    for (int iii = 0; iii < nArcs; iii++) {
      float fStrokeWeight = 12;
      oArcs[iii] = new OuterArc(vLoc, fSize+fStrokeWeight+fSpace+iii*fStrokeWeight*2+iii*fSpace, random(0, TWO_PI), random(0, TWO_PI), fStrokeWeight, cFill);
    }
  }
  
  void update() {
    for (int iii = 0; iii < oArcs.length; iii++) {    //Update the outer arcs
      oArcs[iii].update();
    }
    
    display();
  }
  
  void display() {
    fill(cFill);
    noStroke();
    
    ellipse(vLoc.x, vLoc.y, fSize, fSize);
    
    for (int iii = 0; iii < nNumberOfArcs; iii++) {          //Display the outer arcs
      oArcs[iii].display();
    }
  }
} 
    
    
/*  A class that makes arcs
 *  around a parent circle
 */

class OuterArc {
  PVector vLoc;                              //The center of the arc
  float fCenterDist,                         //The distance to the center
  fCurrentArcStart, fNewArcStart,            //The starting point of the arc, the new "start goal"
  fCurrentArcLength, fNewArcLength,          //The length of the arc, the new "length goal"
  fStrokeWeight;                             //The width of the arc
  color cFill;

  OuterArc(PVector vLoc_, float fCenterDist_, float fCurrentArcStart_, float fCurrentArcLength_, float fStrokeWeight_, color cFill_) {
    vLoc = vLoc_;
    fCenterDist = fCenterDist_;

    fCurrentArcStart = fCurrentArcStart_;
    fNewArcStart = fCurrentArcStart_;
    fCurrentArcLength = fCurrentArcLength_;
    fNewArcLength = fCurrentArcLength_;

    fStrokeWeight = fStrokeWeight_;
    cFill = cFill_;
  }

  void update() {
    updateArcStart();
    updateArcLength();
  }

  void updateArcStart() {
    if (abs(fCurrentArcStart-fNewArcStart) < 0.01) {
      fCurrentArcStart = fNewArcStart;
    } 
    else {
      fCurrentArcStart = lerp(fCurrentArcStart, fNewArcStart, fArcSpeed);
    }
  }

  void updateArcLength() {
    fNewArcLength = constrain(fNewArcLength, 0.2, TWO_PI-0.2);  //Make sure the arcs only revolve once

    if (abs(fCurrentArcLength-fNewArcLength) < 0.01) {
      fCurrentArcLength = fNewArcLength;
    } 
    else {
      fCurrentArcLength = lerp(fCurrentArcLength, fNewArcLength, fArcSpeed);
    }
  }

  void display() {
    noFill();
    stroke(cFill);
    strokeWeight(fStrokeWeight);

    arc(vLoc.x, vLoc.y, fCenterDist, fCenterDist, fCurrentArcStart, fCurrentArcStart + fCurrentArcLength);
  }
}



