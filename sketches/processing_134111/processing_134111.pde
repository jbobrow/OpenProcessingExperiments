
// crashCourse processing by Corneel Cannaerts 2014
// setup() and draw()

// eliipse()
// noStroke() and noFill() if you don't want to render stroke or fill
// colors can take an extra parameter that determines the alpha channel or transparency, 0 is transparant 255 is opaque
// mouseX and mouseY give the current coordinates of the mouse


// the setup gets executed once when the program starts
// we use this this to setup all things that won't change during the execution of the program
// such as size of the window, if the sketch uses a 2D or 3D renderer, ...
// note the {} brackets that define the scope of the function

void setup(){
  size(400,400);
  background(255);
}

// the draw loops continiously until we exit the 
// all { should be closed by a }
void draw(){
  //background(255);
  noStroke();
  fill(10,20,30, 50);
  ellipse(mouseX,mouseY,40,40);
}




