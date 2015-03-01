
/*
 *
 * A forest clock
 *   to test press + then  h / m / s increment h/m/s respectively
 *   - exit test mode
 *   left / right arrows to change orientation
 *      Copyright (c) 2014 Paul Smith
 *
 * starting with:
 *
 *   Creative Coding
 *   Week 5, 02 - Digital Clock
 *   by Indae Hwang and Jon McCormack
 *       Copyright (c) 2014 Monash University
 *
 * timeToSeconds based on code provided by Pierre Marzin
 *
 */

import java.util.*;

char  selected;  // what is selected (h,m,s)
int   gap;       // gap between digits
int   csHour=0;



boolean useSysTime=true;
int   manHour, manMinute, manSecond;
int   sunRise, sunSet, moonRise, moonSet;
float sunAngle, moonAngle, forestAngle;

boolean hourOn=true;
float viewAngle=90.0;
float viewStep=5.0;

forest clockForest;
clock  forestClock;

color bgColour;

int H=0, S=1, B=2, D=3;

float[] dayBG;
float[] nightBG;
float[] moonlightBG;

float nowTreeH;
float nowTreeS;
float nowTreeB;
float nowTreeD;


float[] dayTree;
float[] nightTree;
float[] moonlightTree;

float nowShadowH;
float nowShadowS;
float nowShadowB;
float nowShadowD;

float[] dayShadow;
float[] nightShadow;
float[] moonlightShadow;


void setup() {
  size(1024, 600);
  colorMode(HSB,360,100,100);


  //times in 24 hr
  sunRise=730;
  sunSet=1700; 
  moonRise=1930;
  moonSet=500;
  
  //total angles in degs- could work out from elevation at zenith
  sunAngle=160;
  moonAngle=100;
  forestAngle=90;

  selected = '0';
  gap = 300;
  //noStroke();
  int maxTrees=6;


  //initialise the colours
  
  dayBG= new float[3]; 
  nightBG= new float[3];
  moonlightBG= new float[3];

  dayTree= new float[4];
  nightTree= new float[4];
  moonlightTree= new float[4];

  dayShadow= new float[4];
  nightShadow= new float[4];
  moonlightShadow= new float[4];

  //dayBackground
  dayBG[H]=360.00;
  dayBG[S]=0.00;
  dayBG[B]=100.00;

  //night Background  
  nightBG[H]=360.00;
  nightBG[S]=0.00;
  nightBG[B]=5.00;
  
  //mmonlight Background  
  moonlightBG[H]=360.00;
  moonlightBG[S]=0.00;
  moonlightBG[B]=10.00;
  
  //dayTree and Shadow
  dayTree[H]=240.00;
  dayTree[S]=50.00;
  dayTree[B]=40.00;
  dayTree[D]=80.00;
  
  
  dayShadow[H]=240.00;
  dayShadow[S]=20.00;
  dayShadow[B]=50.00;
  dayShadow[D]=80.00;

  
  //night Tree and Shadow  
  nightTree[H]=260.00;
  nightTree[S]=0.00;
  nightTree[B]=10.00;
  nightTree[D]=10.00;
  
  
  nightShadow[H]=260.00;
  nightShadow[S]=0.00;
  nightShadow[B]=2.00;
  nightShadow[D]=2.00;

  
  //moonlight Tree and Shadow  
  moonlightTree[H]=360.00;
  moonlightTree[S]=0.00;
  moonlightTree[B]=20.00;
  moonlightTree[D]=10.00;


  moonlightShadow[H]=360.00;
  moonlightShadow[S]=0.00;
  moonlightShadow[B]=5.00;
  moonlightShadow[D]=5.00;

  nowTreeH=dayTree[H];
  nowTreeS=dayTree[S];
  nowTreeB=dayTree[B];
  nowTreeD=dayTree[D];
  
  nowShadowH=dayShadow[H];
  nowShadowH=dayShadow[S];
  nowShadowH=dayShadow[B];
  nowShadowH=dayShadow[D];

  setColoursB("Daylight");

  clockForest = new forest(width/4,3*height/4,width/2,2*height/3,.66,1+int(random(maxTrees)),60,radians(forestAngle),4*height/3,60);

  forestClock = new clock();  
}


