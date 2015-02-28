

Vert cntr; //center of maze
float gap; // distance between concentric rings
float aFinish1, aFinish2; //angles of opening for maze finish
ArrayList wedges; //collection of maze segments
int ringCnt; //number of concentric rings
int currWedge; //keep track of active wedge while generating maze
boolean flagFinish; //flag for when to put final touches on maze
boolean flagDone; //flag for when everything's wrapped up

//================================================================

void setup() {
  size(700,600);
  smooth();
  noFill();
  textAlign(CENTER, CENTER);
  
  cntr = new Vert(width/2, height/2); //get center of screen
  newMaze(); //generate the maze's "wedges"
}

//================================================================

void newMaze() {
  //reset the flags
  flagFinish = false;
  flagDone = false;
  
  //make a new ArrayList (or clear out the existing one)
  if (wedges == null) wedges = new ArrayList();
  else wedges.clear();
  
  //create wedges
  ringCnt = int(random(4))+5; //between 5 and 9 rings works out nicely
  gap = (min(width, height)-70)/(ringCnt + 1); //that -70 is to leave room for the "Finish" text

  int wedgeCnt = 0; //defined before the loop so we can use the last value (wedge count of outer ring)
  for (int rNum=0; rNum<ringCnt; rNum++) {
    wedgeCnt = int(pow(2, rNum)*2); //number of wedges - simple binary progression
    float wedgeSz = TWO_PI/wedgeCnt; //get the size of one wedge
    for (int wNum=0; wNum<wedgeCnt; wNum++) { 
      float aLeft = wedgeSz * wNum; //get angle of left side of wedge
      float aRight = wedgeSz * (wNum + 1); //get angle of right side of wedge
      wedges.add(new Wedge(aLeft, aRight, rNum, wedges.size())); //add that wedge
    }
  }
  
  //now that all the wedges are created, figure out each wedge's neighbor
  for (int i=0; i<wedges.size(); i++) {
    Wedge w = (Wedge) wedges.get(i);
    w.neighborize();
  }
  
  //pick finshing wedge (we're starting at the end of the maze)
  Wedge w = (Wedge) wedges.get(int(random(wedgeCnt)) + wedgeCnt - 2); //pick a random wedge on the outer ring
  w.makeActive(null); //make it the active wedge 
  aFinish1 = w.aLeft; //grab the active wedge's angles while we have it...
  aFinish2 = w.aRight; //...for the maze's "Finish" opening
}

//================================================================

void draw() {
  float outerRing = gap*(ringCnt+1);
  
  if (!flagDone) { //check if we're not done
    if(flagFinish) { //check if we need to wrap things up
      background(100, 140, 100); //minty green
      pushMatrix();
        translate(cntr.x, cntr.y);
        text("Start", 0, 0);
        arc(0, 0, gap*(ringCnt+1), gap*(ringCnt+1), 0, aFinish1); //final outer ring (left of "gap")
        arc(0, 0, gap*(ringCnt+1), gap*(ringCnt+1), aFinish2, TWO_PI);  //final outer ring (right of "gap")
        float aFinishMid = aFinish1 + (aFinish2 - aFinish1)/2; //get angle of middle of "gap"
        text("Finish", cos(aFinishMid)*(outerRing/2+25), sin(aFinishMid)*(outerRing/2+25)); //pop the "Finish" - yeash - I suppose I could have used a rotate/translate/-rotate combo in lieu of that yucky statement oh well
      popMatrix();
      flagDone = true; //and we're done stop drawing stuff
    }
    else { //we're not wrapping things up (maze is still being made)
      background(128); //drab gray - the way I like it
      ellipse(cntr.x, cntr.y, outerRing, outerRing); //outer ring while generating
    }
    
    //draw what we have of the maze
    pushMatrix();
      translate(cntr.x, cntr.y);
      for (int i=0; i<wedges.size(); i++) {
        Wedge w = (Wedge) wedges.get(i);
        w.show();
      }
    popMatrix();
  }
}

//===========================================================================

void mouseReleased() {
  //make a new maze if we click the mouse
  if (flagDone) newMaze();
}

//===========================================================================

class Vert {
  //simple vert class to hold the coordinates (I always feel slightly guilty when I use PVectors for verts - don't know why...)
  float x, y;
  Vert(float _x, float _y) {
    x = _x;
    y = _y;
  }
}

//===========================================================================

