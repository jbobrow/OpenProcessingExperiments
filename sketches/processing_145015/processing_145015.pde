
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/4578*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// Patricia Oakim, April 2014
// Originals: Angular Rectangular from Jeff Hendrickson, Sept 09 ---  based on orig code from Ira Greenberg. 
// This version has a class for the rectangle object and they bounce back from the edge of the canvas, making the drawing effect endless.
// Also added some interaction: depending on where the user clicks on the screen, the stroke color changes.

/*==============================================*/

//Create an array of rectangle objetcs (see Rectangle Class)
Rectangle[] arrayRects; 
int numRects = 400; 

// Create an array of different colors to fill the objetcs
color[]colors = new color[numRects];

void setup() {
  size(800, 600);
  smooth();
  frameRate(18); //change framerate from default 30

  //Create the Rectangle Objects
  arrayRects = new Rectangle[numRects];

  //Loop through the Rectangle array and set the parameters for each object -- defined in the Rectangle Class -- and define the colors
  for (int i=0; i < arrayRects.length; i++) {
    arrayRects[i] = new Rectangle(random(width), random(height), random(-1, 1), random(-1, 1), random(width/4), random(height/3));   
    colors[i] = color(random(80), random(150), random(70, 200), random(3, 3));
  }
}

void draw() { 

  //User interaction on mousePressed and mouseX position to change the stroke color
  if ((mousePressed == true) && (mouseX >= 400)) {
    stroke(103, 235, 70, 5);
  }
  else if ((mousePressed == true) && (mouseX <= 400)) {
    stroke(235, 235, 70, 13);
  } 
  else {
    stroke(255, 20, 50, 15);
  }

  //loop through the array setting the fill color and displaying each one of the objetcs
  for (int i=0; i < arrayRects.length; i++) {
    fill(colors[i]);
    arrayRects[i].displayRect();
  }
}







//Create Rectangle class and establish the parameters for size and speed
class Rectangle {
  float x;
  float y;
  float xDirection;
  float yDirection;
  float rectWidth;
  float rectHeight;

Rectangle(float _x, float _y, float _xDirection, float _yDirection, float _rectWidth, float _rectHeight){
  x = _x;
  y = _y;
  xDirection = _xDirection;
  yDirection = _yDirection;
  rectWidth = _rectWidth;
  rectHeight = _rectHeight;
}

void moveRect(){  
  //Move the objects by incrementing the position
  x += xDirection;
  y += yDirection;
  
  //Bounce objetcs if their location (X and Y) is at the edge of the canvas
  if (y >= height || y <= 0){
    yDirection = yDirection * -1;
  }
  if (x >= width || x<= 0){
    xDirection = xDirection *-1;
  }
}

void displayRect(){
  rect(x, y, rectWidth, rectHeight);
  moveRect();
}
}