void draw() {
  background(bgColour);
  
  
  if (useSysTime) forestClock.systemTime();
  else            forestClock.setTime(manHour,manMinute,manSecond);
  
  calculateShadows(forestClock.clockHour, forestClock.clockMinute, forestClock.clockSecond, sunRise, sunSet, sunAngle, moonRise, moonSet, moonAngle);
  calculateColours(forestClock.clockHour, forestClock.clockMinute, forestClock.clockSecond, sunRise, sunSet, moonRise, moonSet);
  
  clockForest.recolourForest(nowTreeH,nowTreeS,nowTreeB, nowTreeD);
  clockForest.recolourShadows(nowShadowH,nowShadowS,nowShadowB,nowShadowD);
  
  clockForest.display();
  
  if (useSysTime) forestClock.display();
  else forestClock.displayTime(manHour,manMinute,manSecond);
  
}


void calculateShadows(int csHour, int csMinute, int csSecond, int csSunRise, int csSunSet, float csSunAngle, int csMoonRise, int csMoonSet, float csMoonAngle){
  int thisMinute;
  int sunPeriod=getPeriodB(csSunRise,0, csSunSet,0);
  int moonPeriod=getPeriodB(csMoonRise,0, csMoonSet,0);
  float angleOffset=0.0, shigh=0.0;

  //convert to 24h
  int csMinuteTime=(csHour*100)+csMinute;
  
  if (isTimeBetween(csSunRise, csSunSet, csMinuteTime, csSecond)>0) {
    //thisMinute=getPeriod(csSunRise,csMinuteTime);
    thisMinute=getPeriodB(csSunRise,0,csMinuteTime,csSecond);
    
    angleOffset=((180-csSunAngle)/2)+csSunAngle*float(thisMinute)/sunPeriod;
    if (thisMinute <= sunPeriod/2) shigh = ((4*height/3) - (thisMinute * ((4*height/3)- (height/2))/(sunPeriod/2)));
    else shigh = ((height/2) + ((thisMinute-sunPeriod/2) * ((4*height/3)- (height/2))/(sunPeriod/2)));
  } 
  else if (isTimeBetween(csMoonRise, csMoonSet, csMinuteTime, csSecond)>0) {
    //thisMinute=getPeriod(csMoonRise,csMinuteTime);    
    thisMinute=getPeriodB(csMoonRise,0,csMinuteTime,csSecond);
    
    angleOffset=((180-csMoonAngle)/2)+csMoonAngle*float(thisMinute)/moonPeriod;
    if (thisMinute <= moonPeriod/2) shigh = ((4*height/3) - (thisMinute * ((4*height/3)- (height/2))/(moonPeriod/2)));
    else shigh = ((height/2) + ((thisMinute-moonPeriod/2) * ((4*height/3)- (height/2))/(moonPeriod/2)));
  }
  
  clockForest.regrowShadows(radians(viewAngle+angleOffset),shigh);   
        
}



void calculateColours(int csHour, int csMinute, int csSecond, int csSunRise, int csSunSet, int csMoonRise, int csMoonSet){
  int thisMinute, csMinuteTime;
  int dawnTime, duskTime, moondawnTime, moonduskTime;
  
  String csSecondTime;
  
  //convert to 24h
  csMinuteTime=(csHour*100)+csMinute;
  csSecondTime = stringTime(csMinuteTime,csSecond);

  dawnTime=fixOver(csSunRise,-200);
  duskTime=fixOver(csSunSet,-100);
  moondawnTime=fixOver(csMoonRise,-30);
  moonduskTime=fixOver(csMoonSet,-30);
  
  if (isTimeBetween(dawnTime, csSunRise, csMinuteTime, csSecond)>0) {
    setColoursA("dawn",dawnTime, csSunRise, csMinuteTime, csSecond);
    return;  
  } 

  
  if (isTimeBetween(csSunRise, duskTime, csMinuteTime, csSecond)>0) {
    setColoursB("daylight");
    return;  
  } 
  
  if (isTimeBetween(duskTime, csSunSet, csMinuteTime, csSecond)>0) {
    setColoursA("dusk",duskTime, csSunSet, csMinuteTime, csSecond);
    return;  
  } 
  
  if (isTimeBetween(csSunSet, moondawnTime,  csMinuteTime, csSecond)>0) {
    setColoursB("night");
    return;  
  } 
  
  if (isTimeBetween(moondawnTime, csMoonRise, csMinuteTime, csSecond)>0) {
    setColoursA("moondawn",moondawnTime, csMoonRise, csMinuteTime, csSecond);
    return;  
  } 
  
  if (isTimeBetween(csMoonRise, moonduskTime,  csMinuteTime, csSecond)>0) {
    setColoursB("moonlight");
    return; 
  }        
  
  if (isTimeBetween(moonduskTime, csMoonSet,  csMinuteTime, csSecond)>0) {
    setColoursA("moondusk",moonduskTime, csMoonSet, csMinuteTime, csSecond);
    return;  
  } 
  
  if (isTimeBetween(csMoonSet, csSunRise,  csMinuteTime, csSecond)>0) {
    setColoursB("night");
    return;  
  } 
  
}


