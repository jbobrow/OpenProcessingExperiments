
// Code Written By: Chukwudi T. Unonu
// Date: 01/31/2012
// ARTT489i - Advanced Digital Imaging
// Instructor: Prof. Brandon Morse
// University of Maryland, College Park, MD
//
// Made With: Apple MAC OSX 10.5.8
// Processor 3.06 GHz Intel Core Duo
// Memory 4 GB 1067 MHZ DDR3
//
// <- This is a comment that procesing will NOT run. You can type any sort of note as you normall would in C++
// Let's Begin the program!!!

void setup()
{
  size(2000,2000);
  // color range is "0" to "255" (Red, Green, Blue)
  background(255,0,0);
  // The Above Is "Red"
  

  
}

void draw()
{
background (0,255,0);

  // Similar to Adobe (R) Illustrator (R), there's "stroke" and "fill'
stroke(0,0,0);
strokeWeight(5);
  // The point is a "x=200" and "y=200"
point (200,200);  


  // the following is a "line commnd"
line (100,100,500,500);
  // (start at "x,y" finish at "x,y")
  // it can have negative and positive integers, default is positive

//stroke(255,255,255);
//strokeWeight(5);
//point (400,400);
//line (500,500,100,100);

  // This is "filled objects"
  // "'Draws a rectangle to the screen. A rectangle is a four-sided shape with every angle at ninety degrees. 
  // By default, the first two parameters set the location of the upper-left corner, the third sets the width, 
  // and the fourth sets the height. These parameters may be changed with the rectMode() function.'"
  // "'Syntax:  rect(x, y, width, height)'"
  // Source <http://processing.org/reference/rect_.html>
  
fill(5,200,35);  
rect(30,20,55,55);

  // To remove the stroke outline for anything, type "noStroke();"


  // rectMode -> Modifies the location from which rectangles draw. The default mode is rectMode(CORNER), which specifies the location 
  // to be the upper left corner of the shape and uses the third and fourth parameters of rect() to specify the width and height. 
  // The syntax rectMode(CORNERS) uses the first and second parameters of rect() to set the location of one corner and uses the third 
  // and fourth parameters to set the opposite corner. The syntax rectMode(CENTER) draws the image from its center point and uses the 
  // third and forth parameters of rect() to specify the image's width and height. The syntax rectMode(RADIUS) draws the image from its 
  // center point and uses the third and forth parameters of rect() to specify half of the image's width and height. The parameter must 
  // be written in ALL CAPS because Processing is a case sensitive language. Note: In version 125, 
  // the mode named CENTER_RADIUS was shortened to RADIUS.
  // "'Syntax  	rectMode(MODE)'"
  // "'Parameters 	MODE 	Either CORNER, CORNERS, CENTER, or RADIUS'"
  // Source <http://processing.org/reference/rectMode_.html>

fill(100,222,100);  
rect(100,100,55,55);
rectMode(CORNERS);
noStroke();

  // Description: Draws an ellipse (oval) in the display window. An ellipse with an equal width and height is a circle. The first two parameters 
  // set the location, the third sets the width, and the fourth sets the height. The origin may be changed with the ellipseMode() function.
  // "'Syntax ellipse(x, y, width, height)'"
  // Source <http://processing.org/reference/ellipse_.html>

stroke(255,255,255);
fill(55,183,15);
ellipse(500,500,70,70);




//Now This Will be Freehand

  // Description: Displays shapes to the screen. The shapes must be in the sketch's "data" directory to load correctly. Select "Add file..." from the 
  // "Sketch" menu to add the shape. Processing currently works with SVG shapes only. The sh parameter specifies the shape to display and 
  // the x and y parameters define the location of the shape from its upper-left corner. The shape is displayed at its original size unless the 
  // width and height parameters specify a different size. The shapeMode() function changes the way the parameters work. A call to shapeMode(CORNERS), 
  // for example, will change the width and height parameters to define the x and y values of the opposite corner of the shape.
  // Note complex shapes may draw awkwardly with P2D, P3D, and OPENGL. Those renderers do not yet support shapes that have holes or complicated breaks.
  // Syntax shape(sh)
  //        shape(sh, x, y)
  //        shape(sh, x, y, width, height)


//verticies


}


