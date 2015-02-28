
/*Draws a clock on screen just with seconds. The clock is not coded
 by using rotate command. I determine the points on circle and
 make the seconds move point by point at each second, the numbers on the clock every N with a numTextSeq variable */


/*****************VARIABLES**********************/
/*These are to determine the output window size.*/
int winWidth = 600;
int winHeight = 600;
float midScreenX = winWidth/2;
float midScreenY = winHeight/2;

float backR = random(50,100);
float backG = random(50,100);
float backB = random(50,100);

/* dividementValue is to show how many pieces the clock circle will be diveded.
 shownTextNumSeq is the increment of the num on clock. tsize is the size of Num.*/
float totalSeconds = 60;
float totalNums = totalSeconds;
float NumSeqOnClock = 5;
float tSize = 20; 

/*there will be three circles, one is visible, which the clock will be drawn on.
 others are guiding the place where nums will be put and sec will be moved on.*/
float clockRadius = 200;  
float secCircRad = clockRadius*(0.66);  
float numCircRad = clockRadius*(0.80) + tSize; 

/*Initial Point coord of Second Lines and Nums.*/
float secEdgeX = winWidth/2;
float secEdgeY = (winHeight/2 - secCircRad);
float textPointX = winWidth/2;
float textPointY = (winHeight/2 - numCircRad);

/*secEdgeAng is the the angle between First Sec Line with X axis.*/
float secEdgeAng = (PI/180)*(360/totalSeconds)*(0.5);
float angBtwSecLin = (PI/180)*(360/totalSeconds);

/*ptsAng is the the angle between the first line,that is drawn from center of 
clock to the first number's placement point and X axis.*/
float ptsAng = (PI/180)*(360/totalNums)*(0.5);
float angBtwNumPts = (PI/180)*(360/(totalNums));






void setup() {
  background(backR, backG, backB);
  size(600, 600);
  smooth();
  frameRate(1);
}

void draw() {
  background(backR, backG, backB);
  drawClock();
  drawSeconds();
}

/***DRAWCLOCK() AND SUB-FUNCTIONS****/
void drawClock() {
  
  drawClockCircle();
  putMiddleACircle();
  writeClockLabel();
  writeNumsOnClock();
}

void drawClockCircle() {
  
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(midScreenX, midScreenY, 2*clockRadius, 2*clockRadius);
}  

void putMiddleACircle() {
  fill(0, 255, 0);
  ellipse(midScreenX, midScreenY, 10, 10);
  
}

void writeClockLabel() {
  textSize(tSize);
  textAlign(CENTER, CENTER);
  fill(255);

  text("Ozan", midScreenX, midScreenY+clockRadius*(0.15));
}


void writeNumsOnClock() {  

  textSize(tSize);
  fill(125);
  textAlign(CENTER, CENTER);

  resetPtsAng();

  for (int i=0; i<totalNums; i++) {
    writeNum(i);
    calcNextNumCoord();
    calcPtsAng();
  }
}

/*This is to reset the PtsAng value to its initial value each frame*/
void resetPtsAng() {
  ptsAng = (PI/180)*(360/(totalNums))*(0.5);
}

void writeNum(int x) {
  /*NumSeqOnClock value is the increment in Number Series.  
  if num is divided to that increment, then the num is a multiple 
  of the increment*/
  if (x % NumSeqOnClock == 0) {
    text(x, textPointX, textPointY);
  }
}

/*function calculates the point's coordinates where the text which shows the 
number will be placed.*/
void calcNextNumCoord() {
  
  /*This Lenght is the distance between two edge points of text Points on textCircle.
   cosinus formula is used to determine the lenght of lenBtwNumPts labeled Edge in the 
   constituted triangle */
  float lenBtwNumPts = sqrt(2*numCircRad*numCircRad*(1-cos(angBtwNumPts)));

  textPointX = textPointX + lenBtwNumPts*cos(ptsAng);
  textPointY = textPointY + lenBtwNumPts*sin(ptsAng);
}

/*Calculates the angle between the line from center of clock to 
Num points and a line drawn on that num point that is parelel to X axis*/
void calcPtsAng() {
  ptsAng = ptsAng + angBtwNumPts;
}

/***DRAWSECONDS() AND SUB-FUNCTIONS****/
void drawSeconds() {
  drawSecLine();
  calcNextSecEdge();
  calcSecEdgeAng(); 
}

void drawSecLine() {
  stroke(125);
  strokeWeight(2);
  line(midScreenX, midScreenY, secEdgeX, secEdgeY);
}

/*Calculates the next seconds line's far Edge coordinates.*/
void calcNextSecEdge() {
  /*lenBtwSecEdges shows the len between two sequence seconds' Edge points */
  float lenBtwSecEdges = sqrt(2*secCircRad*secCircRad*(1-cos(angBtwSecLin)));

  secEdgeX = secEdgeX + lenBtwSecEdges*cos(secEdgeAng);
  secEdgeY = secEdgeY + lenBtwSecEdges*sin(secEdgeAng);
}

/*Calculates the angle between SecondsLine edge and a line drawn on that point
that is parelel to X axis*/
void calcSecEdgeAng() {
  secEdgeAng = secEdgeAng + angBtwSecLin;
}




