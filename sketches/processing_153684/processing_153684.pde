
/* @pjs preload="explosion.jpg";
 */


/*
 *
 * This sketch is a commentary of marketism and art.
 * It uses a text by Keynes and a piece by an unspecified 
 * artist as a point of departure.
 *
 * All interaction is disabled except the ability to save the view.
 * You may create commodities. You may consume. You are impotent.
 *
 *       (c) Paul Smith, 2014
 *
 * Inspired by 
 *   Creative Coding
 *   Week 4, 03 - one pixel cinema
 *   by Indae Hwang and Jon McCormack
 * 
 *
 */

PGraphics pg;
PImage myImg;
ArrayList<Float> pixelColors;

int fileNumber=0;
int resolution;
int viewDiv;
boolean showImage, isShowHelp;
int bgColour;
String[] fileList;
String[] textLines;
char readCharacter;
int characterCount;

int dbOffset = -1;

sampleDrawer mySample;
imageDrawer myDraw;
textReader myReader;

void setup() {
  
  size(650, 650);

  //this code in java
  //load files 
  //File dir = new File(dataPath(""));
  //String[] lfList = dir.list();
  //fileList = new String[lfList.length];
  //fileList = lfList;
  
  //this code in js
  fileList = new String[3];
  fileList[0]="explosion.jpg";
  
  
  //println("there are " + lines.length + " lines");
  //println(lines);
  
  drawNextFile();
  
  //initialise the arraylist of colours
  resolution = 52;     //initialise to 52 columns
  pixelColors = new ArrayList<Float>();  // Create an empty ArrayList
  for (int i = 0; i<resolution; i++) {
    pixelColors.add(float(0));
  }
  
  
  smooth(4);
  
  //initialise the width and show image settings
  showImage = false;
  viewDiv=1;  
  mySample = new sampleDrawer(resolution);
  bgColour=255;
  
  myReader = new textReader("keynes.txt");
  readCharacter = "";  
  
  //isShowHelp=true;
  pg = createGraphics(700, 622);  
}


void draw() {
  if (isShowHelp) {
    showHelp();
  } else {
    readCharacter = (myReader.readACharacter("Next"));
    
    if (myReader.eof) {
      myReader.resetToStart();
      readCharacter = (myReader.readACharacter("Next"));    
    } else {
      
      background(bgColour);
      drawImage();
    
      if (myReader.newLine) {
        myDraw.readColors(pixelColors);
        mySample.randomiseCentres(resolution,width/viewDiv,height);
        mySample.resetSizes(pixelColors.size());
      }
        
      characterCount = (myReader.getLineCount(readCharacter));

      if (characterCount > 0) mySample.setCircleSize(charToIndex(readCharacter),float(characterCount));      
      mySample.draw(pixelColors,0,0,width/viewDiv,height, myDraw.scanLine);
      
    } 
     
  }  
}


int charToIndex(char ctiSource) {
  if ((int(ctiSource)>=65) && (int(ctiSource)<=90)) return (int(ctiSource) - 65);
  if ((int(ctiSource)>=97) && (int(ctiSource)<=122)) return (int(ctiSource) - 97 + 26);
  return 0;
}
  



class textReader {
  String[] sourceText;
  int[] lineTally;
  int[] textTally;
    
  String sourceFile;
  int currentLine;
  int currentPos;
  boolean newLine;
  boolean eof;
  
  textReader (String trName) {
    this.sourceFile = trName;
    this.currentLine=0;
    this.currentPos=0;
    this.lineTally = new int[122];
    this.textTally = new int[122];
    this.newLine = true;
    this.eof=false;
    
    String[] readLines = loadStrings(trName);
    this.sourceText = new String[readLines.length];
    this.sourceText = readLines;
  }
  
