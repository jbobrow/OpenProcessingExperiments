
float radius,tilt,petalLength,ro,step ;
float numpetals,tht,rotSpeed ;
boolean bDrawPath = false ;


// Flower Colour
color flowerCol = color(255,0,0,100) ;
color petalCol = color(200,200,25,200) ;
color stemCol = color(255,255,0,40) ;


 color yellow = color(255,255,0,255) ;
 color black = color(0,0,0,255) ;
 color white = color(255,255,255,255) ;
 color pWhite = color(200,200,200,100) ;


// Screen Constants - initialised
// in the 'setup' function

int displayWidth,displayHeight ;
String mode ;
float CX,CY ;

PVector [][] flyPath = new PVector[4][4];


// Support functions for Interpolating Colours 

float interpolate(float startValue, float endValue, float nTime) {
  return (endValue - startValue)*nTime +startValue ;
}


color interpolateColour(color startcol, color endcol, float nTime) {
  float rCol = interpolate(red(startcol),red(endcol),nTime) ;
  float gCol = interpolate(green(startcol),green(endcol),nTime) ;
  float bCol = interpolate(blue(startcol),blue(endcol),nTime) ;
  float aCol = interpolate(alpha(startcol),alpha(endcol),nTime) ;
  return color(rCol,gCol,bCol,aCol) ;


}

// Support function 
// which converts Degrees to
// Radians - 
float degreesToRadians(float th)
{
  return PI * th /180.0f ;
}



// Draw a Cubic Bezier Petal from
// four Vector points
void drawPetal(PVector [] cps,color col)
{
  fill(col) ;
  //stroke(0,0,0) ;
  noStroke() ;

  bezier (cps [0].x,cps[0].y,cps[1].x,cps[1].y,cps[2].x,cps[2].y,cps[3].x,cps[3].y) ;
}


void drawPath(PVector [] cps)
{
  noFill() ;
  stroke(0,0,0) ;
  bezier (cps [0].x,cps[0].y,cps[1].x,cps[1].y,cps[2].x,cps[2].y,cps[3].x,cps[3].y) ;
}




PVector [] calcControlPoints(float angle,float ro,float  radius,float tilt,float petalLength)
{

  PVector [] bezControlPoints = new PVector[4] ;

  float halfRo = ro / 2.0f ;

  PVector[] cPoints = calcPetalPointPair(angle- halfRo,tilt,petalLength) ;
  PVector startPt = cPoints[0] ;
  PVector fPoint = cPoints[1] ;


  bezControlPoints[0] = new PVector(startPt.x * radius,startPt.y *  radius) ;
  bezControlPoints[1] = new PVector(startPt.x * radius +  fPoint.x,startPt.y * radius + fPoint.y) ;



  PVector [] cPoints2 = calcPetalPointPair(angle+halfRo,- tilt,petalLength) ;
  startPt = cPoints2[0] ;
  fPoint = cPoints2[1] ;

  bezControlPoints[3] = new PVector(startPt.x * radius,startPt.y *  radius) ;
  bezControlPoints[2] = new PVector(startPt.x * radius +  fPoint.x,startPt.y * radius + fPoint.y) ;


  return bezControlPoints ;

}


// This function calculates the control point line (Pair of 2D Vectors)
// 
PVector[] calcPetalPointPair(float angle,float tilt,float petalLength)
{


  PVector startPt = new PVector(sin(degreesToRadians(angle)),cos(degreesToRadians(angle)));

  PVector vert = new PVector(0,0,1.0f) ;      // Unit Vector Perp  to XY Plane
  PVector nCPc = startPt.cross(vert) ;        // Calculate Tangent to Circle at startPt.x,startPt.y


  PMatrix2D iMat = new PMatrix2D() ;

  iMat.rotate(degreesToRadians(tilt < 0 ? 180+tilt : tilt)) ;    //  Petal Tilt

    PMatrix2D cMat = new PMatrix2D(nCPc.x,startPt.x,0.0f,nCPc.y,startPt.y,0.0f) ;

  // Matrix
  // | nCPc.x  startx |
  // | nCPc.y  starty |


  cMat.preApply(iMat) ;      // Apply our othog axis to the  rotation matrix


  PVector fPoint = new PVector() ;
  PVector sPoint = new PVector(petalLength,0) ;    // Petal Length

  cMat.mult(sPoint,fPoint) ;            // Apply Full transformation to petal Vector

  PVector [] points = new PVector[2] ;
  points[0] = startPt ;
  points[1] = fPoint ;

  return points;

}




