
//compass-related
Compass c;
boolean RELOCATE_COMPASS = false;
boolean ADJUST_COMPASS = false;
boolean DRAW_ARC = false; //rotate & draw arc
boolean ROTATE_COMPASS = false; //rotate compass w/out drawing arc
float clickRadius = 20;  //must be within this many pixels of target for clicks on compass elts
float dotNearness = 8;  //clicks this close to a dot are considered on dot's center
float lineNearness = 8;  //clicks this close to a line are considered on the line

//arc-related
ArrayList<CutArc> arcList = new ArrayList<CutArc>();
boolean arcListLocked = false;
CutArc currentArc = null; //reference to a currently-drawn arc

//point-related
ArrayList<Dot> dotList = new ArrayList<Dot>();
boolean dotListLocked = false;

//line-related
boolean DRAW_LINE = false;
ArrayList<Line> lineList = new ArrayList<Line>();
boolean lineListLocked = false;
LineSelector lineSel;
Line currentLine = null; //reference to currently-drawn line/segment

//general
Stack deleted = new Stack();  //storage for undeletes
boolean deletedStackLocked = false;
ColorPalette palette;
color clr;
TranslateWidget tWidget;
boolean TRANSLATE_PLANE = false;
UndeleteWidget undel;

void setup() {
  size(900, 800);
  background(255);
  smooth();
  frameRate(25);
  cursor(CROSS);
  
  c = new Compass((int)(.4*width),height/2);
  c.rotationAngleDeg = 35.0;
  
  palette = new ColorPalette(20,20);
  clr = color(0); //starting color is black
  
  lineSel = new LineSelector(palette.loc.x + palette.getWidth() + 15, palette.loc.y);
  tWidget = new TranslateWidget(lineSel); //size and place according to lineSel widget 
  undel = new UndeleteWidget(tWidget); //size and place according to translate widget 
  
}


void draw() {
  background(255);  //clear canvas
  
  boolean inside = mouseInBounds();
  
  if ( RELOCATE_COMPASS && inside ) {
    c.setLoc(mouseX,mouseY);
  } else if ( ADJUST_COMPASS && inside ) {
    c.adjustSize(mouseX,mouseY);
  } else if ( DRAW_ARC && inside ) {
    c.drawArc(mouseX,mouseY);
  } else if ( ROTATE_COMPASS && inside ) {
    c.doRotate(mouseX,mouseY);
  } else if ( TRANSLATE_PLANE && inside ) {
    //translate all drawn elements according to distance
    //from mouse click & center of window
    translatePlane(mouseX,mouseY);
  }

  //render arcs (except currentArc, not yet in ArrayList<CutArc>)
  //avoid ConcurrentModification exceptions
  if ( ! arcListLocked ) {
    arcListLocked = true;
    for( CutArc a : arcList ) {
      a.render(); 
    }
    arcListLocked = false;
  } //else, skip this draw() cycle...
  
  //render lines (exceptCurrentLine, not yet in ArrayList<Line>)
  if ( ! lineListLocked ) {
    lineListLocked = true;
    for ( Line l : lineList ) {
       l.render();
    }
    lineListLocked = false;
  }
  
  //render the points (Dots)
  if ( ! dotListLocked ) {
    dotListLocked = true;
    for ( Dot d : dotList ) {
       d.render();
    }
    dotListLocked = false;
  }
  
  //render compass
  c.render(); 
  
  //render controls:  color palette, line-type selector, translate button
  palette.render();
  lineSel.render();
  tWidget.render();
  undel.render();
  
  //if currently drawing an arc, re-render it after compass so it's 
  //complete visible (i.e., not obscured by compass)
  //render current arc (over compass)
  if ( DRAW_ARC && currentArc != null ) {
    currentArc.render();
  }
  
  //render currently-drawn line
  if ( DRAW_LINE && currentLine != null) {
    currentLine.setEnd(mouseX, mouseY);
    currentLine.render();
  }

  /* 
  //testing getNeeldPtCenter():
  fill(255,0,0);
  PVector needleCtr = c.getNeedlePtCenter();
  ellipseMode(CENTER);
  ellipse(needleCtr.x, needleCtr.y, clickRadius, clickRadius);
  c.rotationAngleDeg += .5;
  c.ptToPtDist -= 2;
  c.recomputeAlpha();
  */
  
  /*
  //testing getPencilPt():
  PVector tmp = c.getPencilPt();
  fill(255,255,0);
  ellipse(tmp.x, tmp.y, 15,15);
  line(c.needlePt.x, c.needlePt.y, tmp.x, tmp.y);
  c.ptToPtDist +=2;
  c.recomputeAlpha();
  */

  /*
  //testing getPivotPt():
  PVector tmp = c.getPivotPt();
  println(tmp);
  fill(0,255,0);
  ellipse(tmp.x, tmp.y, 15,15);
  c.ptToPtDist +=2;
  c.recomputeAlpha();
  */
  
  /*
  //testing getHandleCenter():
  PVector tmp = c.getHandleCenter();
  //println(tmp);
  fill(0,255,0);
  ellipse(tmp.x, tmp.y, 1.26*clickRadius,1.26*clickRadius);
  c.ptToPtDist +=2;
  c.recomputeAlpha();
  */
  
  //c.rotationAngleDeg +=2;
}


