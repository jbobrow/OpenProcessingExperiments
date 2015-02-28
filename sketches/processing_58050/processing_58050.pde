
//import processing.opengl.*;
import peasy.*;



PeasyCam cam;

int cols = 40;
int rows = 40;
int stacks = 40;
int BrandMin = 100;                    // The minimum value to be assigned to the opacity valua
int BrandMax = 255;                   // The maximum value to be assigned to the opacity valua

Voxel Grid[][][] = new Voxel[cols][rows][stacks];



void setup() {
  //size(1000,1000,OPENGL);
  size(1000, 1000, P3D);
  frameRate(20);
  int distance = width / cols;

  cam = new PeasyCam(this, width/2, height/2, stacks*distance/2, 750); //generate the camera

//These define the 3D matrix within its axises
  for (int i=0; i<cols; i++) { //Axis X
    for (int j=0; j<rows; j++) { //Axis Y
      for (int k=0; k<stacks; k++) { //axis Z
      
        //The grid point position vector definition
        PVector gridPt = new PVector (i*distance, j*distance, k*distance); 
        
        // The voxel's identity, involving a location and the three cartesian identifiers
        Grid[i][j][k] = new Voxel(gridPt, i, j, k);
      }
    }
  }
}



void draw() {
  
  background (0);
  hint(DISABLE_DEPTH_TEST);
  
  for (int i=0; i<cols; i++) { //Axis X
    for (int j=0; j<rows; j++) { //Axis Y
      for (int k=0; k<stacks; k++) { //axis Z
        // The voxel's identity, involving a location and the three cartesian identifiers
        Grid[i][j][k].run();
      }
    }
  }
}