// The main part of our program starts
// here - 1st Initialise Font and 
// Parameter values - then
// start the 'draw' loop


void setup()
{

  mode = JAVA2D ;
  // Reset Parameters to Default Values

  tilt = 92.0f ;
  petalLength = 234.0f ; 
  step = 18.0f ; 
  ro = 25.0f ;

  radius = 20.0f ;
  numpetals = 360.0f / step  ;


  try {
    displayHeight = Integer.parseInt(getParameter("height")) ;
    displayWidth = Integer.parseInt(getParameter("width")) ;

  } 
  catch (Exception e){     

    displayHeight = 3*screen.height/4 ;
    displayWidth = 3*screen.width/4 ;
  }

  CX = displayWidth / 2 ;
  CY = displayHeight / 2 ;


  initFlyPath() ;


  size(displayWidth, displayHeight,mode);
  loop() ;

}




void drawFlower(float stemRadius,float stepSize,float numPetals,float roAng,float tiltAng,float thtAng,float petalLen,color col)
{

  //draw circle at 0,0 size stemRadius ;

  fill(stemCol) ;
  ellipseMode(RADIUS) ;
  //stroke(0,0,0) ;
  noStroke() ;

  ellipse(0, 0, stemRadius,stemRadius) ;


  int petalNum = 0 ;

  for (float angle = 0.0f ; angle < stepSize*numPetals ; angle+=stepSize)
  {
    PVector [] cps =  
      calcControlPoints(angle+thtAng,roAng,stemRadius,tiltAng,petalLen) ;

    color endcol = color(blue(col),green(col),red(col),alpha(col)) ;
    color iCol = interpolateColour(col, endcol,petalNum/numPetals) ;

    drawPetal(cps,iCol) ;
    petalNum = petalNum + 1 ;

  }

}

void initFlyPath() 
{
  float flowerRadius = petalLength ;

  flyPath[0][0] = new PVector(flowerRadius/2,0) ;
  flyPath[0][1] = new PVector(-displayWidth/2,-flowerRadius) ;
  flyPath[0][2] = new PVector(displayWidth/2,-flowerRadius) ;
  flyPath[0][3] = new PVector(-flowerRadius/2,0) ;

  flyPath[1][0] = new PVector(-flowerRadius/2,0) ;
  flyPath[1][1] = new PVector(-displayWidth/2,flowerRadius) ;
  flyPath[1][2] = new PVector(-displayWidth/2,-flowerRadius) ;
  flyPath[1][3] = new PVector(-flowerRadius/2,0) ;

  flyPath[2][0] = new PVector(-flowerRadius/2,0) ;
  flyPath[2][1] = new PVector(displayWidth/2,flowerRadius) ;
  flyPath[2][2] = new PVector(-displayWidth/2,flowerRadius) ;
  flyPath[2][3] = new PVector(flowerRadius/2,0) ;


  flyPath[3][0] = new PVector(flowerRadius/2,0) ;
  flyPath[3][1] = new PVector(displayWidth/2,-flowerRadius) ;
  flyPath[3][2] = new PVector(displayWidth/2,flowerRadius) ;
  flyPath[3][3] = new PVector(flowerRadius/2,0) ;



}

