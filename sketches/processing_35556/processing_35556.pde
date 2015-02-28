
// Parametric Arch 
// by Nick Senske
// 3 Sepember 2011

//notes: I show the construction lines here for illustrative purposes
//      if you turned off the strokes, you'd have a nice solid arch

//      There is a slight bug in that you can make the cutout shape exceed the
//      entablature. This will have to do until we get conditionals.


void setup() {
  size(300, 300);
  rectMode(CORNERS); // CORNERS makes it easier to draw from the bottom of the screen 
}


// starting dimensions for arch
float archWidth = 50;
float archHeight = 200;
float archPierWidth = 40;

// I assign values to these later
float archEntab;
float archWay;


void draw() {
  background(220); // set background for animation
  
  // entablature is always larger than the piers
  archEntab = archPierWidth * 2.5;
  
  // piers
  fill(255);
  rect(archWidth, height, archWidth+archPierWidth, height-archHeight); 
  rect(width-archWidth, height, width-archWidth-archPierWidth, height-archHeight);
  
  // entablature goes on top of the piers
  rect(archWidth, height-archHeight, width-archWidth, height-archHeight-archEntab);
  
  // determine the radius of the ellipse to subtract the arch from the entablature
  archWay = (archWidth+archPierWidth) - (width-archWidth-archPierWidth);
  
  // arch cut-out shape
  fill(220);
  ellipse(width/2,height-archHeight, archWay, archWay);
  
  // set the primary arch variables using the mouse
  archWidth = mouseX/3;
  archHeight = height-mouseY-archEntab;
}

void mouseDragged() {
  // hold down the mouse to set the thickness of the piers
  archPierWidth = mouseX/4;
}


