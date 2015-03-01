
/*
 * Creative Coding
 * Week 5, 02 - Digital Clock
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows how to use text in Processing
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 * Use the 'h', 'm' and 's' keys to enlarge the hours, minutes or seconds in the display.
 *
 */
import java.util.*;
import java.text.*;



char  selected;  // what is selected (h,m,s)
int   gap;       // gap between digits
int   bgColour=0;
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

void setup() {
  size(1024, 600);
  colorMode(HSB,100);

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

  clockForest = new forest(width/4,3*height/4,width/2,2*height/3,.66,1+int(random(maxTrees)),60,radians(forestAngle),4*height/3);
  
  forestClock = new clock();  
}


void draw() {
  background(100,0,100);
  
  if (useSysTime) forestClock.systemTime();
  else            forestClock.setTime(manHour,manMinute,manSecond);
  
  calculateShadows(forestClock.clockHour, forestClock.clockMinute, forestClock.clockSecond, sunRise, sunSet, sunAngle, moonRise, moonSet, moonAngle);
  clockForest.display();
  
  if (useSysTime) forestClock.display();
  else forestClock.displayTime(manHour,manMinute,manSecond);  
}


void calculateShadows(int csHour, int csMinute, int csSecond, int csSunRise, int csSunSet, float csSunAngle, int csMoonRise, int csMoonSet, float csMoonAngle){
  int thisMinute;
  int sunPeriod=getPeriod(stringTime(csSunRise), stringTime(csSunSet));
  int moonPeriod=getPeriod(stringTime(csMoonRise), stringTime(csMoonSet));
  float angleOffset=0.0, shigh=0.0;

  //convert to 24h
  int csMinuteTime=(csHour*100)+csMinute;
  
  if (isTimeBetween(stringTime(csSunRise), stringTime(csSunSet), stringTime(csMinuteTime))>0) {
    thisMinute=getPeriod(stringTime(csSunRise),stringTime(csMinuteTime));
    angleOffset=((180-csSunAngle)/2)+csSunAngle*float(thisMinute)/sunPeriod;
    if (thisMinute <= sunPeriod/2) shigh = ((4*height/3) - (thisMinute * ((4*height/3)- (height/2))/(sunPeriod/2)));
    else shigh = ((height/2) + ((thisMinute-sunPeriod/2) * ((4*height/3)- (height/2))/(sunPeriod/2)));
  } 
  else if (isTimeBetween(stringTime(csMoonRise), stringTime(csMoonSet), stringTime(csMinuteTime))>0) {
    thisMinute=getPeriod(stringTime(csMoonRise),stringTime(csMinuteTime));    
    angleOffset=((180-csMoonAngle)/2)+csMoonAngle*float(thisMinute)/moonPeriod;
    if (thisMinute <= moonPeriod/2) shigh = ((4*height/3) - (thisMinute * ((4*height/3)- (height/2))/(moonPeriod/2)));
    else shigh = ((height/2) + ((thisMinute-moonPeriod/2) * ((4*height/3)- (height/2))/(moonPeriod/2)));
  }
  
  clockForest.regrowShadows(radians(viewAngle+angleOffset),shigh);   
        
}


String stringTime(int stTime){
  String stHour = "" + int(stTime/100);
  String stMinute= "0"+ stTime%100;
  stMinute = stMinute.substring(stMinute.length()-2);     // Returns "bit"
  //println(stHour + ":" + stMinute + ":00");
  return (stHour + ":" + stMinute + ":00");
}


int isTimeBetween(String startTime, String endTime, String checkTime){
  Date time1 = convertTime(startTime);
  Calendar calendar1 = Calendar.getInstance();
  calendar1.setTime(time1);

  Date time2 = convertTime(endTime);
  Calendar calendar2 = Calendar.getInstance();
  calendar2.setTime(time2);
  if (time2.before(time1)) calendar2.add(Calendar.DATE, 1);

  Date d = convertTime(checkTime);
  Calendar calendar3 = Calendar.getInstance();
  calendar3.setTime(d);
  if (d.before(time1)) calendar3.add(Calendar.DATE, 1);

  Date x = calendar3.getTime();
  if (x.after(calendar1.getTime()) && x.before(calendar2.getTime())) {
     int timeDiff=int(calendar3.getTimeInMillis()/1000 - calendar1.getTimeInMillis()/1000); 
    return timeDiff;
  }
  else return 0;
}


int getPeriod(String startTime, String endTime){
  Date time1 = convertTime(startTime);
  Calendar calendar1 = Calendar.getInstance();
  calendar1.setTime(time1);

  Date time2 = convertTime(endTime);
  Calendar calendar2 = Calendar.getInstance();
  calendar2.setTime(time2);
  if (time2.before(time1)) { 
     calendar2.add(Calendar.DATE, 1);
  }

  Date x = calendar2.getTime();
  if (x.after(calendar1.getTime())) {
    int timeDiff=int(calendar2.getTimeInMillis()/1000 - calendar1.getTimeInMillis()/1000); 
    return timeDiff;
  }
  else return 0;
}