int fixOver(int foTime, int foMod){
  int foMin = foTime%100;
  int foHour= foTime - foMin;
  
  int foModMin = foMod%100;
  int foModHour = foMod-foModMin;
  
  int resMin=0, resHour=0, resVal=0;
  
  if (foMod<0) {
    if ((foMin+foModMin)<0) {
      resMin = 60+(foMin+foModMin);
      resHour = foHour + foModHour - 100;
    } else {
      resMin = foMin+foModMin;
      resHour = foHour + foModHour;
    }
  }
  else {
    if ((foMin+foModMin)>60) {
      resMin = (foMin+foModMin)-60;
      resHour = foHour + foModHour + 100;
    } else {
      resMin = foMin+foModMin;
      resHour = foHour + foModHour;
    }
  }
  
  resVal=resHour+resMin;
  
  return resVal;
}
    

void setColoursA(String scTOD, int scStartTime, int scEndTime, int scNowMin, int scNowSec ) {
  //println("a: " + scTOD);
  int totalPeriod, remainPeriod;
  
  totalPeriod=getPeriodA(scStartTime, scEndTime);
  remainPeriod=getPeriodB(scNowMin, scNowSec, scEndTime, 0);
  
  float[] startBG = new float[3];
  float[] endBG = new float[3];
  float[] startTree = new float[4];
  float[] endTree = new float[4];
  float[] startShadow = new float[4];
  float[] endShadow = new float[4];
  
  //dawn/dusk/moondawn/moondusk
  //we should cater for overlaps in day/moon but - later
  //defaults  
  startBG=dayBG;
  endBG=nightBG;
  
  startTree=dayTree;
  endTree=nightTree;
  
  startShadow=dayShadow;
  endShadow=nightShadow;
  
  
  if (scTOD=="dawn"){
    startBG=nightBG;
    endBG=dayBG;
    
    startTree=nightTree;
    endTree=dayTree;
    
    startShadow=nightShadow;
    endShadow=dayShadow;
  }
  if (scTOD=="dusk"){
    startBG=dayBG;
    endBG=nightBG;
    
    startTree=dayTree;
    endTree=nightTree;
    
    startShadow=dayShadow;
    endShadow=nightShadow;
  }
  if (scTOD=="moondawn"){
    startBG=nightBG;
    endBG=moonlightBG;
    
    startTree=nightTree;
    endTree=moonlightTree;
    
    startShadow=nightShadow;
    endShadow=moonlightShadow;
  }
  if (scTOD=="moondusk"){
    startBG=moonlightBG;
    endBG=nightBG;
    
    startTree=moonlightTree;
    endTree=nightTree;
    
    startShadow=moonlightShadow;
    endShadow=nightShadow;
  }

  float thisH, thisS, thisB;
  int elapsedPeriod = (totalPeriod-remainPeriod);
  
  
  //thisH=startBG[H]+(zero360(endBG[H]-startBG[H])/float(totalPeriod))*float(elapsedPeriod);
  thisH=manLerp(startBG[H],endBG[H],float(totalPeriod),float(elapsedPeriod),360.00);
  thisS=manLerp(startBG[S],endBG[S],float(totalPeriod),float(elapsedPeriod),100.00);
  thisB=manLerp(startBG[B],endBG[B],float(totalPeriod),float(elapsedPeriod),100.00);
  if ((thisH>=0.0) && (thisH<=360)) bgColour=color(thisH,thisS,thisB);
  
  nowTreeH=manLerp(startTree[H],endTree[H],float(totalPeriod),float(elapsedPeriod),360.00);
  nowTreeS=manLerp(startTree[S],endTree[S],float(totalPeriod),float(elapsedPeriod),100.00);
  nowTreeB=manLerp(startTree[B],endTree[B],float(totalPeriod),float(elapsedPeriod),100.00);
  nowTreeD=manLerp(startTree[D],endTree[D],float(totalPeriod),float(elapsedPeriod),100.00);
  
  nowShadowH=manLerp(startShadow[H],endShadow[H],float(totalPeriod),float(elapsedPeriod),360.00);
  nowShadowH=manLerp(startShadow[S],endShadow[S],float(totalPeriod),float(elapsedPeriod),100.00);
  nowShadowH=manLerp(startShadow[B],endShadow[B],float(totalPeriod),float(elapsedPeriod),100.00);
  nowShadowH=manLerp(startShadow[D],endShadow[D],float(totalPeriod),float(elapsedPeriod),100.00);    
  
}


