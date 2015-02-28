
/*Mouse-over activities
We can can check the continually update value of the cursor (mouseX, mouseY) to see if the 
cursor ever falls inside the box.  We can construct a function that will return a boolean value
of true if the rect is moused-over and false if the rect is not moused-over.
*/

//We need to declare some global variables here to hold some data

int x, y; //for the x and y coordinates of the mouse
int xBox, yBox, h, w; //the postion (from CENTER) of the rect, and the height and width
boolean isCovered; //a boolean (true or false) value to test if the mouse-over is occurring

void setup() { //your standard setup routine
  size(400, 400); //set the render size to 400x400 pixels
  isCovered = false; //set the initial value of isCoverd to false, that is NOT covered
  smooth(); //make it a smooth render . . .
}

void draw() { //here is your looping draw statement
  rectMode(CENTER); //let's render our rectangles from the center of the rectangle
  rect(width/2, height/2, 100, 100); //this will put a rectangle in the middle of the render screen
  x = mouseX; //x will be updated to mouseX
  y = mouseY; //y will be updated to mouseY
  
  //Here we call the function boxOver() and print it's value, a boolean true/false
  println(boxOver(x, y, width/2, height/2, 100, 100));
  
  //Here we call the function boxOver() and set some interaction via a if/else combination
  if (boxOver(x, y, width/2, height/2, 100, 100) == false) { //if boxOver() is false, the fill is white
    fill(255);
  }
  else {  //else, if boxOver() returns true, then fill the box black
    fill(0);
  }
} 

/*Here is the boxOver function, you can use it to check a rect of any size and shape.  This is the 
beauty of functions, you can take them and use them in other programs/sketches.  Write once, use
many times!

boxOver takes six arguements, all are ints:

xPos, the point to check if covering the box
yPos, the point to check is covering the box

xBox, the x position of the box, the X centerpoint
yBox, the y position of the box, the Y centerpoint

h is the height of the box
w is the width of the box
NOTE:  we can not use "height" and "width", because these are special words reserved to Processing
*/

boolean boxOver(int xPos, int yPos, int xBox, int yBox, int h, int w) {
  if (xPos > (xBox - w/2) && xPos < (xBox + w/2) && yPos > (yBox - h/2) && yPos < (yBox + h/2)) {
    isCovered = true;
  }
  else {
    isCovered = false;
  }
  return isCovered;
}

//if the x and y points are in the boundaries as defined by the if statment, then isCovered = true
//else (otherwise) isCovered = false



