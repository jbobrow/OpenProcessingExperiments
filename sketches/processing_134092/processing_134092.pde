
// crashCourse processing by Corneel Cannaerts 2014
// setup() and draw()

// size() is also a function (rightclick > find in reference... to see a description + example)
// rect() draw rectangle
// fill() fill color of shape
// strokeWeight determines the weight of a line


// the setup gets executed once when the program starts
// we use this this to setup all things that won't change during the execution of the program
// such as size of the window, if the sketch uses a 2D or 3D renderer, ...
void setup(){
  size(400,400);
  
}

// the draw loops continiously until we exit the program
void draw(){
  background(0);
  strokeWeight(4);
  stroke(250,255,174);
  fill(10,205,189);
  rect(100,100,200,200);
}




