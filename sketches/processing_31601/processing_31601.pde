
/* ATTRACTOR POINT SKETCH
This processing sketch will vary the size
and vertical position of a grid of 2D shapes
based on their proximity 
to the mouse. */

/* Slider bar controlled variables
Colour, Transparency, and gridSize*/

// by Mani Williams 2011
// based on Pseudocode provided by the Performative Architecture Studio

//-------------------------------------------------IMPORT UI LIB
// http://www.sojamo.de/libraries/controlP5
// by Andreas Schlegel 

import controlP5.*;
 
ControlP5 controlP5;

//--------------------------------------------------GLOBAL VARIABLES

//create a colour variable for our shape colour, 
//HEX
//Predefine to a light gray
public int Colour = #101010;

//create an integer variable for our shapes transparency, 
//Predefine to 80
public float Transparency = 80;

//Size of the objects and its distance

public int gridSize = 25;

//create an integer variable called maxDistance for 
//the falloff effect of the mouse, make it equal to 150
int maxDistance = 150;

//--------------------------------------------------SETUP
/* code contained inside of the setup function
will run ONCE at the start of your sketch */

void setup(){
  //initialise the processing sketch by setting the 
  //size to 600 x 600 and rendering engine to P3D
  size(600, 600, P3D);
  
controlP5 = new ControlP5(this);
// set up the slider parameters 
// ("variable",min,max,step,postionX,positionY,width,height)
controlP5.addSlider("Transparency",0,255,4.0,20,20,100,10);
controlP5.addSlider("gridSize",0,130,10,20,40,100,10);
controlP5.addSlider("Colour",#000000,#FFFFFF,#000010,20,60,100,10);
}

//--------------------------------------------------DRAW LOOP
/* code contained inside of the draw loop will
run every single frame */

void draw() {
  
  //set the background colour of our processing sketch to white
  background(255);
  //can smooth the shapes to create a less pixelated image
  //smooth();
  

    fill(Colour,Transparency);
    strokeWeight(0);


 
  //local variables
  PVector mousePos, shapePos;
  /*use two loops (a loop within another loop) to create a grid
  of shapes. The first loop will generate columns, the second will
  generate rows*/
  
  //create a for loop starting at 0, 
  //ending at the width of the sketch, 
  //stepping by # of pixels set by gridSize. 

  for (int gridX=0; gridX<width; gridX=gridX+gridSize)  {
 
    //within this loop create ANOTHER loop starting at 0,
    //ending at the height of the sketch, 
    //stepping by # of pixels set by gridSize.
 
    for (int gridY=0; gridY<height; gridY=gridY+gridSize)  {
      
    //create a variable for the size of the shape.
    /*lets draw an ellipse, so make this a 'float' variable 
    called diameter. We want to assign diameter variable
    a value that varies based on how far our shape is from 
    the mouse. To do this we use a processing function called
    "dist" that calculates the distance between two vectors*/

    //create a new PVector object called mousePos and make its 
    //x and y values equal to those of the mouse
    mousePos = new PVector(mouseX,mouseY);
    //create a new PVector object called shapePos and make its
    //x and y values equal to gridX and gridY
    shapePos = new PVector(gridX, gridY);
    //assign the diameter variable a value of the distance between
    //mousePos and shapePos
    float diameter = dist(mousePos.x,mousePos.y,shapePos.x,shapePos.y);
    /*now we will scale the value of our diameter variable to 
    produce some more controlled results */
    
    //scale diameter by
    //divide the value of the diameter variable by the global
    //maxDistance variable we created earlier
    //multiply the diameter variable by 40 
    
    diameter = diameter*40/maxDistance;
    
    //use pushMatrix to tell processing we are shifting the coordinates
    //of the sketch window. This lets us translate the the ellipses vertically
    //(normally ellipses can only be drawn in 2d)
    pushMatrix();
    //translate the coordinates of the screen to gridX, gridY and diameter * 5
    translate(gridX, gridY, diameter);
    //translate(gridX, gridY,0);
    
    //draw box/ellipse/rectangle at 0,0. width diameter, and height diameter
     // box(diameter, diameter, diameter);
    ellipse(0, 0, diameter, diameter);
    //rect(-1/2*diameter, -1/2*diameter, diameter, diameter);
    
    //run the popMatrix function to return the sketch coordinates to normal
    popMatrix();
    //end the gridY loop

    }
  //end the gridX loop
  }
  controlP5.draw();
}

/*And your done! Remember to test your sketch often by clicking play
and then fixing any syntax errors.*/