void mousePressed(MouseEvent event) {
  PVector clickLoc = new PVector(mouseX, mouseY);
  //NOTE:  order of click checking matters!
  
  //LEFT CLICK
  if ( event.getButton() == 1 ) { //left click
    if ( TRANSLATE_PLANE ) { //BEGIN/END TRANSLATION OF PLANE
      if ( tWidget.fromPt == null ) { //haven't started actual translation yet
        tWidget.fromPt = new PVector(mouseX,mouseY);
        cursor(MOVE);
      } else { //translation ending
        TRANSLATE_PLANE = false;
        tWidget.fromPt = null;        
        cursor(CROSS); 
      }
    } else if ( c.getPencilPt().dist( clickLoc ) < clickRadius ) { //CLICK PENCIL PT
      //be careful to check for compass adjustment ahead of translation in case
      //pencil point obscures compass needle
      //left-click of pencil pt begins adjustment of compass radius
      ADJUST_COMPASS = true;
    
    } else if ( c.getNeedlePt().dist( clickLoc ) < clickRadius ) {  //CLICK NEEDLE PT
    
      //left-click of needle point begins compass translation
      RELOCATE_COMPASS = true;
      
    } else if ( c.getHandleCenter().dist( clickLoc ) < 1.26*clickRadius ) {  //CLICK HANDLE
      DRAW_ARC = true;
      currentArc = new CutArc( c.getNeedlePt(), c.ptToPtDist,  c.rotationAngleDeg );
      
    } else if ( palette.isInside(clickLoc) ) {  //CLICK COLOR PALETTE
      
      //nothing to do here -- isInside() determines if color swatch has been clicked and 
      //changes global color ref, 'clr'
      
    } else if ( lineSel.isInside(clickLoc) ) {  //CLICK LINE-TYPE SELECTOR
      
      //nothing to do here -- isInside() determines if line type selector area has been 
      //clicked and toggles the selection between segment and line
      
    } else if ( tWidget.isInside(clickLoc) ) { //CLICK TRANSLATE WIDGET
      //prepare to accept loc0 click (subsequent click @ loc1 ends translation)
      //cursor(MOVE);    
      cursor(HAND);
      TRANSLATE_PLANE = true;
      
    } else if ( undel.isInside(clickLoc) ) { //CLICK UNDELETE WIDGET
        undel.go();
        
    } else if ( getNearbyDot(clickLoc, dotNearness) != null ) { //CLICK TO START/END LINE/SEGMENT
      Dot d = getNearbyDot(clickLoc, dotNearness);
      if ( ! DRAW_LINE ) { //new line
        currentLine = lineSel.getNewLine(d.loc.x, d.loc.y);
        DRAW_LINE = true;
      } else {
        //handle termination of line
        DRAW_LINE = false;
        currentLine.setEnd(d.loc.x, d.loc.y);
        
        try {
          while(lineListLocked) {
            Thread.sleep(1);
          }
        } catch (Exception e) {
        }
        lineListLocked = true;
        lineList.add(currentLine);
        lineListLocked = false;
        currentLine = null;
      }
    
    } else { //CLICK TO PLACE NEW DOT
      //remaining case for left click:  place Dot (point) here
      Dot d = new Dot(mouseX, mouseY);
      try {
        while(dotListLocked) {
          Thread.sleep(1);
        }
      } catch (Exception e) {
      }
      
      dotListLocked = true;
      dotList.add(d);
      dotListLocked = false;
    }
    
    
  } else if ( event.getButton() == 3 ) { //RIGHT CLICK
  
    if ( c.getHandleCenter().dist( clickLoc ) < 1.26*clickRadius ) {
      //right-click of compass handle, arc-less rotation of compass
      ROTATE_COMPASS = true;
      
    } else {  //deleting an object -- arc, line, point
      boolean deletedObj = 
        deleteLine(mouseX,mouseY) || deleteDot(mouseX,mouseY) || deleteCutArc(mouseX,mouseY);
    }
  }
}  


void mouseReleased(MouseEvent event) {
  if ( RELOCATE_COMPASS ) {
    RELOCATE_COMPASS = false;
    //is the final location of the compass close to a dot/point on the plane? 
    //if so, automatically relocate compass point to center of dot
    c.checkForNearbyDot();
  } else if ( ADJUST_COMPASS ) {
     ADJUST_COMPASS = false; 
  } else if ( DRAW_ARC ) {
    DRAW_ARC = false;
  
    try { 
      while( arcListLocked ) {
        Thread.sleep(1);
      }
    } catch (Exception e) {
    }
        
    arcListLocked = true;
    arcList.add(currentArc);
    arcListLocked = false;
    currentArc = null;
  
  } else if ( ROTATE_COMPASS ) { 
    ROTATE_COMPASS = false;
  }  
}
 