  char readACharacter (String racStep) {
    this.newLine=false;
    
    //if twe're at the beginning, begin
    if (currentLine==0) currentLine=1;
    
    //move to the next character if specified
    if (racStep=="Next") currentPos++;
    
    //if we've moved past the end of the line
    if (currentPos > sourceText[currentLine].length()) {
      //go to the next line
      currentLine++;
      clearLineTally();
      this.newLine=true;
      
      //if we've reached the end of the file
      if (currentLine>sourceText.length) {
        //go back a line
        currentLine--;
        //go to the end of the line
        currentPos=sourceText[currentLine].length();
        //return the end of file marker
        this.eof=true;
        return '^';
      } else {
        currentPos=1;
      }
    }
    thisChar = (sourceText[currentLine].substring(currentPos-1,currentPos).charCodeAt(0));
    populateTextArrays(sourceText[currentLine].substring(currentPos-1,currentPos).charCodeAt(0));
    return (sourceText[currentLine].substring(currentPos-1,currentPos).charCodeAt(0));
  }

  
  void populateTextArrays(char plaChar) {    
    if (plaChar=="e") println (":::::" + plaChar + ":" + byte(plaChar));
    
    if (((int(plaChar) >= 65) && (int(plaChar) <= 90)) ||
       ((int(plaChar) >= 97) && (int(plaChar) <= 122))) {
      lineTally[int(plaChar)-1]++;          
      textTally[int(plaChar)-1]++;          
    }   
  }  
  
  void clearLineTally() {
    for (int i=65; i< lineTally.length; i++) {
      lineTally[i-1]=0;                    
    }   
  }  
  
  void clearTextTally() {
    for (int i=65; i< lineTally.length; i++) {
      textTally[i-1]=0;                    
    }   
  }  
  
  
  int getLineCount(char glcChar) {
    if (((int(glcChar) >= 65) && (int(glcChar) <= 90)) ||
       ((int(glcChar) >= 97) && (int(glcChar) <= 122))) {
      return lineTally[int(glcChar)-1];          
    } else {
      return 0;
    }   
  }
  
  void resetToStart(){
    clearLineTally();
    clearTextTally();
    this.currentLine=0;
    this.currentPos=0;
    this.eof=false;
    this.newLine=true;
  }
  
}  





class sampleDrawer {
  String drawMode;
  
  //ArrayList<Float> x;       // x-position of point
  //ArrayList<Float> y;       // y-position
  //ArrayList<Float> centrex;       // x-position of point
  //ArrayList<Float> centrey;       // y-position
  ArrayList<Float> centresX; // radius of the orbit for each circle
  ArrayList<Float> centresY; // radius of the orbit for each circle
  ArrayList<Float> circleSize; // radius of the orbit for each circle
  ArrayList<Float> circleStartSize; // radius of the orbit for each circle
  
  
  float distanceMargin;
  int pixLines, highLines, pixStep;
  
  sampleDrawer (int sdSize) {
    centresX = new ArrayList<Float>();       // x-position of point    
    centresY = new ArrayList<Float>();       // x-position of point
    circleSize = new ArrayList<Float>();       // x-position of point
    circleStartSize = new ArrayList<Float>();       // x-position of point

    resizeLists(sdSize);
    
    //x = new ArrayList<Float>();       // x-position of point
    //y = new ArrayList<Float>();       // y-position
    //centrex = new ArrayList<Float>();       // x-position of point
    //centrey = new ArrayList<Float>();       // y-position    
  }

