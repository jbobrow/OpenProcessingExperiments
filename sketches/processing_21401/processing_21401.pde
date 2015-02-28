
/**
 Uses nested loops to create a 3D model out of basic shapes.<br>
 Peasycam navigation: left-click and drag to rotate, right-click and drag (or use scroll-wheel) to zoom.<br>
 w: toggles wireframe/fill
 b: toggles boxes/rectangles
 Use keys 1-4 to switch between:<ol>
 <li>ellipsoid
 <li>cone
 <li>hyperboloid of one sheet
 <li>hyperboloid of two sheets
*/
import peasy.*;
PeasyCam cam;
boolean isWireFrame = false, isBoxes = true; //control display settings
int m = 1; //variable to hold the mode
int [][] p = { null,             //sets of parameters used to assemble the shape
  {32, 4, 200, -1,  6, 10,  6},  //place 0 holds number of layers
  {30, 3,   0,  1,  4,  5,  3},  //places 1-3 are constants used to determine radius
  {40, 2,  50,  1,  3,  6,  2},  //places 4-6 are constants for the height, width, and thickness of each block
  {40, 2, -20,  1,  3,  4,  3}}; //first set is empty so that numeration makes sense (i.e. starting at 1)
void setup()
{
  size(400, 400, P3D);
  rectMode(CENTER); //setting to draw rectangles based on center coordinate
  cam = new PeasyCam(this, 200); //define camera and set to intial view
  cam.setMaximumDistance(500); //set limit for zoom
}
void draw()
{
  background(0);
  lights();
  stroke(20, 100, 50);
  if(isWireFrame)
    noFill();
  else
    fill(50, 160, 80);
  translate(-p[m][0]*p[m][4]/2, 0, 0); //center figure on the screen
  for(int x = -p[m][0]/2; x < p[m][0]/2; x++) //loop through the layers
  {
    float r = p[m][1]*sqrt(p[m][2] + p[m][3]*x*x); //determine radius according to the current layer
    float idealWidth = TWO_PI*r/int(TWO_PI*r/p[m][5]); //determine ideal local block-width for equal spacing and no gaps
    rotateX(.1); //offset each layer slightly from the previous
    for(float i = 0; i < TWO_PI; i += idealWidth/r) //loop through the blocks in each layer
    {
      pushMatrix(); //save previous settings so we can return to them after drawing each block
      rotateX(i); //rotate around the circle
      if(isBoxes) //draw 3D boxes
      {
        translate(0, 0, r + p[m][6]/2); //position so that there is no overlap
        box(p[m][4], p[m][5], p[m][6]); //draw the box
      }
      else //draw 2D rectangles (runs faster at the cost of gaps)
      {
        translate(0, 0, r); //position to correct radius
        rect(0, 0, p[m][4], p[m][5]); //draw the rectangle
      }
      popMatrix(); //return to previous settings to draw next block
    }
    translate(p[m][4], 0, 0); //translate to the position of the next layer
  }
}
void keyPressed()
{
  if(key == 'w') //toggle wireframe
    isWireFrame = !isWireFrame;
  else if(key == 'b') //toggle boxes
    isBoxes = !isBoxes;
  for(int i = 49; i < 48 + p.length; i++) //check keys in the correct range
  {
    if(key == i && m != i - 48) //if it the key is in the range and the mode is not already set to the key
    {
      m = i - 48; //set the mode to the key
      cam.reset(1000); //pan back home in 1000 milliseconds
    }
  }
}