float manLerp (float baseVal, float endVal, float tPeriod, float ePeriod, float maxVal) {
  float retVal;
  float numVal;
  
  numVal = ((endVal - baseVal)==0) ? 1 : (endVal - baseVal);
  
  retVal=baseVal+((numVal/tPeriod)*ePeriod);
  
  retVal = (retVal>maxVal) ? (retVal - maxVal) : retVal;
  return retVal;
}  
  


float zero360(float rVal) {
  if (rVal == 0) return 1;
  else return rVal;
}

float zero1(float rVal) {
  if (rVal == 0) return 1.00;
  else return rVal;
}

void setColoursB(String scTOD) {
  //println("b: " +scTOD);
  
  if (scTOD=="moonlight") {
    bgColour=color(moonlightBG[H],moonlightBG[S],moonlightBG[B]);

    setNowTree(moonlightTree);
    setNowShadow(moonlightShadow);    
    return;
  }
  if (scTOD=="night") {
    bgColour=color(nightBG[H],nightBG[S],nightBG[B]);
    setNowTree(nightTree);
    setNowShadow(nightShadow);
    return;
  }
  //here set default colours
  bgColour=color(dayBG[H],dayBG[S],dayBG[B]);
  setNowTree(dayTree);
  setNowShadow(dayShadow);
}


void setNowTree(float[] setArr) {
  nowTreeH=setArr[H];
  nowTreeS=setArr[S];
  nowTreeB=setArr[B];
  nowTreeD=setArr[D];
}
    
void setNowShadow(float[] setArr) {
  nowShadowH=setArr[H];
  nowShadowS=setArr[S];
  nowShadowB=setArr[B];
  nowShadowD=setArr[D];
}
    
  

String stringTime(int stTime){
  String stHour = "" + int(stTime/100);
  String stMinute= "0"+ stTime%100;
  stMinute = stMinute.substring(stMinute.length()-2);
  return (stHour + ":" + stMinute + ":00");
}

String stringTime(int stTime, int stSec){
  String stHour = "" + int(stTime/100);
  String stMinute= "0"+ stTime%100;
  stMinute = stMinute.substring(stMinute.length()-2);
  String stSeconds ="0"+ stSec;
  stSeconds = stSeconds.substring(stSeconds.length()-2);
  
  return (stHour + ":" + stMinute + ":" + stSeconds);
}



//timeToSeconds based on code provided by Pierre Marzin
double timeToSeconds(int _day,int _hour,int _minute,int _second){
  double sec = (_day * 24*3600) + (_hour * 3600) + (_minute * 60)  +_second;

  return sec;
}



int isTimeBetween(int startTime, int endTime, int checkMinute, int checkSeconds){
  int thisMin, thisHr;
  
  thisMin=startTime%100;
  thisHr=(startTime-thisMin)/100;
  double startEnt = timeToSeconds(1,thisHr,thisMin,0);
  
  thisMin=endTime%100;
  thisHr=(endTime-thisMin)/100;
  double endEnt = timeToSeconds(1,thisHr,thisMin,0);
  endEnt = (endEnt<startEnt) ? timeToSeconds(2,thisHr,thisMin,0) : endEnt;  
  
  thisMin=checkMinute%100;
  thisHr=(checkMinute-thisMin)/100;
  double checkEnt = timeToSeconds(1,thisHr,thisMin,0);
  checkEnt = (checkEnt<startEnt) ? timeToSeconds(2,thisHr,thisMin,0) : checkEnt;  
    
  if ((startEnt<checkEnt) && (checkEnt<endEnt)) {
    int timeDiff = (int) (checkEnt-startEnt); 
    return timeDiff;
  }
  else return 0;
  
}


int getPeriodA(int startTime, int endTime){
  int thisMin, thisHr;
  
  thisMin=startTime%100;
  thisHr=(startTime-thisMin)/100;
  double startEnt = timeToSeconds(1,thisHr,thisMin,0);
  
  thisMin=endTime%100;
  thisHr=(endTime-thisMin)/100;
  double endEnt = timeToSeconds(1,thisHr,thisMin,0);
  endEnt = (endEnt<startEnt) ? timeToSeconds(2,thisHr,thisMin,0) : endEnt;  
  
  if (startEnt<endEnt) {
    int timeDiff = (int) (endEnt-startEnt); 
    return timeDiff;
  }
  else return 0;
}


