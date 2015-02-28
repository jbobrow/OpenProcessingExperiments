
PVector p[]; //using standard vectors - makes the math easier to handle
int pCnt; //number of control points
int cntAdj; //amount of pCnt adjustment from mouse scroll wheel
int stepCnt; //number of steps
float curStep; //current step
float step; //step size
boolean bBlending; //blending flag

//================================================================ 

void setup() {
  //basic settings
  size(800,600);
  smooth();
  fill(0);
  textSize(9);
  textAlign(CENTER, CENTER);
  
  //initialize variables
  stepCnt = 200;
  step = 1.0/stepCnt; //treat step size as a straight - up percentage
  pCnt = 6;
  bBlending = true;
  
  //set up mouse wheel listener
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) {
      cntAdj = evt.getWheelRotation();
    }
  });
  
  //get the first set of control points
  newSet();
}

//================================================================ 

void draw() {
  if(curStep == 0.0 || !bBlending) {
    //clear the screen only at beginning of set if blending, otherwise clear every draw cycle
    background(128);
    text("Control Points: " + pCnt, 48, 10);
    text("Hit <space> to toggle blending...   Use mouse scroll wheel to adjust number of control points ", width/2, height - 10);
  } 
  
  if(curStep < 1) //we haven't finished the final path yet, start the point recursion(
    handlePoints(p, pCnt);
    
  curStep += step; //bump up the step counter by one step
  
  if(curStep > 1.2) //wait a couple moments before starting a new set
    newSet();
    
  if(cntAdj != 0) { //check if the mouse wheel has moved
    pCnt = max(pCnt - cntAdj, 2); //make sure we have at least two points
    cntAdj = 0;
    newSet();
  }
}

//================================================================ 

void handlePoints(PVector pnt[], int c) {
  if((curStep == 0 || !bBlending)&& c == pCnt) { //show the points themselves
    stroke(64, 64, 128);
    strokeWeight(1);
  }
  else {
    if(bBlending)stroke(64, 64, 128, 16); else stroke(64, 64, 128); //low alpha if blending
    strokeWeight(.25);
  }
  
  for(int i = 0; i < c; i++) { //iterate through each control point
    if((curStep == 0 || !bBlending)&& c == pCnt) { //first recursion(and either blending or start of set)- show the points themselves
      text("p" + i, pnt[i].x + 12, pnt[i].y);
      ellipse(pnt[i].x, pnt[i].y, 3, 3);
    }
    if(c == 1) //last recursion - show the heavy black dot
      ellipse(pnt[i].x, pnt[i].y, 4, 4);
      
    if(i > 0) //draw line between the current point and the prevevious one
      line(pnt[i - 1].x, pnt[i - 1].y, pnt[i].x, pnt[i].y);
  }

  if(c > 1) { //not the last recursion -- set up the subordinate control points for next recursion
    PVector cp[] = new PVector[c - 1];
    for(int i = 1; i < c; i++) {
      cp[i - 1] = PVector.sub(pnt[i], pnt[i - 1]);
      cp[i - 1].mult(curStep);
      cp[i - 1].add(pnt[i - 1]);
    } 
    handlePoints(cp, c - 1);
  }
}

//================================================================ 

void newSet() {
  //just picks some random points
  p = new PVector[pCnt];
  for(int i = 0; i < pCnt; i++)
    p[i] = new PVector(random(width - 40) + 20, random(height - 40) + 20);
  curStep = 0.0;
}

//================================================================ 

void keyPressed() {
  if(key == ' ') { //togle blending on space key
    bBlending = !bBlending;
    newSet();
  }
}

