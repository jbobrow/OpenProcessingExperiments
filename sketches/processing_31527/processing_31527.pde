
/* ATTRACTOR POINT SKETCH
 This processing sketch will vary the size
 and vertical position of a grid of 2D shapes
 based on their proximity to the mouse. Mouse-clicks will change the colour range.*/


//--------------------------------------------------GLOBAL VARIABLES

//Define object colour (hex colours)
int Colour = #000000;
//Define object transparency value
int Transparency = 80;
//Define distance variable
int maxDistance = 200;





//---------------------------------------------------SETUP
//Define sketch within 600x600px and rendering engine to be P3D
void setup() {
  size(600, 600, P3D);
 }


//--------------------------------------------------DRAW LOOP

void draw() {
  //Define background to be black
  background(0);
  //Define drawn objects to be smooth
  smooth();
  //Define objects to be without fill (faster to render)
  noFill();
  //Define line (stroke) colour of drawn objects
  stroke(Colour);
  //Define lineweight of drawn objects
  strokeWeight(5);

  //Create loop beginning at 0, with 25px increments. Loop is named gridY and constrained by sketch height.
  for (int gridY=0; gridY<height; gridY=gridY+25)

  {
    //Create new loop within last, beginning at 0, with 25px increments. Loop is named gridX and constrained by sketch width.
    for (int gridX=0; gridX<width; gridX=gridX+25)

    {
      //Create two PVectors (types of drawn objects)
      PVector mousePos, shapePos;
      //Define mousePos with mouse coordinates
      mousePos = new PVector (mouseX, mouseY);
      //Define shapePos with grid coordinates
      shapePos = new PVector (gridX, gridY);
      
      //Define diameter of objects to be related to the distance between mousePos and shapePos.
      float diameter = dist(mousePos.x, mousePos.y, shapePos.x, shapePos.y);
      
      //Initiate pushMatrix to enable 3-dimensional shifts in coordinates
      pushMatrix();

      //Define diameter variables to be 20 times divided by the maxDistance variable.
      diameter = diameter*20/maxDistance;

      //Enable translate to allow height change
      translate(gridX, gridY, 0);
      
      //Define type of shape the objects are (circles) with coordinates and diameter variables.
      ellipse(0, 0, diameter, diameter);

      //Enable popMatrix at the end of loop for matrix to repeat.
      popMatrix();
    }
  }
}


//Define mouseMoved variables to enable changes when mouse cursor moves across sketch.
void mouseMoved() 
{ 
  //Define colour variable to increase in value by 250 (hex colours). 
  Colour = Colour + 250;   
  //When colour reaches a certain hue, it resets to black.
  if (Colour > #FFC022) { 
    Colour = 0; 
  } 
} 


//Define mousePressed variables to enable changes in object colour when mouse is left- or right-clicked.
void mousePressed() {
  //When mouse is left-clicked, colour resets to red hue.
  if(mouseButton == LEFT) {
    Colour = #F35255;
  } else {
    Colour = 0;
  }
  //When mouse is right-clicked, colour resets to blue hue.
  if (mouseButton == RIGHT) {
    Colour = #005aff;
  }

}