  void draw (ArrayList<Float> drawColors,float dX,float dY,float dWidth,float dHeight, int dScan) {
    drawCircles  (drawColors,dX, dY,dWidth,dHeight );
  }
  
  
  void drawCircles (ArrayList<Float> dColors,float dX,float dY,float dWidth,float dHeight) {
    checkCentres(dX, dY, dWidth, dHeight);
    for (int i=0; i<dColors.size(); i++) {
      if (circleSize.get(i)>circleStartSize.get(i)) {
        stroke(int(dColors.get(i)));
        fill(int(dColors.get(i)));
        ellipse(centresX.get(i),centresY.get(i),circleSize.get(i),circleSize.get(i));
      }
    }  
  }
  
  
  void checkCentres(float dX,float dY,float dWidth,float dHeight){
    for (int i=0; i<centresX.size(); i++) {
      
      //first check if we're up against a wall
      if ((centresX.get(i)-(circleSize.get(i)/2))<dX)
          centresX.set(i, dX+circleSize.get(i)/2);
          
      if ((centresX.get(i)+(circleSize.get(i)/2))>dWidth)
          centresX.set(i, dWidth-circleSize.get(i)/2);
      
      if ((centresY.get(i)-(circleSize.get(i)/2))<dY)
          centresY.set(i, dX+circleSize.get(i)/2);
          
      if ((centresY.get(i)+(circleSize.get(i)/2))>dHeight)
          centresY.set(i, dHeight-circleSize.get(i)/2);
          
      //now compare to other centres
      checkACentre(i);
    }
  } 

  void checkACentre(int cacCheck){
    for (int i=0; i<centresX.size(); i++) {
       if (i!=cacCheck){
         float cacDistance = dist(centresX.get(cacCheck),centresY.get(cacCheck),centresX.get(i),centresY.get(i));
         if (cacDistance<circleSize.get(i)) {
           if (centresX.get(cacCheck)<centresX.get(i)) {
             centresX.set(cacCheck, centresX.get(cacCheck) - 2); 
           } else {
             centresX.set(cacCheck, centresX.get(cacCheck) + 2);
           }
           if (centresY.get(cacCheck)<centresY.get(i)) {
             centresY.set(cacCheck, centresY.get(cacCheck) - 2); 
           } else {
             centresY.set(cacCheck, centresY.get(cacCheck) + 2);
           }     
         }
       }
    }
  }  
  
  
  void resizeLists (int rscSize) {
    if (centresX.size() < rscSize) {
      for (int i=centresX.size(); i<rscSize; i++) {
        centresX.add(0.0); 
        centresY.add(0.0);
        circleSize.add(0.0); 
        circleStartSize.add(0.0); 
      }
    }
  }
  
  void resetSizes(int rNum) {
    for (int i=0; i<rNum; i++) {
      circleStartSize.set(i, random(5,20));
      circleSize.set(i, circleStartSize.get(i));
    }
  }  

  void setCircleSize (int scSIx, float scsSize) {
    circleSize.set(scSIx, circleStartSize.get(scSIx) + scsSize); 
  }
      
  void randomiseCentres(int rcNum, float rcWidth, float rcHeight) {  
    distanceMargin = random(10,rcHeight/10);

    for (int i=0; i<rcNum; i++) {
      if (centresX.size()<i+1) {
        centresX.add(0.0);
        centresY.add(0.0);
      }
      centresX.set(i, random(distanceMargin,rcWidth-distanceMargin));
      centresY.set(i, random(distanceMargin,rcHeight-distanceMargin));
    }
  }  
}



class imageDrawer {
  PImage drawnImage;
  boolean isFrozen;
  int scanLine, lineOffset; 
  float constrainLower, constrainUpper;
  float x, y, imageWidth,imageHeight;
  String imageName;  
  
  imageDrawer (String idName, float idXPos, float idYPos, float idWide, float idHigh) {
    loadAnImage(idName);
    this.x = idXPos;
    this.y = idYPos;
    this.isFrozen = false;
    this.constrainUpper=height;
    this.constrainLower=0.0;
    this.lineOffset=1;
    this.imageWidth=idWide;
    this.imageHeight=idHigh;
  }
  
  void draw() {
    // draw the image
    image(drawnImage, x, y, imageWidth,imageHeight);
  }

  void loadAnImage(String lanName){
    this.drawnImage = loadImage(lanName);
    this.imageName=lanName;
  }
  
