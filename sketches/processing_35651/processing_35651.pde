
void setup() {
  size(400, 400);
  rectMode(CORNERS); 
}

// starting dimensions for arch
float archWidth = 200;
float archHeight = 400;
float archPierWidth = 60;
 
// I assign values to these later
float archEntab;
float archWay;

void draw() {
  background(0,mouseX,mouseY); // set background for animation
   
  // entablature is always larger than the piers
  archEntab = archPierWidth * 2.5;
   
  //extra shape to move throughout the background
  fill(255,255,mouseY-100);
  noStroke();
  ellipse(mouseX,mouseX,20,20); 
   
  // piers
  fill(mouseY,mouseX,255);
  rect(archWidth, height, archWidth+archPierWidth, height-archHeight);
  rect(width-archWidth, height, width-archWidth-archPierWidth, height-archHeight);
   
  // entablature goes on top of the piers
  rect(archWidth, height-archHeight, width-archWidth, height-archHeight-archEntab);
   
  // determine the radius of the ellipse to subtract the arch from the entablature
  archWay = (archWidth+archPierWidth) - (width-archWidth-archPierWidth);
   
  // arch cut-out shape
  fill(0,mouseX,mouseY);
  ellipse(width/2,height-archHeight, archWay, archWay);
   
  // set the primary arch variables using the mouse
  archWidth = mouseX/3;
  archHeight = height-mouseY-archEntab;
}
 
void mouseDragged() {
  // hold down the mouse to set the thickness of the piers
  archPierWidth = mouseX/4;
}

	


