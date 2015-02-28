
//Libraries
//import processing.opengl.*;
import peasy.*;


// Declare arraylist
ArrayList Matrix = new ArrayList();



//Global variables
int MeshDivisions = 20;              // The number of subdivisions to the world box
int BrandMin = 0;                    // The minimum value to be assigned to the opacity value
int BrandMax = 10;                   // The maximum value to be assigned to the opacity value
PVector Bloc;                        // The position for each block
int Bsize = 2*height/MeshDivisions;  //The size for each block
int depth = 1000;                    // A 3rd coordinate to be used as the world depth
PeasyCam cam;                        //The camera to be used
int r;



///////////////////////////////////////////////////////////////////////////////////////
// SETUP /////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
void setup() {
  //size(depth, depth, OPENGL);
  size(1000,1000,P3D);
  frameRate(10);

  int depth = 2*height;         // A 3rd coordinate to be used as the world depth
  cam = new PeasyCam(this, width/2, height/2, depth/2, 750); //generate the camera
  //Work on how to get the camera to allways look at the average position of the agents

  ////// GENERATE THE FIELD AGENTS, ALL AT ONCE //////

  //Define the variables to use:
  //the size for each box, calculated dividing the overall box by the MeshDivision variable, and a randomized opacity factor
  int Bsize = 2*width/MeshDivisions;
  int Bopa = int(random (BrandMin, BrandMax));
  int maxVoxels = int(pow(MeshDivisions, 3));

  //// DEFINE THE THREE DIMENSIONAL GRID TO PLACE THE AGENTS
  for (int i = 0; i < MeshDivisions; i++) {
    for (int j = 0; j < MeshDivisions; j++) {
      for (int k = 0; k < MeshDivisions; k++) {
        //Generate agents and store them within the array (agentPop)
        Voxel P = new Voxel(new PVector(i*Bsize, j*Bsize, k*Bsize), Bsize);
        //Agent generator: Add agents until the specified number and then, stop.
        Matrix.add(P);
      }
    }
  }
}



///////////////////////////////////////////////////////////////////////////////////////
// DRAW  /////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
void draw() {
  ////// A black background, enable transparency, draw the overall box //////
  //Let's forget about the box from here on. It's not necessary anymore
  //  fill(255, 255, 255, 10);
  background(0);
  hint(DISABLE_DEPTH_TEST);
  //  pushMatrix();
  //  translate (width/2, height/2, depth/2);
  //  noStroke();
  //  box(width*2, depth*2, height*2 );
  //  popMatrix();


  ////// DRAW THE AGENTS AND RUN THE BEHAVIOURS INCLUDED //////
  for (int i = 1; i < Matrix.size(); i++) {
    Voxel P = (Voxel) Matrix.get(i);
    
    // move the drawing location to the centre for each Voxel
    pushMatrix();
    translate (P.Bloc.x, P.Bloc.y, P.Bloc.z);
    //run the agent
    P.run();
    //Move back
    popMatrix();
  }
}