int getPeriodB(int startTime, int startSec, int endTime, int endSec){
  int thisMin, thisHr;
  
  thisMin=startTime%100;
  thisHr=(startTime-thisMin)/100;
  double startEnt = timeToSeconds(1,thisHr,thisMin,startSec);
  
  thisMin=endTime%100;
  thisHr=(endTime-thisMin)/100;
  double endEnt = timeToSeconds(1,thisHr,thisMin,0);
  endEnt = (endEnt<startEnt) ? timeToSeconds(2,thisHr,thisMin,endSec) : endEnt;  
  
  if (startEnt<endEnt) {
    int timeDiff = (int) (endEnt-startEnt); 
    return timeDiff;
  }
  else return 0;
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      viewAngle=viewAngle+viewStep;
      if (viewAngle>=360) viewAngle=0;
      
    } else if (keyCode == LEFT) {
      viewAngle=viewAngle-viewStep;
      if (viewAngle<=0) viewAngle=360;      
    } 
  }
  
  if (key == '+') useSysTime=false;
  if (key == '-') useSysTime=true;
  
  if ((!useSysTime) && (key=='H' || key=='h')) manHour++;    
  if ((!useSysTime) && (key=='M' || key=='m')) manMinute++;
  if ((!useSysTime) && (key=='S' || key=='s')) manSecond++;
  
  checkManTime();
}


void checkManTime(){
  if (manSecond>59) {
    manMinute++;
    manSecond=0;
  }
  if (manMinute>59) {
    manHour++;
    manMinute=0;
  }
  if (manHour>23) manHour=0;
}    

void mouseReleased() {
  clockForest.regrowForest();
}



import java.text.*;


class clock {
  PFont clockFont;    // font data
  int clockHour, clockMinute, clockSecond;
  
  clock (){
    this.clockFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
    textFont(clockFont);  // set the current font to myFont
  }
  
  //display the current time
  void displayCurrentTime() {
    systemTime();
    display();
  }
  
  
  void display(){
    displayTime(this.clockHour, this.clockMinute, this.clockSecond);
  }
  

  //set the clock time to the system time
  void setTime(int stHour, int stMinute, int stSecond) {
    this.clockHour = stHour;
    this.clockMinute = stMinute;
    this.clockSecond= stSecond;
  }


  //set the clock time to the system time
  void systemTime() {
    this.clockHour = hour();
    this.clockMinute = minute();
    this.clockSecond= second();
  }
  
  //display time passed
  void displayTime(int dHour, int dMinute, int dSecond) {
    fill(360,100,40);
    // draw h, m, s
    
    String stMinute= "0"+ dMinute;
    stMinute = stMinute.substring(stMinute.length()-2);
    
    String stSecond= "0"+ dSecond;
    stSecond = stSecond.substring(stSecond.length()-2);
    
    String thisTime = dHour + " : " + stMinute + " : " + stSecond;
    drawNumber(thisTime,0.0,0.0); 
  }

  /*
   * drawNumber
   * takes an integer and draws it offset from the centre of the screen by
   * offsetX and offsetY. If big is true then use a big size for the type.
   *
  */
  void drawNumber(String theTime, float offsetX, float offsetY) {
    textSize(50);  // normal font size

    //float textWidth = textWidth(theTime) * 0.5;
    
    //float textAscent = textAscent() * 0.375;   //java
    //float textAscent = 10 * 0.375;   //js

    // draw text offset from the centre of the screen
    //text(theText, width/2 - textWidth + offsetX, height/2 + textAscent + offsetY);
    //float xpos = (width - theTime.length())/2;
    //println(width+ " " + theTime.length + " " + xpos);
    
    float xpos=width-400;
    text(theTime, xpos + offsetX, height-50 + offsetY);
  }
}



//for java only
//import java.util.Collections;

/*
  a forest is collection of trees
  parameters are:
    x          xValue
    ground     yvalue
    width      pixel
    height     pixels
    horizon    ratio
    number     of trees
    colour     (HSB)     
*/    
  

class forest {
  float forestGround, forestHorizon, forestX, forestWidth, forestHeight, forestColour;
  float forestShadowAngle, forestShadowLength, forestShadowColour;
  String forestSort;
  int treeCount;
  
  ArrayList<tree> forestTrees;
  ArrayList<tree> sortedTrees;