void translatePlane(float x, float y) {
  if ( tWidget.fromPt == null ) {
    //translation not actually begun, waiting for user to click plane for starting pt
    return;
  }

  PVector moveVec = tWidget.fromPt;
  moveVec.sub(new PVector(x,y));
  moveVec.mult(-1);
  
  try { 
    while( arcListLocked ) {
      Thread.sleep(1);
    }
  } catch (Exception e) {
  }
  arcListLocked = true;
  for(CutArc curArc : arcList) {
    curArc.center.add(moveVec);
  }
  arcListLocked = false;
  
  try { 
    while( dotListLocked ) {
      Thread.sleep(1);
    }
  } catch (Exception e) {
  }
  dotListLocked = true;
  for(Dot curDot : dotList) {
    curDot.loc.add(moveVec);
  }
  dotListLocked = false;
  
  try { 
    while( lineListLocked ) {
      Thread.sleep(1);
    }
  } catch (Exception e) {
  }
  lineListLocked = true;
  for(Line curLine : lineList) {
    curLine.pt1.add(moveVec);
    PVector curEndPt = curLine.pt2;
    PVector newEndPt = new PVector(curEndPt.x, curEndPt.y);
    newEndPt.add(moveVec);
    curLine.setEnd(newEndPt.x, newEndPt.y);
  }
  lineListLocked = false;
  
  //move compass
  c.needlePt.add(moveVec);
  
  tWidget.fromPt = new PVector(x,y); //next move relative to this location
}
 
Dot getNearbyDot(PVector loc, float dist) {
    //return Dot within dist pixels of loc
    try {
        while(dotListLocked) {
          Thread.sleep(1);
        }
      } catch (Exception e) {
      }
      dotListLocked = true;
      
      for(Dot d : dotList) {
        PVector dotLoc = d.loc;      
        if(loc.dist(dotLoc) < dist) {
          dotListLocked = false;
          return d;
        }
      
      }

      //no suitable Dot found
      dotListLocked = false;
      return null;
}

Line getNearbyLine(PVector loc, float dist) {
  //return Line within dist pixels of loc
   try {
        while(lineListLocked) {
          Thread.sleep(1);
        }
      } catch (Exception e) {
      }
      lineListLocked = true;
      
      for(Line l : lineList) {
        if(l.getDistance(loc.x, loc.y) < dist) {
          lineListLocked = false;
          return l;
        }
      
      }

      //no suitable Dot found
      lineListLocked = false;
      return null;

} 

boolean deleteCutArc(float x, float y) {
  CutArc c = new CutArc(new PVector(0,0),0,0); //dummy obj
  return c.deleteCutArc(x,y);
}


boolean deleteDot(float x, float y) {
  Dot d = new Dot(0,0); //temp obj with which to call deleteDot()
  return d.deleteDot(mouseX,mouseY);
}


boolean deleteLine(float x, float y) {
  Line l = getNearbyLine(new PVector(x,y),lineNearness);
  if ( l == null ) {
     return false;
  }
  try {
    while(lineListLocked) {
      Thread.sleep(1);
    }
  } catch (Exception e) {
  }
  lineListLocked = true;
  
  for( int i = 0 ; i < lineList.size() ; i++ ) {
    if ( l == lineList.get(i) ) {
      deleted.push( lineList.remove(i) );
      lineListLocked = false;
      return true;
    }
  }
  
  //if this is executed, then getNearByLine() didn't work or 
  //removal of Line from lineList wasn't successful
  return false;
}
  
boolean mouseInBounds() {
  return mouseX >= clickRadius && mouseX <= width-clickRadius && mouseY >= clickRadius && mouseY <= height-clickRadius;
}

abstract class Line {
  PVector pt1, pt2;
  color lineClr;
  final float VERTICAL = 999999;
  
  void setEnd(float x, float y) {
    pt2 = new PVector(x,y);
  }

  float getSlope() {
    float dX = pt2.x - pt1.x;
    if ( Math.abs(dX) == 0 ) { //vertical
      return VERTICAL;
    }
    float dY = pt2.y - pt1.y;
    return dY/dX;
  }
  
  abstract void render();
  
  double getDistance(float x, float y) {
    float slope = getSlope();
    //return shortest Cartesian between this line and given point's coordiantes
    float yIntPerp = y + 1/slope*x;
    float yIntOrig = pt1.y - slope*pt1.x;
    
    float intersectionX = (yIntPerp - yIntOrig)/( slope + 1/slope );
    float intersectionY = slope*intersectionX + yIntOrig;
    
    PVector intersection = new PVector(intersectionX, intersectionY);
    return intersection.dist(new PVector(x,y));
    
  }
  
}

