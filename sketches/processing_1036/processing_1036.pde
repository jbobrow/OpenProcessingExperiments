
//  'Difference Between Neighbours' 
//  by Daniel Piker 12/11/08 - spacesymmetrystructure.wordpress.com
//  Have fun. Please let me know about any cool variations or developments you make
//  (email danielpiker--at--yahoo--dot--co--dot--uk)
//  This code is a little messy. If you're looking to learn from or adapt this, I recommend
//  looking first at the earlier version 'fizzynumbers' which is also on the openprocessing site.
//  Its a bit tidier and more clearly annotated. The only real difference here is the quad and vector stuff.
int CellSize = 17;
int CellsAcross = 30;
int CellsDown = 30;
int BrushSize = 2;
int BrushStrength = 35;
int Calm = 130;        // The higher this is, the longer it seems to take to turn chaotic

float[] CellVal = new float[CellsAcross*CellsDown]; int CellIndex = 0;

void setup() {

  colorMode(HSB, 100);  
  size(560,560);//(50+CellsAcross * CellSize,50+ CellsDown * CellSize);
  noStroke();
}

void draw() {
  fill(0,0,0);
  rect (0,0,50+CellsAcross * CellSize,50+ CellsDown * CellSize);
  for (int i = 0; i < CellsAcross; i++) {
    for (int j = 0; j < CellsDown; j++) {
      
      CellIndex = (CellIndex+1)%(CellsAcross*CellsDown);
      
int      klimp  = round(((CellVal[CellIndex])*2.1)%100);       
int      nifna  = round(((CellVal[CellIndex])*2.2)%100);
int      blugg  = round(((CellVal[CellIndex])*2.4)%100);
      // making these 3 values close but not equal factors of the cellvalue puts them out of synch - so they combine to give many colour variations
      // try changing the factors for different palettes      
   
int   below      = (CellIndex+1)%(CellsAcross*CellsDown);
int   above      = (CellIndex+(CellsAcross*CellsDown)-1)%(CellsAcross*CellsDown);
int   left       = (CellIndex+(CellsAcross*CellsDown)-CellsDown)%(CellsAcross*CellsDown);
int   right      = (CellIndex+CellsDown)%(CellsAcross*CellsDown);
int   aboveright = ((CellIndex-1) + CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);
int   aboveleft  = ((CellIndex-1) - CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);
int   belowright = ((CellIndex+1) + CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);
int   belowleft  = ((CellIndex+1) - CellsDown +(CellsAcross*CellsDown))%(CellsAcross*CellsDown);

float CellVectorX   = (CellVal[right]-CellVal[left]); 
float CellVectorY   = (CellVal[above]-CellVal[below]);

   drawCell(i+2, j+2, klimp, nifna, blugg, CellVectorX, CellVectorY);  
      
// These next 2 lines are the real heart of this sketch.
// By messing around with different factors and functions here, you can get wildly different results

float  NeighbourMix       =    pow((CellVal[left]*CellVal[right]*CellVal[above]*CellVal[below]*CellVal[belowleft]*CellVal[belowright]*CellVal[aboveleft]*CellVal[aboveright]),0.125);
       CellVal[CellIndex] = ((((sqrt(1*CellVal[CellIndex]))*(sqrt(NeighbourMix*1)))/1)+0.5)%Calm; 
   
    }
  }
}

   void drawCell(int x, int y, int klimpyness, int nifnacity, int bluggification, float VectorX, float VectorY) { 
    fill(klimpyness,80,100);
  //  noStroke();
//    rect(x*CellSize, y*CellSize, CellSize, CellSize);  
    
    quad(                  x*CellSize+CellSize*0.7*(VectorX/pow((sq(VectorX)+sq(VectorY)),0.35)),
                           y*CellSize+CellSize*0.7*(VectorY/pow((sq(VectorX)+sq(VectorY)),0.35)),
                           
                           x*CellSize+CellSize*0.2*(VectorY/pow((sq(VectorX)+sq(VectorY)),0.5)),
                           y*CellSize-CellSize*0.2*(VectorX/pow((sq(VectorX)+sq(VectorY)),0.5)),
                           
                           x*CellSize-CellSize*0*(VectorX/pow((sq(VectorX)+sq(VectorY)),0.7)),
                           y*CellSize-CellSize*0*(VectorY/pow((sq(VectorX)+sq(VectorY)),0.7)),
                           
                           x*CellSize-CellSize*0.2*(VectorY/pow((sq(VectorX)+sq(VectorY)),0.5)),
                           y*CellSize+CellSize*0.2*(VectorX/pow((sq(VectorX)+sq(VectorY)),0.5))
                           );
    
    
    //stroke(0,0,0);
   // triangle((x*CellSize)-(VectorX/10), (y*CellSize)-(VectorY/10),(x*CellSize)+(VectorX/10), (y*CellSize)+(VectorY/10),(x*CellSize)-(VectorY/10), (y*CellSize)-(VectorX/10));
   //triangle(x*CellSize+0.3*(rightb-leftb),y*CellSize+0.3*(aboveb-belowb),x*CellSize+5,y*CellSize+5,x*CellSize,y*CellSize);
   //line(x*CellSize, y*CellSize, x*CellSize+  CellSize*(VectorX/ pow((sq(VectorX)+sq(VectorY)),0.4) )   , y*CellSize+CellSize*(VectorY/ pow((sq(VectorX)+sq(VectorY)),0.4) ));
}

void mouseDragged() {
    for (int i = 1-BrushSize; i < BrushSize; i++) {
    for (int j = 1-BrushSize; j < BrushSize; j++) {
if (mouseButton == LEFT) {
      drawCell(mouseX / CellSize + i, mouseY / CellSize + j, 100, 100,100,0,0);
      CellVal[getCellIndex (mouseX/CellSize + i,mouseY/CellSize + j)]         =  100; 
  } 
else if (mouseButton == RIGHT) {
  drawCell(mouseX / CellSize + i, mouseY / CellSize + j, 100, 0,0,0,0);
      CellVal[getCellIndex (mouseX/CellSize + i,mouseY/CellSize + j)]         =  0;             
      } 
    }
  }
}

  public int getCellIndex(int x, int y) {
    return abs(constrain(((x%CellsAcross) * CellsDown + (y%CellsDown)),0,(CellsAcross*CellsDown)));
}