Date convertTime(String ctString){
  try {
    DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    Date returnDate = timeFormat.parse(ctString);
    return returnDate;
  } catch (ParseException e) {
    e.printStackTrace();
  } 
  return null;
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
    fill(100,100,100);
    // draw h, m, s
    drawNumber(dHour, selected == 'h', -gap, 0);
    drawNumber(dMinute, selected == 'm', 0, 0);
    drawNumber(dSecond, selected == 's', gap, 0);
    //color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
    //drawBanner(c, 10);
  }

  /*
   * drawNumber
   * takes an integer and draws it offset from the centre of the screen by
   * offsetX and offsetY. If big is true then use a big size for the type.
   *
  */
  void drawNumber(int number, boolean big, float offsetX, float offsetY) {
    String theText = str(number); // convert number to string
    if (big)
      textSize(400); // set big font size
    else
      textSize(100);  // normal font size

    float textWidth = textWidth(theText) * 0.5;
    float textAscent = textAscent() * 0.375;

    // draw text offset from the centre of the screen
    text(theText, width/2 - textWidth + offsetX, height/2 + textAscent + offsetY);
  }
}



import java.util.Collections;

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
  float forestShadowAngle, forestShadowLength;
  int treeCount;
  
  ArrayList<tree> forestTrees;


  forest (float fX, float fGround, int fWide, int fHigh, float fHorizon, int fTrees, float fColour, float fShadowAngle, float fShadowLength) {
    this.forestX=fX;
    this.forestGround=fGround;
    this.forestWidth=fWide;
    this.forestHeight=fHigh;
    this.forestHorizon=fHorizon;
    this.treeCount=fTrees;
    this.forestColour=fColour;
    this.forestShadowAngle=fShadowAngle;
    this.forestShadowLength=fShadowLength;
    
    forestTrees = new ArrayList<tree>();
    
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
      
      forestTrees.add(new tree(xpos,ypos,tHeight,forestColour,tBright,tStroke,forestShadowAngle,tShadowLength));
    }
  }
  
  void regrowForest(){
    int rgTrees = forestTrees.size();
    
    for (int i = 0; i < rgTrees; i ++ ) {
     forestTrees.remove(0);
    }
    growForest();
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
    Collections.sort(forestTrees, new sortTrees("brightness"));
    
    for (int i = 0; i < forestTrees.size(); i ++ ) {
      forestTrees.get(i).displayShadow();
    }
    
    for (int i = 0; i < forestTrees.size(); i ++ ) {
      forestTrees.get(i).displayTree();
    }
  }
  
}



import java.util.Comparator;


class tree {
   float treeX, treeY, treeHeight, treeStroke, treeColour, treeBright, shadowLength, shadowAngle;
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
   
   
   
   tree (float tX, float tY, float tHeight, float tColour, float tBright, float tStroke, float tShadowAngle, float tShadowLength) {
     this.treeX=tX;
     this.treeY=tY;
     this.treeHeight=tHeight;
     this.treeStroke=tStroke;
     this.treeBright=tBright;
     this.treeColour=tColour;
     this.shadowAngle=tShadowAngle;
     this.shadowLength=tShadowLength;
     this.shadowBright=tBright;
     
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
    stroke(treeColour,60,treeBright);
    
    pushMatrix();
    translate(treeX,treeY);
    rotate(initRot); 
    showTree();    
    popMatrix();
    
  }
  
  void displayShadow(){
    strokeWeight(treeStroke*.75);

    stroke(treeColour,0,treeBright+shadowStep);
    
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
class sortTrees implements Comparator {
 
  String fieldToSortOn;
     
  // Class constructor sets the column to sort on
  sortTrees(String fieldToSortOn_) {
    fieldToSortOn = fieldToSortOn_;
  }
   
  /*
    method which tells how to order the two elements in the array.
    it is invoked automatically when we call "Collections.sort", and must be included in this class.
  */
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
      return val2.compareTo(val1);
      /*
        Just FYI, another (more verbose) way to do a numerical sort, rather than using compareTo, is the following:
        if (row1.yearTaken < row2.yearTaken) {
          return -1;
        } else if (row1.yearTaken == row2.yearTaken) {
          return 0;
        } else if (row1.yearTaken > row2.yearTaken) {
          return 1;
        }
      */
    }
    /*
    else if (fieldToSortOn == "index") {
      Integer val1 = (Integer) row1.id;
      Integer val2 = (Integer) row2.id;
       
      return val1.compareTo(val2);
    }
    */
    // in case there is no match for fieldToSortOn, to avoid an error.
    return 0;
  }
}



