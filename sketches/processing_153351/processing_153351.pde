
/* @pjs preload="MajorTom.jpg, melbourneCity.jpg, nasaImage.jpg";
 */


/*
 * Inspired by 
 *   Creative Coding
 *   Week 4, 03 - one pixel cinema
 *   by Indae Hwang and Jon McCormack
 * 
 * This simple sketch demonstrates how to read pixel values from an image
 * It simulates a 10 pixel "scanner" that moves from the top to the bottom of the image
 * reading the colour values for 10 equally spaced points, then displaying those colours
 * as vertical bars on the left half of the screen.
 *
 *  5 modes
 *  cycle through images in data folder
 *  add / remove scan points 
 *
 */

PImage myImg;
ArrayList<Float> pixelColors;

int fileNumber=0;
int resolution;
int viewDiv;
boolean showImage, isShowHelp;
int bgColour;
String[] fileList;

sampleDrawer mySample;
imageDrawer myDraw;

void setup() {
  
  size(700, 622);

  //this code in java
  //load files 
  //File dir = new File(dataPath(""));
  //String[] lfList = dir.list();
  //fileList = new String[lfList.length];
  //fileList = lfList;
  
  //this code in js
  fileList = new String[3];
  fileList[0]="melbourneCity.jpg";
  fileList[1]="MajorTom.jpg";
  fileList[2]="nasaImage.jpg";
  
  drawNextFile();
  
  
  //initialise the arraylist of colours
  resolution = 20;     //initialise to 20 columns
  pixelColors = new ArrayList<Float>();  // Create an empty ArrayList
  for (int i = 0; i<resolution; i++) {
    pixelColors.add(float(0));
  }
  
  
  smooth(4);
  
  //initialise the width and show image settings
  showImage = true;
  viewDiv=2;  
  mySample = new sampleDrawer("Horizontal");
  bgColour=0;
  
  isShowHelp=true;
  
}


void draw() {
  if (isShowHelp) {
    showHelp();
  } else {
    if (
      (mySample.drawMode!="Spinners")&&
      (mySample.drawMode!="Pixelator")&&
      (mySample.drawMode!="Shuffler")) background(bgColour);
    
    myDraw.readColors(pixelColors);
    mySample.draw(pixelColors,0,0,width/viewDiv,height, myDraw.scanLine);
    drawImage();
  }
  
}



void keyPressed() {
  
  switch(key) {
    case '+':
     pixelColors.add(0.0);
     if (mySample.drawMode == "Spinners") background(bgColour);
     break;
     
    case '-':
      if (pixelColors.size()>1){
        pixelColors.remove(0);
        if (mySample.drawMode == "Spinners") background(bgColour);
      }
      break;
      
    case 'S':
    case 's':
      showImage = showImage ? false : true;
      viewDiv = showImage ? 2 : 1;    
      if (mySample.drawMode=="Spinners") background(bgColour);
      break;
  
    case 'w':
    case 'W':
      bgColour=255;
      if (mySample.drawMode == "Spinners") background(bgColour);
      break;
      
    case 'p':
    case 'P':
      bgColour=int(pixelColors.get(0));
      if (mySample.drawMode == "Spinners") background(bgColour);
      break;
      
    case 'b':
    case 'B':
      bgColour=0;
      if (mySample.drawMode == "Spinners") background(bgColour);
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
      mySample.cycleMode();
      if (mySample.drawMode=="Spinners") background(bgColour);
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


  }  
  
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
  

  text("w/W  -   White background - spinner mode only.",width/5,tLine);
  tLine = tLine + lHeight;
  
  text("b/B  -   Black background - spinner mode only.",width/5,tLine);
  tLine = tLine + lHeight;
  
  text("p/P  -   Set background to pixel col 1 - spinner mode only.",width/5,tLine);
  tLine = tLine + lHeight;
  
  
  textAlign(CENTER);
  text("H  -   display/hide this help screen",width/2,tLine);

}