  forest (float fX, float fGround, int fWide, int fHigh, float fHorizon, int fTrees, float fColour, float fShadowAngle, float fShadowLength, float fShadowColour) {
    this.forestX=fX;
    this.forestGround=fGround;
    this.forestWidth=fWide;
    this.forestHeight=fHigh;
    this.forestHorizon=fHorizon;
    this.treeCount=fTrees;
    this.forestColour=fColour;
    this.forestShadowAngle=fShadowAngle;
    this.forestShadowLength=fShadowLength;
    this.forestShadowColour=fShadowColour;
    this.forestSort="asc";
    
    forestTrees = new ArrayList<tree>();
    sortedTrees = new ArrayList<tree>();
    
    growForest();
  }

  void growForest() {
    //the forest has a random number of trees (defined by the length of the array)
    //    the y offset of the trees is the distance from the front
    //    the width, height and lightness of tree should be adjusted accordingly
    Random randomno = new Random();
    
    for (int i = 0; i < this.treeCount; i ++ ) {
      float xpos=random(forestX,forestX+forestWidth);
      float tHeight = abs(2*forestHeight/3 + ((float) randomno.nextGaussian() * 100));
      float ypos = forestGround-(forestHorizon*(forestHeight-tHeight));
      //shorten shadows at the rear
      float tShadowLength=forestShadowLength*tHeight/forestHeight;
      
      float tBright = abs(100-(33+(tHeight*66/forestHeight)));
      //float tBright = 0;
      float tStroke = 10 * (tHeight/forestHeight);
      
      forestTrees.add(new tree(xpos,ypos,tHeight,forestColour,0,tBright,tStroke,forestShadowAngle,tShadowLength,forestShadowColour,0,tBright));
    }
  }
  
  void regrowForest(){
    int rgTrees = forestTrees.size();
    
    for (int i = 0; i < rgTrees; i ++ ) {
     forestTrees.remove(0);
    }
    growForest();
  }   
 
  void recolourForest(float rcH, float rcS, float rcB, float rcD) {
    for (int i = 0; i < this.treeCount; i ++ ) {
      forestTrees.get(i).treeColour=rcH;
      forestTrees.get(i).treeSaturation=rcS;      
      //forestTrees.get(i).treeBright=  abs(rcB-(33+(forestTrees.get(i).treeHeight*66/forestHeight)));
      forestTrees.get(i).treeBright = rcB+ ((forestTrees.get(i).treeHeight/forestHeight) * (rcB-rcD));      
    }
    //println(rcB + " " + rcD);
    this.forestSort = (rcB<=rcD) ? "asc" : "desc";    
  } 

  void recolourShadows(float rcH, float rcS, float rcB, float rcD) {
    for (int i = 0; i < this.treeCount; i ++ ) {
      forestTrees.get(i).shadowColour=rcH;
      forestTrees.get(i).shadowSaturation=rcS;
      forestTrees.get(i).shadowBrightness = rcB+ ((forestTrees.get(i).treeHeight/forestHeight) * (rcB-rcD));      
    }           
  } 


  void regrowShadows(float rsAngle, float rsHeight){
    this.forestShadowAngle=rsAngle;
    this.forestShadowLength=rsHeight;
    
    for (int i = 0; i < forestTrees.size(); i ++ ) {
     float tShadowLength=rsHeight*forestTrees.get(i).treeHeight/forestHeight;
      
     forestTrees.get(i).regrowShadow(rsAngle, tShadowLength);
    }
  }    


  
  void display() {
    //this always ensures that the more distant trees are behind the foregrounded ones
    //code for js - 
    sortForestTrees(forestSort);

    for (int i = 0; i < sortedTrees.size(); i ++ ) {
      sortedTrees.get(i).displayShadow();
    }
    
    for (int i = 0; i < sortedTrees.size(); i ++ ) {
      sortedTrees.get(i).displayTree();
    }
    
    
    /*
    //javacode - nice'n easy
    //Collections.sort(forestTrees, new sortTrees("brightness", forestSort));

    for (int i = 0; i < forestTrees.size(); i ++ ) {
      forestTrees.get(i).displayShadow();
    }
    
    for (int i = 0; i < forestTrees.size(); i ++ ) {
      forestTrees.get(i).displayTree();
    }
    */
    
  }
  
  
  void sortForestTrees(String sortOrder) {
    String[] brightIndex = new String[forestTrees.size()];
    float brBright;
    int rgTrees;
    
    //initialise the sorted trees array
    rgTrees = sortedTrees.size();
    for (int i = 0; i < rgTrees; i ++ ) {
     sortedTrees.remove(0);
    }
    
    //now get the tree brightnesses to the index
    rgTrees = forestTrees.size();
    for (int i = 0; i < rgTrees; i ++ ) {
      if (sortOrder == "desc") brBright=(-forestTrees.get(i).treeBright);
      else brBright=forestTrees.get(i).treeBright;
      
      brightIndex[i]= "" + brBright + "|" + i;
    }
    
    //sort the array
    //Arrays.sort(brightIndex);
    brightIndex=sort(brightIndex);    
    //now prime the sorted arraylist
    for (int i = 0; i < rgTrees; i ++ ) {
      String strIndex = brightIndex[i].substring(brightIndex[i].indexOf('|')+1,brightIndex[i].length());
      sortedTrees.add(forestTrees.get(int(strIndex)));
    }
    
  }  
}



