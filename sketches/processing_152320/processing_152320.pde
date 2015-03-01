
int iPoints = 75;
color cBg = color(0);
int iFadeTime = 100;

Point[] aPoint;
boolean bMoving = true;
int iFadeCount = 0;

void setup() {
  size(640,640);
  noFill();
  strokeWeight(1);
  colorMode(HSB, iPoints, 1, 1);
    
  aPoint = new Point[iPoints];
  for(int i=0;i<iPoints;i++) {
    color cCol = color(i,1,.5);
    aPoint[i] = new Point(random(width),random(height),cCol);
    background(cBg);
  }
}

void draw() {
  if(bMoving) {
    bMoving = false;
    bMoving |= aPoint[0].follow(aPoint[iPoints-1].fX,aPoint[iPoints-1].fY);
    for(int i=1;i<iPoints;i++) {
      bMoving |= aPoint[i].follow(aPoint[i-1].fX,aPoint[i-1].fY);
    }
  } else if(iFadeCount<iFadeTime) {
    fill(cBg,20);
    noStroke();
    rect(0,0,width,height);
    iFadeCount++;
  } else {
    mousePressed();
  }
}

void mousePressed() {
  background(cBg);
  for(int i=0;i<iPoints;i++) {
    aPoint[i].setCoords(random(width),random(height));
  }
  bMoving = true;
  iFadeCount = 0; 
}

void keyPressed() {
  if(key==' ') {
    saveFrame("rainbowChase-####.png");
  }
}

class Point {
  float fX,fY;
  float iSpeed = 0.75; // px/frame
  color cCol;
  
  Point(float x, float y, color col) {
    fX = x;
    fY = y;
    cCol = col;
  }
  
  boolean follow(float x, float y) {
    //check if lines are too close
    if(dist(fX,fY,x,y)>1) {
      //calculate new position
      float fTheta = atan2((x-fX),(y-fY)); 
      float dX = fX+(sin(fTheta)*iSpeed);
      float dY = fY+(cos(fTheta)*iSpeed);
      //calculate proximity
      float iAlpha = (1-(dist(fX,fY,x,y)/(dist(0,0,width,height)/2)))*100;
      //draw movement line
      stroke(cCol,iAlpha);
      line(fX,fY,dX,dY);
      //update position
      fX = dX;
      fY = dY;
      return true;
    } else {
      return false;
    }
  }
  
  void setCoords(float x, float y) {
    fX = x;
    fY = y;
  }
}