class sampleDrawer {
  String drawMode;
  ArrayList<Float> x;       // x-position of point
  ArrayList<Float> y;       // y-position
  ArrayList<Float> centrex;       // x-position of point
  ArrayList<Float> centrey;       // y-position
  ArrayList<Float> speed;   // speed
  ArrayList<Float> phase;   // phase
  ArrayList<Float> divisor; // radius of the orbit for each circle
  ArrayList<Float> centresX; // radius of the orbit for each circle
  ArrayList<Float> centresY; // radius of the orbit for each circle
  float distanceMargin;
  int pixLines, highLines, pixStep;
  
  //float[][] centresarr; // the array of centres


  
  sampleDrawer (String sdMode) {
    
    this.drawMode = sdMode;
    
    x = new ArrayList<Float>();       // x-position of point
    y = new ArrayList<Float>();       // y-position
    centrex = new ArrayList<Float>();       // x-position of point
    centrey = new ArrayList<Float>();       // y-position
    speed = new ArrayList<Float>();   // speed
    phase = new ArrayList<Float>();   // phase
    divisor = new ArrayList<Float>(); // radius of the orbit for each circle
    centresX = new ArrayList<Float>(); // radius of the orbit for each circle
    centresY = new ArrayList<Float>(); // radius of the orbit for each circle

  }

  void draw (ArrayList<Float> drawColors,float dX,float dY,float dWidth,float dHeight, int dScan) {
    if (drawMode=="Horizontal") drawHorizontal (drawColors,dX,dY,dWidth,dHeight);
    if (drawMode=="Vertical")   drawVertical   (drawColors,dX,dY,dWidth,dHeight);
    if (drawMode=="Spinners")   drawSpinners   (drawColors,dX,dY,dWidth,dHeight);
    if (drawMode=="Pixelator")  drawPixelator  (drawColors,dX,dY,dWidth,dHeight, dScan);
    if (drawMode=="Shuffler")  drawShuffler  (drawColors,dX,dY,dWidth,dHeight, dScan);
  }
  
  
  void drawHorizontal (ArrayList<Float> dColors,float dX,float dY,float dWidth,float dHeight) {
    float dCellHeight = dHeight/float(dColors.size());
    
    for (int i=0; i< dColors.size(); i++) {
      noStroke();
      fill(int(dColors.get(i)));
      rect(dX, float(i)*dCellHeight, dWidth, dCellHeight );
    }
  }
  
  void drawVertical (ArrayList<Float> dColors,float dX,float dY,float dWidth,float dHeight) {
    float dCellWidth = dWidth/float(dColors.size());
    
    for (int i=0; i< dColors.size(); i++) {
      noStroke();
      fill(int(dColors.get(i)));
      rect(float(i)*dCellWidth, dY, dCellWidth, dHeight );
    }
    
  }
  
  void drawPixelator (ArrayList<Float> dColors,float dX,float dY,float dWidth,float dHeight, int dLine) {
    float dCellWidth = dWidth/float(dColors.size());
    int pixHeight = int(dHeight/float(dColors.size()));
    
    if (dLine%pixHeight==0) {
      for (int i=0; i< dColors.size(); i++) {
        noStroke();
        fill(int(dColors.get(i)));
         //rect(float(i)*dCellWidth, dLine, dCellWidth, 1 );
         rect(float(i)*dCellWidth, dLine, dCellWidth, pixHeight );
      }
    }
    
  }

  void drawShuffler (ArrayList<Float> dColors,float dX,float dY,float dWidth,float dHeight, int dLine) {
    float dCellWidth = dWidth/float(dColors.size());
    int pixHeight = int(dHeight/float(dColors.size()));
    int gcol;
    
    if (dLine%pixHeight==0) {
      for (int i=0; i< dColors.size(); i++) {
        noStroke();
        
        gcol = int(random(0,dColors.size())); 
        fill(int(dColors.get(gcol)));
        rect(float(i)*dCellWidth, dLine, dCellWidth, pixHeight );
      }
    }
    
  }


