
//controls
int iWidth, iHeight;        //controls the canvas size
color cBg, cLine;           //controls the colour scheme
int iElements;              //controls how many elements there are
int iMinR, iMaxR;           //controls the radii limits of Element0s
int iMinS, iMaxS;           //controls the speed limits of Element0s
boolean bShowConstruction;  //show/hide construction elements

//infrastructure
Element0[] aElements;

//initilise
void setup() {
  //controls
  iWidth = 500;
  iHeight = 500;
  cBg = color(0);
  cLine = color(255);
  iElements = 15;
  iMinR = 20;
  iMaxR = 50;
  iMinS = 2;
  iMaxS = 5;
  bShowConstruction = false;
  
  //create screen
  size(500,500);//iWidth, iHeight);
  
  //setup drawing
  background(cBg);
  stroke(cLine,30);
  noFill();
  
  //initilise array
  aElements = new Element0[iElements];
  for(int i=0;i<iElements;i++) {
    float r = random(iMinR,iMaxR);
    float theta = random(0,TWO_PI);
    float s = random(iMinS,iMaxS);
    aElements[i] = new Element0(random(r,iWidth-r),random(r,iHeight-r),r,s*sin(theta),s*cos(theta));
  }
}

//logic
void draw() {
  if(bShowConstruction)
    background(cBg);
  
  //update element behaviour
  for(int i=0;i<iElements;i++)
    aElements[i].move();
  
  //run process
  for(int i=0;i<iElements;i++)
    for(int j=i+1;j<iElements;j++)
      if(dist(aElements[i].iX,aElements[i].iY,aElements[j].iX,aElements[j].iY)<aElements[i].iR+aElements[j].iR)
        line(aElements[i].iX,aElements[i].iY,aElements[j].iX,aElements[j].iY);
}

//element class
class Element0 {
  //attributes
  float iX,iY, iR, iDX, iDY;
  
  //constructor
  Element0(float x, float y, float r, float dx, float dy) {
    iX = x;
    iY = y;
    iR = r;
    iDX = dx;
    iDY = dy;
  }
  
  //methods
  void move() {
    //move
    iX+=iDX;
    iY+=iDY;
    
    //bounce off walls
    if((iX-iR<=0)||(iX+iR>=width)) iDX *=-1;
    if((iY-iR<=0)||(iY+iR>=height)) iDY *=-1;
    
    //draw construciton
    if(bShowConstruction) {
      ellipse(iX,iY,2*iR,2*iR);
      point(iX,iY);
    }
  }
}