class InfiniteLine extends Line {
  //in addition to specified pts (inherited pt1, pt2), there needs to be two points
  //at the edge of the visible canvas to define the rendered line
  PVector edgePt1, edgePt2;

  public InfiniteLine(float x, float y) {
    lineClr = clr;
    pt1 = new PVector(x,y);
    edgePt1 = new PVector(0,0);
    edgePt2 = new PVector(0,0);
    setEnd(x,y); //sets pt2 & endpts on edge of window
  }
  
  void setEnd(float x, float y) {
    super.setEnd(x,y);
    //m of y=mx+b:
    float slope = getSlope();
    //b of y=mx+b:
    float vertIntercept = pt1.y - slope * pt1.x;

    //recompute edge pts
    if ( slope == VERTICAL ) {
      edgePt1.y = 0;
      edgePt1.x = pt1.x;
      edgePt2.y = height;
      edgePt2.x = edgePt1.x;
      
    } else {
      edgePt1.x = 0;
      edgePt1.y = vertIntercept;
      edgePt2.x = width;
      edgePt2.y = slope*width + vertIntercept;
    }

  }
  
  void render() {
    strokeWeight(1);
    stroke(lineClr);
    line(edgePt1.x, edgePt1.y, edgePt2.x, edgePt2.y);
  }
}

class LineSegment extends Line {
  
  public LineSegment(float x, float y) {
    lineClr = clr;
    pt1 = new PVector(x,y);
    setEnd(pt1.x, pt1.y);
  }
  
  void render() {
    strokeWeight(1);
    stroke(lineClr);
    line(pt1.x, pt1.y, pt2.x, pt2.y);
  }
}


class Dot {
  //a point on the plane
  PVector loc;
  int radius = 4;
  color dotClr;
  
  public Dot(float x, float y) {
    loc = new PVector(x,y);
    dotClr = clr;
  }
  
  void render() {
    fill(dotClr);
    stroke(dotClr);
    ellipse(loc.x, loc.y, radius*2, radius*2);
  }
  
  boolean isClicked(float x, float y) {
    //assume 2px buffer around point counts as a click
    if ( loc.dist(new PVector(x,y)) <= radius + 2 ) {
       return true;
    }
    return false;    
  }
  
  //ordinarily would be a static method if not an inner class!
  boolean deleteDot(float x, float y) {
    try {
      while(dotListLocked) {
        Thread.sleep(1);
      }
    } catch (Exception e) {
    }
    dotListLocked = true;
    
    for(int i = dotList.size() - 1; i > -1 ; i--) {
      //in retrospect, moving in reverse through this arraylist
      //was not necessary -- only one remove() will happen at most.
      if ( dotList.get(i).isClicked(x,y) ) {
        Dot del = dotList.remove(i);
        dotListLocked = false;
    
        try {
          while(deletedStackLocked) {
            Thread.sleep(1);
          }
        } catch (Exception e) {
        }
        deletedStackLocked = true;        
        deleted.push(del);
        deletedStackLocked = false;        
                
        return true;  //successfully removed a dot
      }
    }
    dotListLocked = false;
    return false; //did not remove a dot
  }
    
  
}

class CutArc {
  PVector center;
  int direction; //+ is CW, - is CCW
  float radius;
  float startAngleDeg, endAngleDeg;
  int clickTolerance = 5; //dist away from arc allowed for delete click
  color arcClr;
  
