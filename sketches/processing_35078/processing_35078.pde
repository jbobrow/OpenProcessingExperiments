
//The Belousov-Zhabotinsky (BZ) reaction mapped onto a diffusion surface.
//Coded after a inspirational processing workshop hosted by John Harding.
//Cellular automaton rules as presented in the August 1988 issue of Scientific American by Professor A. K. Dewdney
//Height of the grid represents the cell state.
 

import peasy.*;
import controlP5.*;
//import processing.opengl.*;
PeasyCam cam;
ControlP5 controlP5;
PMatrix3D currCameraMatrix;
PGraphics3D g3; 


//Grid Size
 
int HOR = 150;
int VER = 150;
int space = 1;
int d = 12;
float zScale = 1.5;

//BZ Constants
 
int mState = 100; // 0 - 255 100
int k1= 3; // 1-8  3
int k2= 3; // 1-8  3
int G= 32; // 0-100  32
 
 
int p = 0, q = 1;  // Creates a limbo world to simulate simultaneity
 
 
float[][][][] jimmy = new float [HOR][VER][3][2];
 
// 2. Setup
 
void setup(){
 
  background(0);
  smooth();
  
  //size of applet
  size(800,600, P3D);
  g3 = (PGraphics3D)g;
  
  
  cam = new PeasyCam(this, 1500);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(2000);
  cam.lookAt(VER*space*d/2, HOR*space*d/2, 500);
  cam.rotateX(PI);
  cam.rotateY(1.2*PI);


  controlP5 = new ControlP5(this);
  controlP5.addSlider("k1", 1, 8, 3, 650, 25, 100, 10);
  controlP5.addSlider("k2", 1, 8, 3, 650, 40, 100, 10);
  controlP5.addSlider("G", 1, 100, 32, 650, 65, 100, 10);
  controlP5.addSlider("d", 1, 20, 4, 650, 85, 100, 10);
  controlP5.setAutoDraw(false);
  
   
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
  
  rotateX(-.5);
  rotateY(-.5);
  colorMode(RGB,255);
  background(255);
  lights();
  fill(255, 0, 175);
  frameRate(12);

  for(int i=0; i<HOR-1; i++){
   for(int j=0; j<VER-1; j++){
      
      
      //fill(0,map(jimmy[i][j][2][p], 0, mState, 0, 255));
      colorMode(RGB, mState);
      
      strokeWeight(0.5);
      stroke(0);
      
      fill((jimmy[i][j][2][p]+10), 100);
      beginShape();
      vertex(jimmy [i][j][0][p]*d, jimmy [i][j][1][p]*d, jimmy[i][j][2][p]*zScale);
      vertex(jimmy [i][j][0][p]*d+d, jimmy [i][j][1][p]*d, jimmy[i+1][j][2][p]*zScale);
      vertex(jimmy [i][j][0][p]*d+d, jimmy [i][j][1][p]*d+d, jimmy[i+1][j+1][2][p]*zScale);
      vertex(jimmy [i][j][0][p]*d, jimmy [i][j][1][p]*d+d, jimmy[i][j+1][2][p]*zScale);
      endShape(CLOSE);
    }
  }


   
    // modify stuff (BZ Reaction)
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
                  
                     if (jimmy [(i+HOR)% HOR][(j+VER)% VER][2][p] == mState){
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
         else jimmy [x][y][2][q] = int (s / (a + b + 1)) + G ;
            
         if (jimmy [x][y][2][q] > mState){ 
         jimmy [x][y][2][q] = mState;}
 
    }
  }
 
    if (p == 0) {  // Creates a limbo world to simulate simultaneity
    p = 1; q = 0;}
    else {
    p = 0; q = 1;}
 
    gui();
    
}


void gui() {
   currCameraMatrix = new PMatrix3D(g3.camera);
   camera();
   controlP5.draw();
   g3.camera = currCameraMatrix;
}

void controlEvent(ControlEvent theEvent) {
  println(theEvent.controller().id());
}


