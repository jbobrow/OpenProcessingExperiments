
//import processing.opengl.*;
import peasy.*;
PeasyCam cam;

int n = 20;
int n2 = 20;
boolean[][][] cell = new boolean[n][n][n2];
boolean[][][] cellN = new boolean[n][n][n2];

void setup(){
//  size(300,300,OPENGL);
 // hint(ENABLE_OPENGL_4X_SMOOTH);
  size(500,500,P3D);
  
  cam = new PeasyCam(this, 20,20,20,50);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(200);
  
  for(int i = 0; i<n; i++){
    for(int j = 0; j<n; j++){
      for(int k = 0; k<n2; k++){
        cell[i][j][k] = false;
      }
    }
  }
}

void draw(){
  background(0);
  lights();
  for(int i = 0; i<n; i++){
    for(int j = 0; j<n; j++){
      for(int k = 0; k<n2; k++){
        
        if(cell[i][j][k] == true){
          pushMatrix();
            translate(i*2,j*2,k*2);
            fill(255);
            // fill(255,100);
            box(2);
          popMatrix();
        }
        
        cell[n/2][n/2][n2/2] = true;
        int count = 0;
        for(int x = -2; x<= 2; x+=1){
          for(int y = -2; y<= 2; y+=1){
            for(int z = -2; z<= 2; z+=1){
              if(!(x == 0 && y == 0 && z == 0)){
                 if(cell[(i+x+n)%n][(j+y+n)%n][(k+z+n2)%n2] == true){
                   count++;
                 }
              }
            }
          }
        }
       
     if(count < 0 || count > 2){
       if(count == 1){
         cell[i][j][k] = false;
       }
     }
     else if(count == 1 || count == 2){
       cellN[i][j][k] = true;
     }
      }
    }
  }
      for(int i = 0; i<n; i++){
        for(int j = 0; j<n; j++){
          for(int k = 0; k<n2; k++){
            cell[i][j][k] = cellN[i][j][k];
          }
        }
      }
      
  }