  public CutArc(PVector c, float r, float start) {
    center = new PVector(c.x, c.y); //separate this arc from compass' center pt
    radius = r;
    startAngleDeg = start;
    endAngleDeg = start;
    direction = 0;
    arcClr = clr;
  }
  
  
  //ordinarily would be a static method if not an inner class!
  boolean deleteCutArc(float x, float y) {
    try { 
      while( arcListLocked ) {
        Thread.sleep(1);
      }
    } catch (Exception e) {
    }
    arcListLocked = true;
        
    for( int i = 0 ; i < arcList.size() ; i++ ) {
      CutArc cur = arcList.get(i);
      PVector ctr = cur.center;
    
      //see whether right-click loc is within radial tolerance
      double distFromCtr = Math.sqrt((x-ctr.x)*(x-ctr.x) + (y-ctr.y)*(y-ctr.y));

      if ( Math.abs( distFromCtr - cur.radius ) <= clickTolerance ) {
        float angle = atan( (ctr.y - y) / (x - ctr.x) ) * 180/PI;
        //need to make corrections based on quadrant when ctr is considered origin
        //do to my angle orientation (CCW from +x) vs. Processing's (CW from +x)
        if ( x > ctr.x && y < ctr.y ) { //quadrant I
          //no adjustment needed
        } else if ( x < ctr.x ) { //quadrant II or III
          angle += 180;
        } else { //quadrant IV
          angle += 360;
        }
        
        boolean clickOnArc = false;
        if ( cur.direction > 0 ) { //CW arc
           if ( cur.startAngleDeg < cur.endAngleDeg ) {
             //arc crosses 0 degrees (+x axis)
             if ( angle <= cur.startAngleDeg || angle >= cur.endAngleDeg ) {
                clickOnArc = true;
             }
           } else { //arc does not cross 0-deg
             if ( angle <= cur.startAngleDeg && angle >= cur.endAngleDeg ) {
                 clickOnArc = true;
             }
           }
        } else { //CCW arc
          if ( cur.startAngleDeg > cur.endAngleDeg ) { 
            //arc crosses 0 degrees (+x axis)
             if ( angle >= cur.startAngleDeg || angle <= cur.endAngleDeg ) {
                clickOnArc = true;
             }
          } else { //does not cross 0-deg
            if ( angle >= cur.startAngleDeg && angle <= cur.endAngleDeg ) {
                 clickOnArc = true;
            }
          }

        }
       
        if ( clickOnArc ) {  //OK to delete this arc
          arcList.remove(i);
          deleted.push(cur);      
          arcListLocked = false;
          return true;
        }
      }
    }

    arcListLocked = false;
    return false;    
  }  
    
  void setEnd(float e) {
    //set ending angle; called multiple times over creation of arc
    //compare e to current endAngleDeg to determine if this arc is CW or CCW
    
    //take lesser difference of e & endAngleDeg (accounts for e & endAngleDeg straddling 360deg/0deg, +x axis)
    //pos diff = CCW, neg diff = CW
    float diff1 = e - endAngleDeg;
    float diff2 = e + 360 - endAngleDeg;
    float diff;
    if ( min( Math.abs(diff1), Math.abs(diff2) ) == Math.abs(diff1) ) {
      diff = diff1;
    } else { 
      diff = diff2;
    }
        
    if ( diff > 0 ) { 
      direction--; 
    } else {
      direction++;
    }
    //println("moving " + direction);
    
    endAngleDeg = e;
  }
  
  void render() {
    stroke(arcClr);
    strokeWeight(1);
    noFill();
    
    //my <s and Processing go different directions;
    //I go CCW from +x axis, Processing goes CW from +x axis
    float start = -startAngleDeg * PI/180;
    float end = -endAngleDeg * PI/180;
    
    //arc() only works for CW drawing, so swap start & end in case of CCW arc
    if ( direction < 0 ) {
       float tmp = start;
       start = end;
       end = tmp; 
      
      if ( start > end ) {
        end += 2*PI;  
      }
    }    
    
    //handle case of CW arc that needs to pass 0 degrees
    if ( direction > 0 && start > end ) {
        end += 2*PI;
    } 
    
    /*
    if ( this == current ) { 
      println("arc start = " + (180/PI*start) + ", end = " + (180/PI*end));
    }
    */
    
    arc(center.x, center.y, radius*2, radius*2, start, end);
    fill(0);
  }
}

class Compass {
  PVector needlePt;
  final int compassLen = 400; //px used for point-to-point length of compass when fully expanded
  PVector pencilPt = new PVector(.15*compassLen,0);
  final float needleLen = .04*compassLen;
  float rotationAngleDeg = 0.0; //rotation of compass's basline, btwn needle pt and pencil pt
  float ptToPtDist = 100; //cartesian dist btwn needle pt & pencil pt
  float alpha; //angle btwn baseline and each side of compass
  
  Compass() {
    this(0,0);
  }
  
  Compass(int x, int y) {
    needlePt = new PVector();
    setLoc(x,y);
    recomputeAlpha();
  }
  
  void setLoc(float x, float y) {
    needlePt.x = x;
    needlePt.y = y;
  }
  
  void recomputeAlpha() {
    //alpha is angle each side of compass makes w/baseline (line btwn endpts of sides)
    alpha = acos(ptToPtDist/compassLen) * 180/PI;
  }
  
  PVector getNeedlePt() {
      return needlePt;
  }
  
  PVector getNeedlePtCenter() {
    float len = .5*needleLen;
    float x = needlePt.x + .25*len*cos( (rotationAngleDeg+alpha) * PI/180.0);
    float y = needlePt.y - .25*len*sin( (rotationAngleDeg+alpha) * PI/180.0);
    return new PVector(x,y);
    //return new PVector(needlePt.x,needlePt.y);
  }
  
  PVector getPencilPt() {
    float xDiff = ptToPtDist * cos(rotationAngleDeg * PI/180.0);
    float yDiff = ptToPtDist * sin(rotationAngleDeg * PI/180.0);    
    return new PVector( needlePt.x + xDiff, needlePt.y - yDiff );
  }
  
