
 /* Title: Sine and Cosine Animation
*By: Maria Fedorova, mfedorov@sfu.ca
*Date: October 3, 2012
*Created with Processing 1.5.1

*Description: Ellipses move along the curves that are controlled by sine and cosine functions that are generators for motion. 
*When mouse is pressed, coefficient responds
*to mouse click which creates various effects.
*/
  
  //Declare global variables
  int x=200;
  int y=200;
  int pointLocation=1;
  int coefficient=40;
  int offset=1;
  

void setup() {
  
  //Initialize canvas parameters;
  size(800, 300);
  //Fill background colour and stroke render
  background(0);
  stroke (0,0,0);    
}

void draw() {
   
  //Coefficient controls the amplitude of the curve.
  if(mousePressed)
  {
    coefficient = coefficient/4;
    if(coefficient < 5)
      coefficient = 40;
  }
   
  for (offset=1; offset<=height; offset+=70) {
  
    //println ("offset"+ offset);
    drawEllipseSin (pointLocation, offset);
    drawEllipseCos (pointLocation, offset);
 }
 //Once the ellipse reaches right boundary, return to the left boundary
 pointLocation=pointLocation+1;
 if (pointLocation >=width) {
      pointLocation=0;   
 }
 
//Define variables for random colors and fill ellipse 
//with random colours
 float r=random(255);
 float g = random(255);
 float b = random(255);
 
  fill (r,g,b);
  
 //Set frame rate 
 frameRate (70);
  
}
 
//Call Draw Ellipse function that will control sinusoid with set coeffisient, 
//ellipse size - 6
void drawEllipseSin(int x, int offset) {
     ellipse (x, sin ((float) x/coefficient)* coefficient+offset, 6, 6);     
}

//Call Draw Ellipse method that will control cosinusoid with set coeffisient, 
//ellipse size - 6
void drawEllipseCos(int x, int offset) {
     ellipse (x, cos ((float) x/coefficient)* coefficient+offset, 6, 6);    
}


