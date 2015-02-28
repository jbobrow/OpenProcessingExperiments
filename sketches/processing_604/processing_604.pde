
//  Fizzy Numbers by Daniel Piker 09/11/08 - spacesymmetrystructure.wordpress.com
//  Have fun. Please let me know about any cool variations or developments you make
// 

int CellSize = 5;
int CellsAcross = 80;
int CellsDown = 80;
int BrushSize = 2;
int BrushStrength = 35;

int Calm = 233;        
// The higher this is, the longer it seems to take to turn 'fizzy'

float[] CellVal = new float[CellsAcross*CellsDown]; int CellIndex = 0;

void setup() {

  size(400,400);        // should = (CellsAcross * CellSize, CellsDown * CellSize);
  colorMode(HSB, 100);  // try switching this to RGB for a different look
  noStroke();
}

void draw() {
  for (int i = 0; i < CellsAcross; i++) {
    for (int j = 0; j < CellsDown; j++) {
      
      CellIndex = (CellIndex+1)%(CellsAcross*CellsDown);
      
int      klimp  = round(((CellVal[CellIndex])*4.7)%100);       
int      nifna  = round(((CellVal[CellIndex])*3.9)%100);
int      blugg  = round(((CellVal[CellIndex])*5.5)%100);
      // making these 3 values different factors of the cellvalue puts them out of synch - so they combine to give many colour variations
      // try changing the factors for different palettes
      
   drawCell(i, j, klimp, nifna, blugg);  
   
int   below      = (CellIndex+1)%(CellsAcross*CellsDown);
int   above      = (CellIndex+(CellsAcross*CellsDown)-1)%(CellsAcross*CellsDown);
int   left       = (CellIndex+(CellsAcross*CellsDown)-CellsDown)%(CellsAcross*CellsDown);
int   right      = (CellIndex+CellsDown)%(CellsAcross*CellsDown);
int   aboveright = ((CellIndex-1) + CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);
int   aboveleft  = ((CellIndex-1) - CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);
int   belowright = ((CellIndex+1) + CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);
int   belowleft  = ((CellIndex+1) - CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);

// These next 2 lines are the real heart of this sketch.
// By messing around with different factors and functions here, you can get wildly different results

float  NeighbourMix       =    pow((CellVal[left]*CellVal[right]*CellVal[above]*CellVal[below]*CellVal[belowleft]*CellVal[belowright]*CellVal[aboveleft]*CellVal[aboveright]),0.125);
       CellVal[CellIndex] = ((((sqrt(1*CellVal[CellIndex]))*(sqrt(NeighbourMix*1)))/1)+0.5)%Calm; 
   
    }
  }
}

   void drawCell(int x, int y, int klimpyness, int nifnacity, int bluggification) { 
    fill(klimpyness,nifnacity,bluggification);
    rect(x*CellSize, y*CellSize, CellSize, CellSize);  
}

void mouseDragged() {
    for (int i = 1-BrushSize; i < BrushSize; i++) {
    for (int j = 1-BrushSize; j < BrushSize; j++) {
if (mouseButton == LEFT) {
      drawCell(mouseX / CellSize + i, mouseY / CellSize + j, 100, 100,100);
      CellVal[getCellIndex (mouseX/CellSize + i,mouseY/CellSize + j)]         =  100; 
  } 
else if (mouseButton == RIGHT) {
  drawCell(mouseX / CellSize + i, mouseY / CellSize + j, 100, 0,0);
      CellVal[getCellIndex (mouseX/CellSize + i,mouseY/CellSize + j)]         =  0;             
      } 
    }
  }
}

  public int getCellIndex(int x, int y) {
    return abs(constrain(((x%CellsAcross) * CellsDown + (y%CellsDown)),0,(CellsAcross*CellsDown)));
}

