
//The Belousov-Zhabotinsky (BZ) in 3D, a second take on the first sketch.
//Coded after a inspirational processing workshop hosted by John Harding.
//Cellular automaton rules as presented in the August 1988 issue of Scientific American by Professor A. K. Dewdney
//Height of the grid represents the cell sate


//Grid Size
 
int HOR = 300;
int VER = 300;

int space = 2;
//BZ Constants
 
int mState = 100; // 0 - 255 100
int k1= 3; // 1-8  3
int k2= 3; // 1-8  3
int G= 32; // 0-100  32
 
 
int p = 0, q = 1;  // limbo world
 
 
float[][][][] jimmy = new float [HOR][VER][3][2];
 
// 2. Setup
  
void setup(){
 
  smooth();
  
  //size of applet
  size(space*HOR, space*VER, P2D);
  
   
  //initial condition
  for(int i=0; i<HOR; i++){
   for(int j=0; j<VER; j++){
    
     jimmy [i][j][0][p]= i * space;
     jimmy [i][j][1][p]= j * space;
     
     jimmy [i][j][0][q]= i * space;
     jimmy [i][j][1][q]= j * space;
      
     jimmy [i][j][2][p]= int(random(0,mState));
   
    }
   }
 
}
 
// 3. Draw
  
void draw(){
  
//      background(255);
//      fill(0);
//      stroke(0);
   
   //To Fade
   rectMode(CORNER);
   fill(255, 100);
   rect(0,0, 700, 600);
 
  // draw stuff
  for(int i=0; i<HOR; i++){
   for(int j=0; j<VER; j++){
     
     
      if (jimmy[(i+HOR)%HOR][(j+VER)%VER][2][p] == mState){
//      stroke(0);
//      strokeWeight(2);
//      point(jimmy [i][j][0][p], jimmy [i][j][1][p]);}
    
    rectMode(CENTER);
    fill (0); 
    rect(jimmy [i][j][0][p], jimmy [i][j][1][p],space-1,space-1);}
        
    
    }
   }
  
 
   
    // modify stuff
         
 
        for (int x = 0; x < HOR; x++) {
         for (int y = 0; y < VER; y++) {
                                  
 
               int a = 0;
               int b = 0;
               int s = 0;
  
                   // count infected cells
                         
                  for (int i = x - 1; i <= x+1; i++) {
                    for (int j = y - 1; j <= y+1; j++) {
                      
                      
                     if ((jimmy[(i+HOR)%HOR][(j+VER)%VER][2][p]> 0) && (jimmy[(i+HOR)%HOR][(j+VER)%VER][2][p]< mState)){
                        a = a + 1;}          
                      }
                        }
                         
                                  
                 // count ill cells
                    
                 for (int i = x - 1; i <= x+1; i++) {
                  for (int j = y - 1; j <= y+1; j++) {
           
                     if (jimmy[(i+HOR)%HOR][(j+VER)%VER][2][p] == mState){
                        b = b + 1;}          
                      }
                        }
                         
  
                  // Sum cell state and states in moore neighbourhood
                    
                  for (int i = x - 1; i <= x+1; i++) {
                    for (int j = y - 1; j <= y+1; j++) {
                      
                                      
                        s += jimmy [(i+HOR)% HOR][(j+VER)% VER][2][p];          
                      }
                        }
                          
         
         // the rules
  
         if (jimmy [x][y][2][p] == mState){  // ill
         jimmy [x][y][2][q] = 0;}
 
         else if  (jimmy [x][y][2][p] == 0){  // healthy
         jimmy [x][y][2][q] = int (a / k1) + int (b / k2);}
         else {jimmy [x][y][2][q] = int (s / (a + b + 1)) + G;}
            
         if (jimmy [x][y][2][q] > mState){ 
         jimmy [x][y][2][q] = mState;}
    
        }
      }
 
if (p == 0){
p = 1; q = 0;}
else {p = 0; q = 1;}

}