  void overlay(int oPoints, int oStep, int oDia, boolean oShow) {
    float cellWidth = float(drawnImage.width)/float(oPoints);

    if (!isFrozen) {
      // increment scan line position every second frame
      if (frameCount % oStep == 0) {
        scanLine = scanLine + lineOffset;
      }

      if (scanLine >= constrainUpper) {
        lineOffset = -1;
        scanLine = scanLine + lineOffset;
      }
      
      if (scanLine < constrainLower) {
        lineOffset = 1;
        scanLine = scanLine + lineOffset;
      }
    }
  
    // draw circles over where the "scanner" is currently reading pixel values
    if (oShow) {
      for (int i=0; i<oPoints; i++) {
        stroke(255, 0, 0);
        noFill();
        ellipse(5+x + i*cellWidth, scanLine, oDia, oDia );
      }
    }

  }
  
  void switchFreeze () {
    isFrozen = isFrozen ? false : true;  
  }

  void setUpper(float suValue) {
    if (suValue > constrainLower) constrainUpper=suValue;
  }
  
  void setLower(float slVal) {
     if (slVal < constrainUpper) constrainLower=slVal;
  }
 

  void readColors(ArrayList<Float> rcColors) {
    float cellWidth = float(drawnImage.width)/float(rcColors.size());

    // read the colours for the current scanLine
    for (int i=0; i<rcColors.size(); i++) {
      rcColors.set(i, float(color(drawnImage.get(2+i*int(cellWidth), scanLine))));   
    }
  }
}



void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) dbOffset++;
    if (keyCode == LEFT) {
      dbOffset--;
      if (dbOffset<0) dbOffset=0;
    } 
  } else {
    switch(key) {
      /*
      case '+':
       pixelColors.add(0.0);
       if (mySample.drawMode == "Spinners") background(bgColour);
       break;
     
      case '-':
       if (pixelColors.size()>1){
         pixelColors.remove(0);
       }
       break;
      
      case 'S':
      case 's':
        showImage = showImage ? false : true;
        viewDiv = showImage ? 2 : 1;    
        break;
  
      case 'w':
      case 'W':
        bgColour=255;
        if (mySample.drawMode == "Spinners") background(bgColour);
        if (mySample.drawMode=="Blurtical") pg.background(bgColour,5);
        break;
      
      case 'c':
      case 'C':
        bgColour=int(pixelColors.get(0));
        if (mySample.drawMode == "Spinners") background(bgColour);
        if (mySample.drawMode=="Blurtical") pg.background(bgColour,5);
        break;
      
      case 'b':
      case 'B':
        bgColour=0;
        if (mySample.drawMode == "Spinners") background(bgColour);
        if (mySample.drawMode == "Blurtical") pg.background(bgColour,5);
        break;
      
      case 'f':
      case 'F':
        myDraw.switchFreeze();
        break;
      
      case 'i':
      case 'I':
        drawNextFile();
        break;
      
      case 'm':
      case 'M':
        //mySample.cycleMode();
        //if (mySample.drawMode=="Spinners") background(bgColour);
        //if (mySample.drawMode=="Blurtical") pg.background(bgColour,255);
        break;
   
      case 'u':
        myDraw.setUpper(myDraw.scanLine);
        break;
      
      case 'U':
        myDraw.setUpper(height);
        break;
      
      case 'l':
        myDraw.setLower(myDraw.scanLine);
        break;
      
      case 'L':
        myDraw.setLower(0.0);
        break;

      case 'h':
      case 'H':
        isShowHelp = isShowHelp ? false : true;
        break;
      */        
      case 'p':
      case 'P':
        String fname=getIncrementalFilename("sketch-####.jpg");
        saveFrame(fname);
        break;

    }

  }  
  
}