  void drawSpinners (ArrayList<Float> dColors,float dX,float dY,float dWidth,float dHeight) {
    int maxNum = dColors.size();
    
    float rowHeight = dWidth / float (maxNum);
    
    //first check lengths of arrays and adjust as neessary
    resizeLists(x.size(), dColors.size());
    
    for (int i=0; i<dColors.size(); i++) {
      // populate x values
      float rads = radians(frameCount*speed.get(i) );
      
      if (i%2 == 1) { // odd
        x.set(i, centrex.get(i) + sin(rads + phase.get(i))* dWidth/divisor.get(i));
      } else { // even
        x.set(i, centrex.get(i) + cos(rads + phase.get(i))* dWidth/divisor.get(i));
      }
      
      //populate y values
    
      float rads2 = radians(frameCount*speed.get(i) );
 
      if (i%2 == 1) { // odd
        y.set(i, centrey.get(i) + cos(rads + phase.get(i))* dWidth/divisor.get(i));
      } else { // even
        y.set(i, centrey.get(i) + sin(rads + phase.get(i))* dWidth/divisor.get(i));
      }
      
      fill(0);
    
      if (i<maxNum-1) {
        float distance = dist(x.get(i), y.get(i), x.get(i+1), y.get(i+1));
        
        if (distance > rowHeight && distance < rowHeight + distanceMargin) {
          stroke(int(dColors.get(i)),50);
          //stroke(100,50);
          line(x.get(i), y.get(i), x.get(i+1), y.get(i+1));
          
          //stroke(255);
          point(x.get(i), y.get(i));
          point(x.get(i+1), y.get(i+1));
        }
      }
    }
  }


  void resizeLists (int rsxSize, int rscSize) {
    if (rsxSize != rscSize) {  
      if (rsxSize < rscSize) {
        for (int i=rsxSize; i<rscSize; i++) {
          x.add(0.0);       
          y.add(0.0);       
          centrex.add(0.0); 
          centrey.add(0.0); 
          speed.add(0.0);   
          phase.add(0.0);   
          divisor.add(0.0);
        }
      }
      while (x.size() > rscSize) {
        y.remove(x.size()-1);       
        centrex.remove(x.size()-1); 
        centrey.remove(x.size()-1); 
        speed.remove(x.size()-1);   
        phase.remove(x.size()-1);   
        divisor.remove(x.size()-1);
        x.remove(x.size()-1);       
      }
      randomise(x.size());
    }
  }
  
  
  void randomise(int rNum) {  
    
    int numCentres = int(random(1,rNum/2));    // how many centres should we have
    if (numCentres==0) numCentres=1;
    
    distanceMargin = random(10,200);

    for (int i=0; i<numCentres; i++) {
      if (centresX.size()<i+1) {
        centresX.add(0.0);
        centresY.add(0.0);
      }
      centresX.set(i, random(distanceMargin,width-distanceMargin));
      centresY.set(i, random(distanceMargin,height-distanceMargin));
    }
    
    while (centresX.size()>numCentres) {
      centresX.remove(centresX.size()-1);
      centresY.remove(centresY.size()-1);
    }
    

    //setup an initial value for each item in the array
    for (int i=0; i<rNum; i++) {
      int centreNum = int(random(0,numCentres));

      centrex.set(i, centresX.get(centreNum));      //width/2;
      centrey.set(i, centresY.get(centreNum));      //width/2;
      speed.set(i, random(0.2,2));   
      phase.set(i, random(TWO_PI));   
      divisor.set(i, random(0.5,10));
    }
  
  }


  
  void cycleMode() {
    if (this.drawMode == "Vertical") {
      this.drawMode = "Horizontal"; 
      return;
    }
    
    if (this.drawMode == "Horizontal") {
      this.drawMode = "Pixelator";
      return;
    }
  
    if (this.drawMode == "Pixelator") {
      this.drawMode = "Shuffler";
      return;
    }

    if (this.drawMode == "Shuffler") {
      this.drawMode = "Spinners";
      return;
    }
    
    if (this.drawMode == "Spinners") {
      this.drawMode = "Vertical";
      pixLines=0;
      pixStep=1;
      return;
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