class Wedge {
  boolean flagOpen, flagInnerBlocked, flagLeftBlocked; //some flags
  float aLeft, aRight, dInner; //angles and diameter
  Vert leftIn, leftOut; //for vertice pre-calcs
  Wedge wLeft, wRight, wIn, wOut1, wOut2; //references to neighboring wedges
  Wedge wPrior; //reference to previous wedge (for backtracking from dead ends)
  int rNum, lPos; //ring number and list position ID
  //------------------------------------
  Wedge(float angleLeft, float angleRight, int ringNum, int listPos) {
    flagOpen = true; //the wedge is "open" if it hasn't been active yet
    flagInnerBlocked = true; //true = show the inner arc (wall);
    flagLeftBlocked = true; //true = show the left line (wall);
    aLeft = angleLeft; //angle of left side of wedge
    aRight = angleRight; //angle of right side of wedge
    dInner = (ringNum+1)*gap; //diameter of wedge's inner arc
    
    //set up the wall vertice pre-calcs
    float radiusInner = (ringNum+1)*gap/2;
    leftIn = new Vert(cos(aLeft) * radiusInner,  sin(aLeft) * radiusInner);
    float radiusOuter = (ringNum+2)*gap/2;
    leftOut = new Vert(cos(aLeft) * radiusOuter,  sin(aLeft) * radiusOuter);
    
    //remember this wedge's ring number and position in the array list
    rNum = ringNum;
    lPos = listPos;
  }
  //------------------------------------
  void makeActive(Wedge w) {
    flagOpen = false; //once activated, it's no longer open
    currWedge = lPos; //only one wedge can be active
    if (w != null) wPrior = w; //the first wedge and wedges backing out of dead ends pass null to makeActive
  }
  //------------------------------------
  void neighborize() {
    //let's figure out who's our immediate neighbors
    int wCnt = int(pow(2, rNum))*2; //get the wedge count for this ring
    
    int first = wCnt-2; //get the first wedge ID
    int last = first + wCnt - 1; //get the last wedge ID
    int left = lPos - 1; //get ID of our left-hand neighbor
    if (left < first) left = last; //boundry-check
    int right = lPos + 1; //get ID of our right-hand neighbor
    if (right > last) right = first; //more boundry-check
    wLeft = (Wedge) wedges.get(left); //nab the reference to our left-hand neighbor...
    wRight = (Wedge) wedges.get(right); //...and the reference to our right-hand neighbor
    
    int in = int((lPos-2)/2); //get the ID of our inner neighbor
    if (rNum > 0) wIn = (Wedge) wedges.get(in); //nab the inner neighbor reference (assuming there is one)
    
    int out1 = (lPos + 1)*2; //get ID of our first outer neighbor...
    int out2 = out1 + 1; //...and the ID of our second outer neighbor...
    if (rNum < ringCnt - 1) { //boundry checking
      wOut1 = (Wedge) wedges.get(out1); //reference to 1st outer neighbor
      wOut2 = (Wedge) wedges.get(out2); //reference to 2nd outer neighbor
    }
    //Note: the inner and outer neighbors are null for the inner ring and outer ring (respectively)
  }
  //------------------------------------
  void show() {
    makeCheck(); //if the maze is still being made, check for stuff to do
    if (flagInnerBlocked) arc(0, 0, dInner, dInner, aLeft, aRight); //inner arc
    if (flagLeftBlocked) line(leftIn.x, leftIn.y, leftOut.x, leftOut.y); //left line
  }
  //------------------------------------
  void makeCheck() {
    if(lPos == currWedge) {
      
      //check for open neighbors
      boolean bAvailable = wRight.flagOpen | wLeft.flagOpen;
      if (wOut1 != null) bAvailable |= wOut1.flagOpen;
      if (wOut2 != null) bAvailable |= wOut2.flagOpen;
      if (wIn != null) bAvailable |= wIn.flagOpen;
      
      if(bAvailable) { //neighbor available - pick one and make it active
        boolean bPicked = false; //we're going to loop until an active neighbor is picked
        while (!bPicked) {
          switch (int(random(5))) {
            case 0: //pick right neighbor
              if (wRight.flagOpen) {
                wRight.makeActive(this);
                wRight.flagLeftBlocked = false;
                bPicked = true;
              }
              break;
            case 1: //pick left neighbor
              if (wLeft.flagOpen) {
                wLeft.makeActive(this);
                flagLeftBlocked = false;
                bPicked = true;
              }
              break;
            case 2: //pick 1st outer neighbor
              if (wOut1 != null)
                if (wOut1.flagOpen) {
                  wOut1.makeActive(this);
                  wOut1.flagInnerBlocked = false;
                  bPicked = true;
                }
              break;
            case 3: //pick 2nd outer neighbor
              if (wOut2 != null) 
                if (wOut2.flagOpen) { 
                  wOut2.makeActive(this);
                  wOut2.flagInnerBlocked = false;
                  bPicked = true;
                }
              break;
            case 4: //pick 3rd outer neighbor
              if (wIn != null) 
                if (wIn.flagOpen) {
                  wIn.makeActive(this);
                  flagInnerBlocked = false;
                  bPicked = true;
                }
              break;
          }
        }
      }
      else { //dead end - back up and pass back the token
        if (wPrior != null)
          wPrior.makeActive(null);
        else {
          //can't back up any more - maze is done
          flagFinish = true; //set finish flag
          Wedge w = (Wedge) wedges.get(int(random(2))); //pick either of the first two wedges...
          w.flagInnerBlocked = false; //...and have its inner arc not show
        }
      }
    }
  }
}

//================================================================

// by Chinchbug
// posted on Open Processing
// 6-18-2012