//for java only
//import java.util.Comparator;


class tree {
   float treeX, treeY, treeHeight, treeStroke;
   float treeColour, treeBright, treeSaturation;
   float shadowLength, shadowAngle, shadowColour, shadowBrightness, shadowSaturation;
   float initRot;
   float[] depLen;
   float[] shadowLen;

   float shadowBright;
   float shadowStep=20;
   
   int ival=0;   
   int treeDepth;
   ArrayList<Character> treeSteps;
   ArrayList<Float> treeVars;
   ArrayList<Character> shadowSteps;
   ArrayList<Float> shadowVars;
   
   
   
   tree (float tX, float tY, float tHeight, float tColour, float tSaturation, float tBright, float tStroke, float tShadowAngle, float tShadowLength, float sColour, float sSaturation, float sBright) {
     this.treeX=tX;
     this.treeY=tY;
     this.treeHeight=tHeight;
     this.treeStroke=tStroke;
     this.treeBright=tBright;
     this.treeColour=tColour;
     this.treeSaturation=tSaturation;
     this.shadowAngle=tShadowAngle;
     this.shadowLength=tShadowLength;
     this.shadowSaturation=tSaturation;
     this.shadowColour=sColour;
     this.shadowBrightness=sBright;
     
     //random depth
     this.treeDepth=1;
     while (this.treeDepth<=3) {
       Random randomno = new Random();
       
       float gaussnum=(float) randomno.nextGaussian() * 3;
       this.treeDepth=int(6 + gaussnum);
     } 
     
     //set initial rotation
     Random randomno = new Random();
     
     this.initRot=(float) randomno.nextGaussian() * .1;
     
     depLen = new float[treeDepth];
     shadowLen = new float[treeDepth];
     
     for (int i = 0; i < treeDepth; i ++ ) {
       
       float gaussVal=(float) randomno.nextGaussian() * 3;
       
       depLen[i]=-1*(treeHeight/10 + gaussVal);
       shadowLen[i]=-1*(shadowLength/10 + gaussVal);
     }

     treeSteps = new ArrayList<Character>();
     treeVars = new ArrayList<Float>();

     shadowSteps = new ArrayList<Character>();
     shadowVars = new ArrayList<Float>();
     
     growTree(0);
   }


  
  void growTree(int depth){    
    if (depth < treeDepth) {
      //add a line to the array list
      //for the tree
      treeSteps.add('l');
      treeVars.add(depLen[depth]);
      
      treeSteps.add('t');
      treeVars.add(depLen[depth]);

      shadowSteps.add('l');
      shadowVars.add(shadowLen[depth]);
      
      shadowSteps.add('t');
      shadowVars.add(shadowLen[depth]);
      
      Random randomno = new Random();
    
      
      if ((float) randomno.nextGaussian() * 1 < 0.6) { // branching
        treeSteps.add('r');
        treeVars.add(0.3);

        treeSteps.add('s');
        treeVars.add(0.8);

        treeSteps.add('+');
        treeVars.add(0.0);


        shadowSteps.add('r');
        shadowVars.add(0.1);
      
        shadowSteps.add('s');
        shadowVars.add(0.8);

        shadowSteps.add('+');
        shadowVars.add(0.0);

        growTree(depth + 1);
        
        treeSteps.add('-');
        treeVars.add(0.0);

        treeSteps.add('r');
        treeVars.add(-0.6);

        treeSteps.add('+');
        treeVars.add(0.0);

        shadowSteps.add('-');
        shadowVars.add(0.0);

        shadowSteps.add('r');
        shadowVars.add(-0.2);

        shadowSteps.add('+');
        shadowVars.add(0.0);

        growTree(depth + 1);

        treeSteps.add('-');
        treeVars.add(0.0);

        shadowSteps.add('-');
        shadowVars.add(0.0);

        
      } else {
        growTree(depth);       
      }  
    }   
  }    

  void display() {
    displayTree();
    displayShadow();    
  }  
  