public String getIncrementalFilename(String what) {
  String s="",prefix,suffix,padstr,numstr;
  int index=0,first,last,count;
  File f;
  boolean ok;
 
  first=what.indexOf('#');
  last=what.lastIndexOf('#');
  count=last-first+1;
 
  if( (first!=-1)&& (last-first>0)) {
    prefix=what.substring(0, first);
    suffix=what.substring(last+1);
 
    // Comment out if you want to use absolute paths
    // or if you're not using this inside PApplet
    if(sketchPath!=null) prefix=savePath(prefix);
 
    index=0;
    ok=false;
 
    do {
      padstr="";
      numstr=""+index;
      for(int i=0; i<count-numstr.length(); i++) padstr+="0";       
      s=prefix+padstr+numstr+suffix;
 
      f=new File(s);
      ok=!f.exists();
      index++;
 
      // Provide a panic button. If index > 10000 chances are it's an 
      // invalid filename.
      if(index>10000) ok=true;
 
    } 
    while(!ok);
 
    // Panic button - comment out if you know what you're doing
    if(index>10000) {
      println("getIncrementalFilename thinks there is a problem - Is there "+
        " more than 10000 files already in the sequence or is the filename invalid?");
      return prefix+"ERR"+suffix;
    }
  }
 
  return s;
}


void drawNextFile() {
  if (fileNumber < fileList.length) {
    fileNumber++;
  } else {
    fileNumber=1;
  }

  if (fileList[fileNumber-1]!=null) {  
    myDraw = new imageDrawer(fileList[fileNumber-1], width/2,0, width/2, height);
  }else{
    myDraw = new imageDrawer("MajorTom.jpg", width/2,0, width/2, height);
  }
}  
  


void drawImage() {
  if (showImage) myDraw.draw();
  myDraw.overlay(pixelColors.size(),2,5,showImage);
}


void showHelp(){
  //clumsy code I know - but no time !!!
  
  String textLine;
  
  fill(255);
  
  float tLine = 100;
  float lHeight = 20;
  
  rect(10, 10, width - 20, height - 20);
  
  PFont f = createFont("Arial",16,true); // STEP 3 Create Font
  textFont(f,16); 
  fill(0,0,0);
  textAlign(CENTER);
  text("How to use:",width/2,tLine);
  tLine = tLine + 2*lHeight;

  textAlign(LEFT);  
  text("+    -   Add points.",width/5,tLine);
  tLine = tLine + lHeight;
  
  text("-    -   Remove points.",width/5,tLine);
  tLine = tLine + lHeight;
  
  tLine = tLine + 2*lHeight;
  text("s/S  -   Show/Hide image.",width/5,tLine);
  tLine = tLine + lHeight;

  text("m/M  -   Cycle modes - vertitcal/horizontal/pixellate/shuffle/spin.",width/5,tLine);
  tLine = tLine + lHeight;

  text("i/I  -   Cycle images.",width/5,tLine);
  tLine = tLine + lHeight;

  text("l    -   Set linescan lower limit.",width/5,tLine);
  tLine = tLine + lHeight;
  
  text("L    -   Reset linescan lower limit.",width/5,tLine);
  tLine = tLine + lHeight;
  
  text("u    -   Set linescan upper limit.",width/5,tLine);
  tLine = tLine + lHeight;
  
  text("U    -   Reset linescan upper limit.",width/5,tLine);
  tLine = tLine + lHeight;
  
  text("f/F  -   Freeze/unFreeze scanning.",width/5,tLine);
  tLine = tLine + lHeight;
  

  text("w/W  -   White background - spinner/blurtical mode only.",width/5,tLine);
  tLine = tLine + lHeight;
  
  text("b/B  -   Black background - spinner/blurtical mode only.",width/5,tLine);
  tLine = tLine + lHeight;
  
  text("p/P  -   Set background to pixel col 1 - spinner/blurtical mode only.",width/5,tLine);
  tLine = tLine + lHeight;
  
  
  textAlign(CENTER);
  text("H  -   display/hide this help screen",width/2,tLine);

}






