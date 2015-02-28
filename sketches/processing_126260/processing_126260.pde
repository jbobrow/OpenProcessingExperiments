

ArrayList lineAreas;
int numAreas;
int numAreasMin = 3;
int numAreasMax = 6;
int laYloc = 0;


void setup() {

  frameRate(12);
  
  colorMode(HSB,360,100,100);
  background(240,74,24);
  fill(240,74,24,40);
  
  size(240, 800);
  
  lineAreas = new ArrayList();
  
  int numLineAreas = (int) random(numAreasMin,numAreasMax);
  
  int laYLocInc = int((height/numLineAreas));
  laYloc = -laYLocInc/2;
  for (int i=0; i < numLineAreas; i++) {
     laYloc += int(height/numLineAreas);
     lineAreas.add(new LineArea(laYloc));
  }

}



void draw() {

  //pseudo-background
  noStroke();
  fill(240,74,24,40);
  rect(0,0,width,height);
  
  strokeWeight(1);
  
  //for each line area
  for (int s=0; s<lineAreas.size(); s++) {
     LineArea la = (LineArea) lineAreas.get(s); 
     la.draw();
  }

  //animate line area
}


//Line Area Class
class LineArea {  
  
  ArrayList lines;
  int meanx, meany, stdx, stdy, stdl, numLines;
  int meanl = 16;
  int xBoundLow,xBoundHigh,yBoundLow,yBoundHigh,halfSize, quarterSize;
  int numLinesMin = 12;
  int numLinesMax = 40;
  int pad = 10;
  int scrollFactor = 1;  //SCROLLFACTOR - WILL BE PASSED FROM JS
  float moveFactor = 0.2;
  int theHue;

  //CONSTRUCTOR
  LineArea(int initYloc) {
    
    stdx = (int) random(2,3);
    stdy = (int) random(2,3);
    stdl = (int) random(2,6);
    
    quarterSize = width/4;
    
    meanx = (int) random(quarterSize,(width-quarterSize));
    meany = initYloc;

    xBoundLow = meanx - quarterSize;
    xBoundHigh = meanx + quarterSize;
    yBoundLow = meany - quarterSize;
    yBoundHigh = meany + quarterSize;
    
    numLines = (int) random(numLinesMin,numLinesMax);
    
    lines = new ArrayList();
    
    for (int n=0; n < numLines; n++) {
       lines.add(new PVector(getGaussianMove((int) meanx, stdx, meanx),
                             getGaussianMove((int) meany, stdy, meany),
                             getGaussianLength((int) meanl, stdl, meanl))); 
    }
        
  }
  
  public void draw() {
             
    for (int l=0; l<lines.size(); l++) {
       PVector theline = (PVector) lines.get(l);
       int newX = getGaussianMove((int) theline.x, stdx, meanx);
       int newY = getGaussianMove((int) theline.y, stdy, meany);
       int newL = getGaussianLength((int) theline.z, stdl, meanl);
       
       if (newX < xBoundLow) { newX += stdx; }
       if (newX + newL > xBoundHigh) { newX -= stdx; }
       if (newY < yBoundLow) { newY += stdy; }
       if (newY + newL > yBoundHigh) { newY -= stdy; }
              
       
       //scrollfactor
       int scrollL = newL * scrollFactor;
       
       int halfLength = (int) newL/2;
       int scrollY = newY + scrollL;
       int horY = (scrollY/2) + (newY/2);
       
       //vert line
       stroke(240,int(random(0,50)),100);
       line(newX,newY,newX,scrollY);
       
       //hor line
       stroke(240,int(random(0,50)),100);
       line((newX-halfLength),horY,(newX+halfLength),horY);
       
       
       lines.set(l,new PVector(newX,newY,newL));

       
    }
    
    
  }
  
  public void updateScrollFactor(int newSC) {
     scrollFactor = newSC; 
  }
  
  //method to animate, manipulates local params
  //color

}

int getGaussianMove(int current, int std, int mean) {
  
  float val = random(-1,1);
  float sd = (float) std;                  // Define a standard deviation
  float x = ( val * sd );  // Scale the gaussian random number by standard deviation and mean; don't need to add mean b/c
                           //    we're storing the previous value and adding
                            
   return (int) x + current;
}

int getGaussianLength(int current, int std, int mean) {
  
  float val = random(-1,1);
  float sd = (float) std;                  // Define a standard deviation
  float x = ( val * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean
                           
  //if (x > sd) { x-= sd; }
 
   return (int) x;
}