  PVector getHandleCenter() {
    PVector pivotPt = getPivotPt();
    return new PVector( 
      pivotPt.x - .056*compassLen*sin(rotationAngleDeg*PI/180.0),
      pivotPt.y - .056*compassLen*cos(rotationAngleDeg*PI/180.0)
    );
  }
  
  PVector getPivotPt() {
    return new PVector( 
      needlePt.x + compassLen/2*cos( (rotationAngleDeg+alpha)*PI/180.0 ),
      needlePt.y - compassLen/2*sin( (rotationAngleDeg+alpha)*PI/180.0 ) 
    );
  }  
  
  boolean isNeedlePtClicked() {
    return true;
  }
  
  float getAngleFromNeedlePt(float x, float y) {
     //return the # of degrees formed by angle between
     //needle pt and (x,y)
     float clickAngleDeg = atan( (needlePt.y-y)/(x-needlePt.x) ) * 180.0/PI;

     //need to make corrections based on quadrant when needlePt is considered origin
     //do to my angle orientation (CCW from +x) vs. Processing's (CW from +x)
     if ( x > needlePt.x && y < needlePt.y ) { //quadrant I
       //no adjustment needed
     } else if ( x < needlePt.x ) { //quadrant II or III
       clickAngleDeg += 180;
     } else { //quadrant IV
       clickAngleDeg += 360;
     }
     return clickAngleDeg;       
  }
  
  void doRotate(float x, float y) {
    //effect a rotation of the compass w/out leaving behind arc in pencil's path
     float clickAngleDeg = getAngleFromNeedlePt(x,y);
    
    if ( clickAngleDeg >= alpha ) {
      rotationAngleDeg = clickAngleDeg - alpha;
    } else { 
      rotationAngleDeg = clickAngleDeg + 360 - alpha;
    }
  }
  
  void drawArc(float x, float y) {
    //effect a rotation of the compass, leaving behind pts tracing pencil's path
    //find angle btwn needle pt & click location:
    float clickAngleDeg = getAngleFromNeedlePt(x,y);
    
    if ( clickAngleDeg >= alpha ) {
      rotationAngleDeg = clickAngleDeg - alpha;
    } else { 
      rotationAngleDeg = clickAngleDeg + 360 - alpha;
    }
      
    currentArc.setEnd(rotationAngleDeg);
    //rendered after compass is rendered in draw()...
  }
  
  void adjustSize(float x, float y) {
    //match compass radius to dist between needle pt and 
    //(x,y), making sure that dist doesn't exceed compass' max size
    float d = needlePt.dist(new PVector(x,y));
    if ( d >= .9*compassLen ) return;

    ptToPtDist = d;
    
    //angle between compass baseline & compass' sides has changed
    recomputeAlpha();
  }
  
  boolean checkForNearbyDot() {
    //returns true if compass is relocated to the center pt of a nearby Dot
    
      Dot closeDot = getNearbyDot(needlePt, dotNearness);
      if ( closeDot != null ) { //nearby dot found
          setLoc(closeDot.loc.x, closeDot.loc.y);
          return true;
        }
  
      //no suitable nearby dot found, leave compass needle pt where it is   
      return false;
  }
      
  void render() {
    pushMatrix();
    translate(needlePt.x, needlePt.y);
    
    rotate(-rotationAngleDeg*PI/180.0); //establish baseline of compass
    
    //draw needle
    pushMatrix();
    rotate(-alpha*PI/180.0);
    fill(0);
    if (RELOCATE_COMPASS) fill(255,100,100);
    noStroke();
    strokeWeight(1);
    rect(0,-1,needleLen,2);
    
    pushMatrix();
    translate(needleLen,0);
    fill(162);
    stroke(0);
    //draw "left" side of compass past needle pt toward hinge
    rect(0,-.02*compassLen,.46*compassLen,.04*compassLen);
    
    pushMatrix();
    translate(.46*compassLen,0);
    fill(75);
    ellipse(0,0,.07*compassLen,.07*compassLen);
    
    //draw "right" side of compass w/pencil
    pushMatrix();
    rotate(2*alpha*PI/180.0);
    fill(162);
    rect(0,-.02*compassLen,.46*compassLen,.04*compassLen);
    pushMatrix();
    translate(.46*compassLen,0);
    fill(200);
    triangle(0,-.02*compassLen,0,.02*compassLen,needleLen,0);
    fill(30);
    if (ADJUST_COMPASS) fill(255,100,100);
    triangle(.02*compassLen,-.25*needleLen,.02*compassLen,.25*needleLen,needleLen,0);

    popMatrix(); popMatrix();
    
    //draw handle
    rotate(alpha*PI/180.0);
    fill(162);
    rect(-.015*compassLen,0,.03*compassLen,-.08*compassLen);
    line(-.0075*compassLen,0,-.0075*compassLen,-.075*compassLen);
    line(.0067*compassLen,0,.0067*compassLen,-.075*compassLen);
    rotate(-alpha*PI/180.0);
    
    fill(75);
    ellipse(0,0,.07*compassLen,.07*compassLen);

    popMatrix(); popMatrix(); popMatrix(); popMatrix();
  }
    
}

