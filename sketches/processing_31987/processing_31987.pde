
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
int colour = 255;

//create an integer variable for our shapes transparency, 
//make it equal to 80
int transparency = 80;

//create an integer variable called maxDistance for 
//the falloff effect of the mouse, make it equal to 150
int maxDistance = 150;

//--------------------------------------------------SETUP
/* code contained inside of the setup function
will run ONCE at the start of your sketch */


void setup(){
  
  //initialise the processing sketch by setting the 
  //size to 600 x 600 and rendering engine to P3D
    size(600,600,P3D);
    frameRate(10);
 }

//--------------------------------------------------DRAW LOOP
/* code contained inside of the draw loop will
run every single frame */
void draw(){
  
  
  //set the background colour of our processing sketch to 0
  //smooth the shapes to create a less pixelated image
  //prevent processing from filling the area within our shapes//not done
    background (colour);
 

 //set the stroke colour to our global variable//kept as 250
  //set the stroke weight to 1
    stroke(250);
  strokeWeight (0);
  
  //create  PVector object called mousePos   
 //create a  PVector object called shapePos
    PVector shapePos; 
 PVector mousePos;
  
  
  /*use two loops (a loop within another loop) to create a grid
  of shapes. The first loop will generate columns, the second will
  generate rows*/
  
  //create a for loop starting at 0, 
  //ending at the width of the sketch, 
  //stepping by 25 pixels. call the iterating variable gridY
  
    //within this loop create ANOTHER loop starting at 0,
    //ending at the height of the sketch, 
    //stepping by 25 pixels. call the iterating variable gridX
    for (int gridX = 0; gridX < width; gridX = gridX + 40){
    for (int gridY = 0; gridY < height; gridY = gridY + 40){
      
      
          //if and else to give different colours to boxes after every 100pixels, to create the 7 colour rainbow effect
            if (gridX < 100){
        fill (255,63,0,70);
      }
    else if ( gridX >=100 && gridX<200){
    fill (255,127,0,70);
    }
    else if ( gridX >=100 && gridX<200){
    fill (255,191,0,70);
    }
    else if ( gridX >=200 && gridX<300){
    fill (255,255,127,70);
    }
    else if ( gridX >=300 && gridX<400){
    fill (191,255,0,70);
    }
    else if ( gridX >=400 && gridX<500){
    fill (0,255,127,70);
    }
    else {
    fill (0,255,191,70);
    }
     
 //create a new PVector object called mousePos and make its 
    //x and y values equal to those of the mouse
    
    //create a new PVector object called shapePos and make its
    //x and y values equal to gridX and gridY
  shapePos= new PVector (gridX, gridY);
 mousePos= new PVector (mouseX, mouseY);
 
 
 /*now we will scale the value of our diameter variable to 
    produce some more controlled results */
    
    //divide the value of the diameter variable by the global
    //maxDistance variable we created earlier
    
    //multiply the diameter variable by 40 (hint - this can be combined
    //with the last operation) 
float distance = PVector.dist(mousePos, shapePos);
  float diameter = 40*distance/ maxDistance;
  
  
//use pushMatrix to tell processing we are shifting the coordinates
    //of the sketch window. This lets us translate the the ellipses vertically
    //(normally ellipses can only be drawn in 2d)
    
    //translate the coordinates of the screen to gridX, gridY and diameter * 5//-50 is kept for Z-axis to have white areas in corner when mouse is taken there so that each box can be seen individually

    //draw an ellipse at 0,0. width diameter, and height diameter             //3D box is created instead of ellipse
    
    //run the popMatrix function to return the sketch coordinates to normal
    pushMatrix();
 translate (gridX, gridY, -50);
 box(diameter);
  popMatrix();
  
  
  
    //end the gridY loop
  
  //end the gridX loop

}
}

}
  //Done.
  

