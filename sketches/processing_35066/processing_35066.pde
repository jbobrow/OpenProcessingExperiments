
//The Belousov-Zhabotinsky (BZ) in 3D, a second take on the first sketch.
//Coded after a inspirational processing workshop hosted by John Harding.
//Cellular automaton rules as presented in the August 1988 issue of Scientific American by Professor A. K. Dewdney
//Height of the grid represents the cell sate
 

import peasy.*;
PeasyCam cam;
PGraphics3D g3; 


//Grid Size
 
int HOR = 60;
int VER = 60;
int ZED = 60;
int space = 10;
//BZ Constants
 
int mState = 100; // 0 - 255 100
int k1= 3; // 1-8  3
int k2= 3; // 1-8  3
int G= 32; // 0-100  32
 
 
int p = 0, q = 1;  // Creates a limbo world to simulate simultaneity
 
 
float[][][][][] jimmy = new float [HOR][VER][ZED][4][2];
 
// 2. Setup
 
void setup(){
 
  frameRate (32);
  smooth();
  
  //size of applet
  size(800,600, P3D );
  
  
  cam = new PeasyCam(this, 1500);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(6000);
  cam.lookAt(VER*space/2, HOR*space/2, 0);
  cam.rotateX(0.35*PI);
  cam.rotateY(0.5*PI);
  
   
  //initial condition
  for(int i=0; i<HOR; i++){
   for(int j=0; j<VER; j++){
     for(int k=0; k<ZED; k++){
    
     jimmy [i][j][k][0][p]= i * space;
     jimmy [i][j][k][1][p]= j * space;
     jimmy [i][j][k][2][p]= k * space;
     
     jimmy [i][j][k][0][q]= i * space;
     jimmy [i][j][k][1][q]= j * space;
     jimmy [i][j][k][2][q]= k * space;
      
     
     jimmy [i][j][k][3][p]= int(random(0,mState));
   
    }
   }
  }
 
     ellipseMode(CENTER);
     rectMode(CENTER);
}
 
// 3. Draw
  
void draw(){
   
 
  rotateX(-.5);
  rotateY(-.5);
  
  background(255);
  fill(0);
  stroke(0);
    
   //camera(1500,1500,800,800,800,0.0, 1.0, 1.0, 0.0); 
   //camera(1200,1200,600+(frameCount*5),500,500,0.0, 1.0, 1.0, 0.0);
 
  // draw stuff
  for(int i=0; i<HOR; i++){
   for(int j=0; j<VER; j++){
    for(int k=0; k<VER; k++){
      
      if (jimmy[(i+HOR)%HOR][(j+VER)%VER][(k+ZED)%ZED][3][p] == mState){
      stroke(0,20);
      strokeWeight(4);
      point (jimmy [i][j][k][0][p], jimmy [i][j][k][1][p],jimmy [i][j][k][2][p]);}
      
      
//     pushMatrix(); 
//     translate(jimmy [i][j][k][0][p], jimmy [i][j][k][1][p],jimmy [i][j][k][2][p]); 
//     if (jimmy[(i+HOR)%HOR][(j+VER)%VER][(k+ZED)%ZED][3][p] == mState){
//     //fill(50,10);
//     strokeWeight(0.5);
//     stroke(0,20);
//     noFill();
//     box(space -2 );}    
//     popMatrix();
    }
   }
  }
  
  //draw bounding box
  pushMatrix();
  translate(HOR*space/2, VER*space/2, ZED*space/2);
  noFill();
  strokeWeight(1);
  stroke(0, 200, 255, 40);
  box(HOR*space, VER*space, ZED*space);
  popMatrix();
   
   
//  for(int i=0; i<HOR-1; i++){
//   for(int j=0; j<VER-1; j++){
// 
//     strokeWeight(0.5);
//     line(jimmy [i][j][0][p], jimmy [i][j][1][p], jimmy [i][j][2][p], jimmy [i+1][j][0][p],jimmy [i+1][j][1][p],jimmy [i+1][j][2][p]);
//     line(jimmy [i][j][0][p], jimmy [i][j][1][p], jimmy [i][j][2][p], jimmy [i][j+1][0][p],jimmy [i][j+1][1][p],jimmy [i][j+1][2][p]);
//    
// }
//  }
   
    // modify stuff
 
        for (int x = 0; x < HOR; x++) {
         for (int y = 0; y < VER; y++) {
           for (int z = 0; z < ZED; z++) {
                                        
 
               int a = 0;
               int b = 0;
               int s = 0;
 
                    
                   // count infected cells
                         
                  for (int i = x - 1; i <= x+1; i++) {
                    for (int j = y - 1; j <= y+1; j++) {
                      for (int k = z - 1; k <= z+1; k++) {
                      
                      
                     if ((jimmy[(i+HOR)%HOR][(j+VER)%VER][(k+ZED)%ZED][3][p]> 0) && (jimmy[(i+HOR)%HOR][(j+VER)%VER][(k+ZED)%ZED][3][p]< mState)){
                        a = a + 1;}          
                      }
                        }
                         }
                                  
                 // count ill cells
                    
                 for (int i = x - 1; i <= x+1; i++) {
                  for (int j = y - 1; j <= y+1; j++) {
                    for (int k = z - 1; k <= z+1; k++) {
           
                     if (jimmy[(i+HOR)%HOR][(j+VER)%VER][(k+ZED)%ZED][3][p] == mState){
                        b = b + 1;}          
                      }
                        }
                         }
  
                  // Sum cell state and states in moore neighbourhood
                    
                  for (int i = x - 1; i <= x+1; i++) {
                    for (int j = y - 1; j <= y+1; j++) {
                      for (int k = z - 1; k <= z+1; k++) {
                                      
                        s += jimmy [(i+HOR)% HOR][(j+VER)% VER][(k+ZED)%ZED][3][p];          
                      }
                        }
                          }
         
         // the rules
  
         if (jimmy [x][y][z][3][p] == mState){  // ill
         jimmy [x][y][z][3][q] = 0;}
 
         else if  (jimmy [x][y][z][3][p] == 0){  // healthy
         jimmy [x][y][z][3][q] = int (a / k1) + int (b / k2);}
         else jimmy [x][y][z][3][q] = int (s / (a + b + 1)) + G ;
            
         if (jimmy [x][y][z][3][q] > mState){ 
         jimmy [x][y][z][3][q] = mState;}
    
        }
      }
    }
 
 
if (p == 0){
p = 1; q = 0;}
else {p = 0; q = 1;}

}



