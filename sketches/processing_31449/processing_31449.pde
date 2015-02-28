
/* ATTRACTOR POINT SKETCH
This processing sketch will vary the size
and vertical position of a grid of 2D shapes
(see the processing reference for ideas
for shapes to draw) based on their proximity 
to the mouse. */

//--------------------------------------------------GLOBAL VARIABLES
/* global variables can be called 
(accessed) from anywhere in your sketch. */

//create a colour variable for our shape colour, 
//make it equal to 255
float colour = 255;


//create an integer variable for our shapes transparency, 
//make it equal to 80

int transparency = 80;
//create an integer variable called maxDistance for 
//the falloff effect of the mouse, make it equal to 150

int maxDistance= 150;

//--------------------------------------------------SETUP
/* code contained inside of the setup function
will run ONCE at the start of your sketch */

void setup(){
  //initialise the processing sketch by setting the 
  //size to 600 x 600 and rendering engine to P3D
  size(600, 600, P3D);
}

//--------------------------------------------------DRAW LOOP
/* code contained inside of the draw loop will
run every single frame */

void draw() {
  
  //set the background colour of our processing sketch to 0
  background(255);

  //smooth the shapes to create a less pixelated image
  smooth();

  //prevent processing from filling the area within our shapes
  noFill();
  //set the stroke colour to our global variable
  stroke (colour); 
  //set the stroke weight to 1
  stroke(1);
  /*use two loops (a loop within another loop) to create a grid
  of shapes. The first loop will generate columns, the second will
  generate rows*/
  

  //create a for loop starting at 0, 
  //ending at the width of the sketch, 
  //stepping by 25 pixels. call the iterating variable gridY
  
    for (int gridY=0; gridY<height; gridY=gridY+25)  {
       
    //within this loop create ANOTHER loop starting at 0,
    //ending at the height of the sketch, 
    //stepping by 25 pixels. call the iterating variable gridX
    for (int gridX=0; gridX<width; gridX=gridX+25)  {
      
    //create a variable for the size of the shape.
    /*lets draw an ellipse, so make this a 'float' variable 
    called diameter. We want to assign diameter variable
    a value that varies based on how far our shape is from 
    the mouse. To do this we use a processing function called
    "dist" that calculates the distance between two vectors*/
float diameter;

    //create a new PVector object called mousePos and make its 
    PVector mousePos;
    //x and y values equal to those of the mouse
   mousePos = new PVector(mouseX,mouseY);
 
    //create a new PVector object called shapePos and make its
    PVector shapePos; 
    //x and y values equal to gridX and gridY
    shapePos = new PVector(gridX, gridY);

    //assign the diameter variable a value of the distance between
    //mousePos and shapePos
   diameter = dist(mousePos.x,mousePos.y,shapePos.x,shapePos.y);

    /*now we will scale the value of our diameter variable to 
    produce some more controlled results */
    
    //divide the value of the diameter variable by the global
    //maxDistance variable we created earlier
    

    //multiply the diameter variable by 40 (hint - this can be combined
    //with the last operation)
    diameter = diameter*40/maxDistance;

    //use pushMatrix to tell processing we are shifting the coordinates
    //of the sketch window. This lets us translate the the ellipses vertically
    //(normally ellipses can only be drawn in 2d)
    pushMatrix();

    //translate the coordinates of the screen to gridX, gridY and diameter * 5
    translate(gridX, gridY,0);

    //draw an ellipse at 0,0. width diameter, and height diameter
    ellipse (0,0,diameter, diameter);
    //run the popMatrix function to return the sketch coordinates to normal
     popMatrix();

    //end the gridY loop
    }
  //end the gridX loop
    }

}
/*And your done! Remember to test your sketch often by clicking play
and then fixing any syntax errors.*/



