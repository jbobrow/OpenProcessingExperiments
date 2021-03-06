
/**
 * Explode 
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls breaking apart of image and 
 * Maps pixels from a 2D image into 3D space. Pixel brightness controls 
 * translation along z axis. 
 */

// The next line is needed if running in JavaScript Mode with Processing.js
//@pjs preload="eames.jpg";  

PImage img;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system
int presed = 0;
int relative = 0;

void setup() 
{
  size(640, 360, P3D); 
  img = loadImage("LOGOWEB.png");  // Load the image
  columns = img.width / cellsize;  // Calculate # of columns
  rows = img.height / cellsize;  // Calculate # of rows
  background(0);
  //popMatrix();
}

void draw() 
{

    if (presed == 1)
    {
      relative = relative+ 20;
      background(0);
    
      // Begin loop for columns
      for ( int i = 0; i < columns; i++) 
      {
        // Begin loop for rows
        for ( int j = 0; j < rows; j++) 
        {
          int x = i*cellsize + cellsize/2;  // x position
          int y = j*cellsize + cellsize/2;  // y position
          int loc = x + y*img.width;  // Pixel array location
          color c = img.pixels[loc];  // Grab the color
  
          float z = (relative  / float(width)) * brightness(img.pixels[loc]) - 20.0;
          // Translate to the location, set fill and stroke, and draw the rect
          pushMatrix();
          translate(x + 200, y + 100, z);
          fill(c, 204);
          noStroke();
          rectMode(CENTER);
          rect(0, 0, cellsize, cellsize);
          popMatrix();
          millis();
        }
      }
        
        
        if (relative > 3000)
        {
          relative = 0;
          presed = 0;
        }
    }  
}


void mousePressed() 
{

  presed = 1;
  
}


void Redraw_logo ()
{
}

