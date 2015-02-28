
// Rotation of items at 137.5 degrees
// Golden Rectangle sized canvass, naturally.
float phi=1.6180339;
float  dimX=600,dimY=dimX/phi; 
color[] phicolors = new color[8];
int cnum=0;  
float xPos=0;
int yPos=0;
int numDots=0;
int numCircles=3;
circle[] circles=new circle[numCircles];
int maxDots=1800; 
float redAmt, greenAmt, blueAmt;
color mColor;
int j=0;
float range=12;
float radius=8;
boolean circleMode = true; 
boolean varySat =true;
boolean varyBright = true; 
boolean varyHue=true;
boolean paintMode = false; 
color cColor;
float interval=31;
int movement=2;
      
void setup(){
  size(int(dimX),int(dimY),JAVA2D);
  smooth();
  background(255);
  // Gets a random color and two accents based on phi
  cColor=color(255,100,100,255);
   circles[0]=new circle(dimX/3,dimY/2,maxDots,radius,range);
   circles[1]=new circle(dimX/3,dimY/2,maxDots,radius,range);
   circles[2]=new circle(dimX/2,dimY/2,maxDots,radius,range);
}

void draw(){
 if (!paintMode) {
    fill(360,0,0,55);
    stroke(360,0,0,155);
    rect(0,0,dimX,dimY);
  }
   circles[0]=new circle(xPos,dimY/2,maxDots,radius,range);
   circles[1]=new circle(dimX-xPos,dimY/2,maxDots,radius,range);
  xPos=xPos+movement;
  if (xPos>dimX){
    movement*=-1;
  }
    if (xPos<1){
    movement*=-1;
  }
  // circles[2]=new circle(dimX/2,dimY/2,maxDots,radius*2,range);
 //
 for(j=0;j<numCircles;j++){
    //print ("j:"+j);
    //print ("numcircls"+numCircles);
    //drawGrid(
    if (circles[j]!=null){
      circles[j].draw();
   }
  
 }
}

class circle{
// Each circle has its own dots;
float x, y,  radius, range,sAngle;
int numDots=0,j,i;
float xPos,yPos;
Dot[] dots = new Dot[maxDots];

  circle(float sX, float sY, int inNumDots, float inRadius, float inRange ){
    x=sX;
    y=sY;
    maxDots=inNumDots;
    radius=inRadius;
    range=inRange;
    // 10 small circles
    for ( i=0;i<25;i++){
      range+=radius;
        for (sAngle=0;sAngle<360;sAngle+=(360/((maxDots/25)-1))) {
          xPos=cos(radians(sAngle));
          yPos=sin(radians(sAngle));
          dots[numDots]=new Dot(sX+(range*xPos),sY+(range*yPos),inRange,6,2000,radius); 
          numDots++;  
        }
      }
  }
  
  void draw(){
    //print (dots);
    for(j=0;j<maxDots;j++){
      //print ("drawing: "+j+"\n");
      this.dots[j].draw();
    }
 }
}
  

class Dot{
  float x,y,sX,sY; 
  float radius;
  float lifeTime;
  float accelerator; 
  float range; 
  int age=0; 
  float px,py;
 
  boolean setDeathVars=false; 
  int index=0;
  float deathThrowes = .01; 
  Dot(float startX, float startY, float sRange, float sAccel, int sLT, float sRadius){
    age=0;
    sX=x=startX;
    sY=y=startY; 
    px=x;
    py=y;
    range=sRange;
    accelerator=sAccel;
    lifeTime=sLT;
    radius=sRadius;
    index=numDots;
  } 
    void draw(){
    int cNum;
    float tRange;
    if (age<=lifeTime){
       age++;
       if (age<=lifeTime*deathThrowes){
          tRange=interval*(age/lifeTime)*20+1;
       }
       else {
         tRange=interval*(age/lifeTime)*20+1;
       }
    // x=sX+(random(tRange)-tRange/2);
     //y=sY+(random(tRange)-tRange/2); 
     cColor=nextColor(cColor); 
     fill(cColor);     
     strokeWeight(0);
     ellipse(x,y,radius,radius);  
     
     px=x; 
     py=y;
  }
  else {
    numDots--;
  }
  }
}

void mouseMoved(){
  float sAngle=0;
  float xPos,yPos;
  radius=mouseX/10+4;
 float range=mouseY/10+1;

  interval=mouseY/10;
 // radius=mouseX/3;
}

void mouseClicked(){
  radius=int(mouseX/40)+2;
  range=int(mouseY/3)+1;
  int i,k;
   circles[0]=new circle(dimX/3*2,dimY/2,maxDots,radius,range);
   circles[1]=new circle(dimX/3,dimY/2,maxDots,radius,range);   
   circles[2]=new circle(dimX/2,dimY/2,maxDots,radius,range);
  print ("\nradius:"+radius+" range"+range+" interval"+interval);
}


void keyPressed() {
  if (key == 'o') {
    // pressing s will take a picture.  Won't work on JS version.
    saveFrame("output##.png");
  }
  if (key == 'i') {
    // pressing s will take a picture.  Won't work on JS version.
     print ("\nradius:"+radius+" range"+range+" interval"+interval);
  }
  if (key == 'c') {
     //circleMode=true;
     getColors();
  }
  if (key == 'r') { // reset
    background(255);
  }
  if (key == 'h') { // reset
    varyHue=!varyHue;
  }
  if (key == 's') { // reset
    varySat=!varySat;
  }
  if (key == 'b') { // reset
    varyBright=!varyBright;
  }
  if (key== 'p') { // paintmode;
    paintMode=!paintMode;
  }
}

color nextColor(color cColor){
  color nextColor;
  float sHue, sSat,sBright;
  colorMode(HSB,360,100,100);
  sHue=hue(cColor);
  sSat=saturation(cColor);
  sBright=brightness(cColor);
  
   
  if (varyHue){
     sHue=(sHue+interval)%360;
  }
  if (varySat){
     sSat=(sSat+interval)%100;
  }
  else {
  	sSat=100;
  }
  if (varyBright){
     sBright=(sBright+interval)%100;
  }
  else {
  	sBright=100;
  }
  nextColor=color(sHue,sSat,sBright);
  return nextColor;
  
}

void getColors(){
  cColor=color(random(360),random(100),random(100));
  print ("color:"+cColor);
}

