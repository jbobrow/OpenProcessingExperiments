
//-----------------------------------------------------------------------------GENERAL VARIABLES
//Import the library to be used later in the agent (yet to be done, by the way)
import toxi.geom.*;

//define the image to be used (hope to find a way to make this dynamic to load a series)
String imagename = "hn03.jpg";

//define a multiplier to adapt the results
float multi = 0.11;

//Define a threshold to the operation
float luMax = 150;


//----------------------------------------------------------------------------GLOBAL DEFINITIONS
void setup() {
  //define "base" to be an image
  PImage base;
  //Define "base.jpg" to be loaded into base
  base = loadImage(imagename);
  //correct pixel arraylist content
  //loadPixels();
  //int wi = base.width;
  //int he = base.height;
  //size(wi, he, P3D);
  size(400, 578, P3D);
  background(base);
  loadPixels();
  
}

void draw() {
  //define variables to use
  float pixel;
  int pixelX;
  int pixelY;
  //Set a variable to store the luma value for each pixel 
  float luma;
  //Set a variable to accumulate the preceding luma values, starting from 0
  float lumAcum;
  lumAcum = 0;
  //Some more to improve performance and limit to a single loop
  noFill();
  noLoop();
  
  // First loop to advance in X axis
  for(pixelX = 0; pixelX < width; pixelX++) {
    
    // Second loop to evaluate in Y axis
    for(pixelY = 0; pixelY < height; pixelY++) {
      
      //Get the colour from each pixel in the row
      color pixelC = get(pixelX, pixelY);
      
      //Calculate luma factor per pixel
      luma = (0.3 * red(pixelC) + 0.59 * green(pixelC) + 0.11 * blue(pixelC))*multi;
      
      //calculate luma acumulated in the pass
      lumAcum = lumAcum + luma;
      
      // If the accumulated luma overpasses the threshold defined, 
      //draw a shape (an agent in the near future) located in space
      //using a translation value equivalent to a proportion of the
      //luma value and colouring it according to that.
      if(lumAcum >= luMax) {
        translate(0,0,-luma);
        stroke(sq(luma)*multi*2, 0, 0);
        ellipse (pixelX, pixelY, sq(luma)*multi, sq(luma)*multi);
        translate(0,0,luma);
        
        //marker(pixelX, pixelY, Zpos); [this should be the line to call the agent]
        
        //reset the accumulated luma value
        lumAcum = 0;
        
      }
      
      
    }
    
    
    
  }
  
  
}

