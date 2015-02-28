
/*
Program Title: A2-1
 Program Description: Using beginShape() and endShape(), create a composition
 with seven or more vertices.
 By Jillian Warren, September 28, 2012
 Comments: IAT 800 - Assignment 2
 */

 

// ***declare/call methods and fucnctions to be executed once
void setup () {
  size (600, 600);
  background (255);
  frameRate (6);
  smooth();
}//end setup


//***create procedure that will draw connected vertices and close them off as triangles, 
//will be called in draw
void drawShapes () {

  //declare and initialize local variables to be used as triangle vertex X and Y positions
  int xVertexValue = 0;
  int yVertexValue = 0;


  //begin drawing connected triancles which will have 7 vertices dictated by the for loop
  beginShape (TRIANGLE_STRIP); 

  for (int i = 0; i < 8; i++) {
    //reassign a new value to each variable each interation through the loop 
    xVertexValue = (int) random (width);
    yVertexValue = (int) random (height);
    vertex (xVertexValue, yVertexValue);
    changeColor();
  } //end for loop

  endShape (CLOSE);
} //end drawShapes



//***create a procedure to change the color of each triangle as it's drawn, 
//will be called in the for loop of drawShapes()
void changeColor() {

  //declare and initialize local variable
  int randomGrayScale = (int) random (10, 255);
  int fillOpacity = 100;
  int redFill = (int) random (255);
  int greenFill = (int) random (255);
  int blueFill = (int) random (255);

//create conditional to change colors based on user activity (integrating mouse input)
  if ( mousePressed ) {
    fill (redFill, greenFill, blueFill, fillOpacity);
  }//end if
  else {
    fill (randomGrayScale, fillOpacity);
  }//end else
  
}//end changeColor



//***call draw method which will call drawShapes to create triangles
void draw () {
  background (255);
  drawShapes ();
  //delay (600);
}