class ColorSwatch {
  color clr;
  PVector loc;
  int side; //swatch rendered as a square w/length side  
  boolean selected;
  
  public ColorSwatch(color c, float x, float y, int s) {
    clr = c;
    loc = new PVector(x,y);    
    side = s;
    selected = false;
  }
  
  void unselect() {
    selected = false;
  }
  
  void select() {
    selected = true;
  }
  
  void render() {
    rectMode(CORNER);
    fill(clr);
    stroke(0);
    strokeWeight(1);
    rect(loc.x,loc.y,side,side);
    
    if ( selected ) { //indicate w/white rectangle in center
      stroke(0);
      fill(255);
      rect(loc.x+.25*side, loc.y+.25*side, .5*side, .5*side);
    }
      
  }
}

class ColorPalette {
  //a ColorPalette has multiple ColorSwatch'es
  ArrayList<ColorSwatch> swatches = new ArrayList<ColorSwatch>();
  PVector loc;
  int spacing = 5;
  int side = 20; //size of each swatch in palette

  public ColorPalette(float x, float y) {
    loc = new PVector(x,y);
    
    //populate swatches
    int i = 0;
    swatches.add(new ColorSwatch(color(255,0,0), x + (i+1)*spacing + i*side, y+spacing, side)); i++;
    swatches.add(new ColorSwatch(color(0,255,0), x + (i+1)*spacing + i*side, y+spacing, side)); i++;
    swatches.add(new ColorSwatch(color(0,0,255), x + (i+1)*spacing + i*side, y+spacing, side)); i++;
    swatches.add(new ColorSwatch(color(255,0,255), x + (i+1)*spacing + i*side, y+spacing, side)); i++;
    swatches.add(new ColorSwatch(color(235,235,0), x + (i+1)*spacing + i*side, y+spacing, side)); i++;
    swatches.add(new ColorSwatch(color(0,205,255), x + (i+1)*spacing + i*side, y+spacing, side)); i++;
    swatches.add(new ColorSwatch(color(127), x + (i+1)*spacing + i*side, y+spacing, side)); i++;
    swatches.add(new ColorSwatch(color(0), x + (i+1)*spacing + i*side, y+spacing, side)); 
    
    swatches.get( swatches.size() - 1 ).select();
  }
  
  int getWidth() {
    return swatches.size()*(side + spacing) + spacing;
  }
  
  int getHeight() {
    return 2*spacing + side;
  }
  
  boolean isInside(PVector clickLoc) {
    float x = clickLoc.x;
    float y = clickLoc.y;
    boolean inside = x >= loc.x && x <= loc.x+getWidth() && y >= loc.y && y <= loc.y + getHeight();
    
    if ( inside ) { //set global color accordingly
      //unselect all colors
      for(ColorSwatch c : swatches) {
        c.unselect();
      }
    
      float xOffset = x - loc.x - spacing;
      int clrIdx = (int)(xOffset / (side + spacing));
      ColorSwatch chosenSwatch = swatches.get(clrIdx);
      chosenSwatch.select();
      clr = chosenSwatch.clr;
 
    }
    
    return inside;
  }
  
  void render() {
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(loc.x, loc.y, getWidth(), getHeight()); 
    for( ColorSwatch cs : swatches ) {
      cs.render();
    }
  } 
  
}

//provide widget for initiating translation of entire plane 
//(more accurately, all elements drawn on it -- arcs, lines, compass, etc.
class TranslateWidget {
  int side;
  PVector loc, fromPt;
 
  public TranslateWidget(LineSelector lineSel) {
    loc = new PVector(lineSel.loc.x + lineSel.getWidth() + 15, lineSel.loc.y);
    side = lineSel.getHeight();
    fromPt = null; //defines starting pt for translation, (mouseX,mouseY) is endpt
    //note:  fromPt is dynamic -- each time a translation occurs (due to draw() call), 
    //fromPt gets switched to last mouse position
  }
 
  void render() {
    strokeWeight(2);
    fill(255);
    rect(loc.x,loc.y,side,side);
    pushMatrix();
    translate(loc.x+.5*side, loc.y+.5*side);
    strokeWeight(1.5);
    
    //horiz
    line(-.33*side,0,.33*side,0); 
    line(-.33*side,0,-.2*side,-.1*side);
    line(-.33*side,0,-.2*side,.1*side);
    line(.33*side,0,.2*side,-.1*side);
    line(.33*side,0,.2*side,.1*side);
        
    //vert
    line(0,-.33*side,0,.33*side);
    line(0,.33*side,-.1*side,.2*side); 
    line(0,.33*side,.1*side,.2*side); 
    line(0,-.33*side,-.1*side,-.2*side);
    line(0,-.33*side,.1*side,-.2*side);
    popMatrix();
  }
  