void drawFlyPath() 
{
  for(int i = 0 ; i < flyPath.length ; i++) {
    drawPath(flyPath[i]) ;
  }

}


   void drawCircle(float x,float y,float rad,color col)
   {
     fill(col) ;
     ellipseMode(RADIUS) ;
     stroke(0,0,0.40) ;
     ellipse(x, y, rad,rad) ;
   }
   
   void drawEllipse(float x,float y,float a,float b,color col)
   {
     fill(col) ;
     ellipseMode(RADIUS) ;
     stroke(0,0,0.40) ;
     ellipse(x, y, a,b) ;
   }
   


  void drawBee()
  {
    pushMatrix() ;
    float wobbleX = 2 ;
    float wobbleY = 1 ;
    float rx = wobbleX-random(wobbleX*2) ;
    float ry = wobbleY-random(wobbleY*2) ;
    translate(rx,ry) ;
    
    float rnd = random(4) ;
    float wRnd = 4-random(8) ;
    
    float wLen = 20- wRnd;
    float adj = -(28-wLen) ;
    
    drawCircle(0,0,30,black) ;

    pushMatrix() ;
    rotate(-10);
    translate(0,55) ;
    drawEllipse(8+rnd,-6+adj,10,wLen,pWhite) ;
    popMatrix() ;
    
    pushMatrix() ;
    rotate(10);
    translate(0,55) ;
    drawEllipse(-8+rnd,-6+adj,10,wLen,pWhite) ;
    popMatrix() ;
    
    fill(0,0,0);
    
    float x = 2 ;
    float w = 4 ;
    float y = -30 ;
    triangle(-x, y, -x+w, y, -x+w/2, y-10);

    drawCircle(0,0,25,yellow) ;
    drawCircle(0,0,20,black) ;
    drawCircle(0,0,15,yellow) ;
    drawCircle(0,0,10,black) ;

    drawEllipse(-8,-6,8,10,white) ;
    drawEllipse(8,-6,8,10,white) ;

    drawEllipse(-8,-2,2,3,black) ;
    drawEllipse(8,-2,2,3,black) ;
    
    popMatrix() ;
  }
  


void drawFly(float nTime) {

  // decide which section the fly is on - 1st half (nTime < 0.5)
  // he is on flyPath[0]
  // second part - he is flying on flyPath[1]

  PVector []path ;

  int section = Math.min(flyPath.length - 1,(int)(nTime * flyPath.length)) ;  // needed for nTime = 1

  nTime = flyPath.length * (nTime - (section*1.0f/flyPath.length)) ;
  path = flyPath[section] ;

  // Calculate Bezier X,Y position from new Normalised Time
  // and Path defined by Bezier points in array 'path'

  float xPos =  bezierPoint(path[0].x,path[1].x,path[2].x,path[3].x,nTime) ; 
  float yPos =  bezierPoint(path[0].y,path[1].y,path[2].y,path[3].y,nTime) ; 

  // Draw a Simple Bee

  pushMatrix() ;
  translate(xPos,yPos) ;
  drawBee() ;
  popMatrix() ;
  
  

}


float time = 0.0f ;
float flightDuration = 16.0f ;

void draw() {

  smooth() ;
  fill( 255, 200, 255, 255 ) ;
  rect( 0, 0, width, height ) ;

  float dt = 1/frameRate ;    // We should calculate dt - time  passed since last update-draw


  time = time + dt ;

  while (time > flightDuration) {
    time = time - flightDuration ;
  }


  pushMatrix() ;
  translate(CX, CY) ;
  drawFlower(radius,step,numpetals,ro,tilt,tht,petalLength,flowerCol) ;
  drawFlower(radius,720.0f/numpetals,numpetals/2,ro,tilt,-tht+20.0,petalLength/4,petalCol) ;

  drawFly(time/flightDuration) ;
  //tht = tht + 10*dt ;
  if (bDrawPath) {
    drawFlyPath() ;
  }

  popMatrix() ;


}

void keyPressed() 
{
  if ((key == 'p') || ( key == 'P')) {
    bDrawPath = !bDrawPath ;
  } 

}




