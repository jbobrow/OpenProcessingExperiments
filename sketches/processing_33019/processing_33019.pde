
//Performative Architecture Studio- Task 1
//By Kirilly Barnett
//Attractor Point Sketch_Black and White Invert

//Psuedocode provided by Performative Architecture Studio (The University of Melbourne).
//Research information gathered from Gennware Tutorials.
//Corrective coding from peers.
 
/*This processing sketch will vary the size and vertical position
 of 2D shapes based on their proximity to the mouse.
 It will also include a simple mouseClicked function to invert the 
 colour of the shape.*/

// GLOBAL VARIABLES
// Define global variables here as per Psuedocode.
int colour =255;
//int transparency = 150;     //Removed.Does not effect this code.
int maxDistance = 500;
int value = 255;              //Colour value for MouseClicked          

//SETUP
//Initialize variable. To happen once at the beginning of the code.

void setup() {
  size(600, 600, P3D);        //Window size and engine.
}

//DRAW
//Functions that draw and display in every frame

void draw() {

  background(204);            //Background colour, grey.
  //smooth();                 //Removed, preferred graphic quality when smooth() is not present.
  stroke(colour);           
  //noFill();                 //Removed, want fill to be visible
  fill (value);               //Fill colour
  strokeWeight(0);            

  /*The grid is created with the nested for() loops, the basic box diameter 
  is set to be smallest closest to the cursor and largest furthest from the cursor*/
  PVector mousePos, shapePos;
  for (int gridX=0; gridX<width; gridX=gridX+25) {         //Grid columns.
    for (int gridY=0; gridY<height; gridY=gridY+25) {      //Grid rows.
      mousePos = new PVector (mouseX, mouseY);             //Position of the cursor is the mousePos.
      shapePos = new PVector (gridX, gridY);               //Position of the shape is the shapePos.

//Diameter is scaled to produce more controlled results. 
//The diameter variable is a value of the distance between mousePos and shapePos.
      float diameter = dist(mousePos.x, mousePos.y, shapePos.x, shapePos.y);
      diameter = diameter*40/maxDistance;

//PushMatrix/ Pop Matrix allows 3D Translation to occur. 
//Translation is relative to the ellipses new position. 
      pushMatrix();
      translate(gridX, gridY, diameter*8);
// Ellipses are pushed closer to the screen the larger the diameter. 
      ellipse( 0, 0, diameter, diameter);
      popMatrix();
    }
  }
}

// Click within the image to change 
// the value of the rectangle after
// after the mouse has been clicked
//To invert the fill of the ellipses. 
void mouseClicked() {
  if (value == 0) {
    value = 255;
  } 
  else {
    value = 0;
  }
}