  boolean isInside(PVector clickLoc) {
    float x = clickLoc.x; 
    float y = clickLoc.y; 
    return x >= loc.x && x <= loc.x+side && y >= loc.y && y <= loc.y+side;
  }
   
}

class UndeleteWidget {
  String label = "undelete\nlast";
  PVector loc;
  float w,h; //width & height
  
  public UndeleteWidget(TranslateWidget t) {
    loc = new PVector(t.loc.x + t.side + 15, t.loc.y);
    h = t.side;
    w = h*2.2;
  }
  
  void render() {
    strokeWeight(1.5);
    fill(255);
    rect(loc.x, loc.y, w, h);
    strokeWeight(1);
    fill(0);
    textAlign(LEFT,TOP);
    text(label,loc.x + 5,loc.y + 1,w,h);
  }
  
  boolean isInside(PVector clickLoc) {
    float x = clickLoc.x; 
    float y = clickLoc.y; 
    return x >= loc.x && x <= loc.x+w && y >= loc.y && y <= loc.y+h;
  }
  
  void go() { //perform undelete
    if ( deleted.empty() ) { //nothing to undelete
	return;
    }

    Object obj = deleted.pop();
  
    if ( obj instanceof CutArc ) {
      try { 
        while( arcListLocked ) {
          Thread.sleep(1);
        }
      } catch (Exception e) {
      }
      arcListLocked = true;
      arcList.add( (CutArc)obj );
      arcListLocked = false;
    } else if ( obj instanceof Dot ) {
      try { 
        while( dotListLocked ) {
          Thread.sleep(1);
        }
      } catch (Exception e) {
      }
      dotListLocked = true;
      dotList.add( (Dot)obj );
      dotListLocked = false;
    } else if ( obj instanceof Line ) {
      try { 
        while( lineListLocked ) {
          Thread.sleep(1);
        }
      } catch (Exception e) {
      }
      lineListLocked = true;
      if ( obj instanceof InfiniteLine ) {
        lineList.add( (InfiniteLine)obj );
      } else {
        lineList.add( (LineSegment)obj );
      }
      lineListLocked = false;
    }
  }
  
}
  

//provide widget for selecting line style -- infinite or segment
class LineSelector {
  int side = 20;
  int spacing = 5;
  final int SEGMENT = 0, LINE = 1;
  int lineType;
  PVector loc;
  
  public LineSelector(float x, float y) {
    lineType = SEGMENT;
    loc = new PVector(x,y);
  }
  
  Line getNewLine(float x, float y) {
    if ( lineType == SEGMENT ) {
      return new LineSegment(x,y);
    } else {
      return new InfiniteLine(x,y);
    }
  }
  
  boolean isInside(PVector clickLoc) {
    float x = clickLoc.x; 
    float y = clickLoc.y; 
    boolean inside = x >= loc.x && x <= loc.x+getWidth() && y >= loc.y && y <= loc.y + getHeight();
    
    if ( inside ) {
      //toggle choice
      if ( lineType == SEGMENT ) { 
        lineType = LINE; 
      } else {
        lineType = SEGMENT;
      }
    }
    
    return inside;
    
  }
  
  int getWidth() {
    return (int)(getHeight() * 1.5);
  }
  
  int getHeight() {
    return side + 2*spacing;
  }
  
  void render() {
    strokeWeight(2);
    fill(255);
    rect(loc.x, loc.y, getWidth(), getHeight());
    
    strokeWeight(1.5);
    line(loc.x + .23*getWidth(), loc.y + .5*getHeight(), loc.x + .77*getWidth(), loc.y + .5*getHeight());
    
    if ( lineType == SEGMENT ) {
      fill(0);
      ellipse(loc.x + .25*getWidth(), loc.y + .5*getHeight(), .12*getWidth(), .12*getWidth());
      ellipse(loc.x + .75*getWidth(), loc.y + .5*getHeight(), .12*getWidth(), .12*getWidth());
    } else {
      line(loc.x + .23*getWidth(), loc.y + .5*getHeight(), loc.x + .34*getWidth(), loc.y + .34*getHeight());
      line(loc.x + .23*getWidth(), loc.y + .5*getHeight(), loc.x + .34*getWidth(), loc.y + .66*getHeight());
      line(loc.x + .77*getWidth(), loc.y + .5*getHeight(), loc.x + .66*getWidth(), loc.y + .34*getHeight());
      line(loc.x + .77*getWidth(), loc.y + .5*getHeight(), loc.x + .66*getWidth(), loc.y + .66*getHeight());

    }
  }
  
}