  void displayTree() {
    strokeWeight(treeStroke);
    stroke(treeColour,treeSaturation,treeBright);
    
    pushMatrix();
    translate(treeX,treeY);
    rotate(initRot); 
    showTree();    
    popMatrix();
    
  }
  
  void displayShadow(){
    strokeWeight(treeStroke*.75);

    //stroke(shadowColour,shadowSaturation,shadowBright+shadowStep);
    stroke(shadowColour,shadowSaturation,shadowBrightness);
    
    if (shadowLength>0) {
      pushMatrix();
      translate(treeX,treeY);
      rotate(shadowAngle);
      //flip along the x axis
      scale(-1,1); 
      showShadow();    
      popMatrix();
    }
  }
  
  void showTree(){
    for (int i = 0; i < treeSteps.size(); i ++ ) {

      switch (treeSteps.get(i)) {
        case 'l':
          line(0,0,0,treeVars.get(i));
          break;
        case 't':
          translate(0,treeVars.get(i));
          break;
        case 'r':
          rotate(treeVars.get(i));
          break;
        case 's':
          scale(treeVars.get(i));
          break;        
        case '+':
          pushMatrix();
          break;
        case '-':        
          popMatrix();
          break;
      }
    }
  }


  void regrowShadow(float sAngle, float sLen) {
    this.shadowAngle=sAngle;
    this.shadowLength=sLen;
    
     

    for (int i = 0; i < treeSteps.size(); i ++ ) {
      shadowSteps.set(i,treeSteps.get(i));
      
      switch (treeSteps.get(i)) {
        case 'l':
        case 't':
          float gaussVal = -1*(treeVars.get(i));
          gaussVal= (gaussVal - (this.treeHeight/10));
          shadowVars.set(i, -(sLen/10 + gaussVal));
          break;
        case 'r':
          shadowVars.set(i, treeVars.get(i)/3);
          break;
        default:
          shadowVars.set(i, treeVars.get(i));
          break;
      }        
    }    
  }
  

  void showShadow(){
    for (int i = 0; i < shadowSteps.size(); i ++ ) {
      switch (shadowSteps.get(i)) {
        case 'l':
          line(0,0,0,shadowVars.get(i));
          break;
        case 't':
          translate(0,shadowVars.get(i));
          break;
        case 'r':
          rotate(shadowVars.get(i));
          break;
        case 's':
          scale(shadowVars.get(i));
          break;        
        case '+':
          pushMatrix();
          break;
        case '-':        
          popMatrix();
          break;
      }
    }
  }
    
  
}



 

/* 
Sorting an Object Array" by Christian Marc Schmidt, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID= 50922  
License: 
http://creativecommons.org/licenses/by-sa/3.0/
http://creativecommons.org/licenses/GPL/2.0/
*/

/*
//java mode only
class sortTrees implements Comparator {
 
  String fieldToSortOn;
  String sortType;
  
     
  // Class constructor sets the column to sort on
  sortTrees(String fieldToSortOn_, String sortType_) {
    fieldToSortOn = fieldToSortOn_;
    sortType = sortType_;
  }
   
  //method which tells how to order the two elements in the array.
  //it is invoked automatically when we call "Collections.sort", and must be included in this class.
  int compare(Object object1, Object object2) {
     
    // cast the objects to your specific object class to be sorted by
    tree row1 = (tree) object1;
    tree row2 = (tree) object2;
 
    // String[] sorts = { "year taken", "business name", "city" }; // stores lables for all available sorts the user can perform. they are keyed in to actual datafields in a function below.
    if (fieldToSortOn == "brightness") {
       
      // necessary to cast to Integer type when comparing ints
      Float val1 = (Float) row1.treeBright;
      Float val2 = (Float) row2.treeBright;
       
      // the "compareTo" method is part of the Comparable interface, and provides a means of fully ordering objects.
      //println(sortType);
      if (sortType=="desc") val1.compareTo(val2);
      else return val2.compareTo(val1);
      //  Just FYI, another (more verbose) way to do a numerical sort, rather than using compareTo, is the following:
      //  if (row1.yearTaken < row2.yearTaken) {
      //    return -1;
      //  } else if (row1.yearTaken == row2.yearTaken) {
      //    return 0;
      //  } else if (row1.yearTaken > row2.yearTaken) {
      //    return 1;
      //  }
      
    }
    //else if (fieldToSortOn == "index") {
    //  Integer val1 = (Integer) row1.id;
    //  Integer val2 = (Integer) row2.id;
    //   
    //  return val1.compareTo(val2);
    //}
    
    // in case there is no match for fieldToSortOn, to avoid an error.
    return 0;
  }
}
*/


