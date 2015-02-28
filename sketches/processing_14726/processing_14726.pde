
public class Cube{
  //The Cube class. This class defines one cube for the track. Basically, it defines
  //the coordinates of a box based on the X and Y and Z locations, width and height passed
  //to the constructor. Also includes a boolean that can be changed to make the cubes
  //appear marked. (boolean makeRed)
  
  boolean dead;
  PVector center;
  PVector[] verts;   //Array of PVectors that store the X Y Z coordinates of
                     //each vertex in the cube. 
  
  //Constructor, takes the x and y and z coordinates given, and constructs a box
  //around them (considering x and y and z to be the bottom-near-left corner) with
  //a depth of cubeWidth, a width of cubeWidth, and a height of cubeHeight. 
  public Cube(float x, float y, float z, float cubeWidth, float cubeHeight){
    dead = false;
    verts = new PVector[8];
    verts[0] = new PVector(x, y, z);                                   //BNL
    verts[1] = new PVector(x+cubeWidth, y, z);                         //BNR
    verts[2] = new PVector(x+cubeWidth, y-cubeHeight, z);              //TNR
    verts[3] = new PVector(x, y-cubeHeight, z);                        //TNL
    verts[4] = new PVector(x, y, z-cubeWidth);                         //BFL
    verts[5] = new PVector(x+cubeWidth, y, z-cubeWidth);               //BFR
    verts[6] = new PVector(x+cubeWidth, y-cubeHeight, z-cubeWidth);    //TFR
    verts[7] = new PVector(x, y-cubeHeight, z-cubeWidth);              //TFL
    center = new PVector();
    center.x = verts[0].x+(verts[1].x-verts[0].x)/2;
    center.y = verts[3].y+(verts[0].y-verts[3].y)/2;
    center.z = verts[4].z+(verts[0].z-verts[4].z)/2;
  }
  
  //The Cube's handle() method. Sets up the renderer appropriately, then draws
  //the faces of the cube. 
  public void handle(PVector lightPoint){
    colorMode(HSB);                             //Sets the renderer's colorMode to HSB mode
    noStroke();                                 //Instructs Processing's renderer to not draw outlines.
    if(!dead){
    ////////////////////////////////////////////////////////
    //CUBE GEOMETRY DEFINITION                            //
    ////////////////////////////////////////////////////////
    beginShape();//States that you are starting a new shape. 
      //make the brightness of the face equivalent to 255 minus the 
      //distance between the front left point closest to y=0 and the PVector passed to the method.
      fill(255-pow(PVector.dist(verts[3], lightPoint), 1.05));
    vertex(verts[0].x, verts[0].y, verts[0].z);/////////////////////////////
    vertex(verts[1].x, verts[1].y, verts[1].z);// FRONT FACE              //
    vertex(verts[2].x, verts[2].y, verts[2].z);//                         //
    vertex(verts[3].x, verts[3].y, verts[3].z);/////////////////////////////
    endShape(CLOSE);//States that you are done drawing the current shape, and you wish for the shape to be closed off, hence a polygon.
    
    beginShape();//States that you are starting a new shape. 
      //make the brightness of the face equivalent to 255 minus the 
      //distance between the front left point closest to y=0 and the PVector passed to the method.
      fill(255-pow(PVector.dist(verts[0], lightPoint), 1.05));
    vertex(verts[0].x, verts[0].y, verts[0].z);/////////////////////////////
    vertex(verts[3].x, verts[3].y, verts[3].z);// LEFT FACE               //        
    vertex(verts[7].x, verts[7].y, verts[7].z);//                         //
    vertex(verts[4].x, verts[4].y, verts[4].z);/////////////////////////////
    endShape(CLOSE);//States that you are done drawing the current shape, and you wish for the shape to be closed off, hence a polygon.

    beginShape();//States that you are starting a new shape. 
      //make the brightness of the face equivalent to 255 minus the 
      //distance between the front left point closest to y=0 and the PVector passed to the method.
      fill(255-pow(PVector.dist(verts[0], lightPoint), 1.05));
    vertex(verts[1].x, verts[1].y, verts[1].z);/////////////////////////////
    vertex(verts[5].x, verts[5].y, verts[5].z);// RIGHT FACE              //
    vertex(verts[6].x, verts[6].y, verts[6].z);//                         //
    vertex(verts[2].x, verts[2].y, verts[2].z);/////////////////////////////
    endShape(CLOSE);//States that you are done drawing the current shape, and you wish for the shape to be closed off, hence a polygon.
    
    beginShape();//States that you are starting a new shape. 
      //make the brightness of the face equivalent to 255 minus the 
      //distance between the front left point closest to y=0 and the PVector passed to the method.
      fill(255-pow(PVector.dist(verts[3], lightPoint), 1.05));
    vertex(verts[2].x, verts[2].y, verts[2].z);/////////////////////////////
    vertex(verts[3].x, verts[3].y, verts[3].z);// TOP FACE                //       
    vertex(verts[7].x, verts[7].y, verts[7].z);//                         //
    vertex(verts[6].x, verts[6].y, verts[6].z);/////////////////////////////
    endShape(CLOSE);//States that you are done drawing the current shape, and you wish for the shape to be closed off, hence a polygon.
    }
  }
  
  //This method sets makeRed to true for the current cube object, causing it, in the handle method, to be fill()'ed to a redish color. 
  public void destroy(){
    dead = true;
  }
}
    
    
  

