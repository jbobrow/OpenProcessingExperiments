

PImage img;       
int cellsize = 1; 
int cols, rows;   

void setup() {
  size(375,375,P3D);
  img = loadImage( "cake3.jpg" ); 
  cols = width/cellsize;              
  rows = height/cellsize;            
}

void draw() {
  background(0);
  img.loadPixels();

  // the rows
  for (int i = 0; i < cols; i++ ) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; 
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           
      color c = img.pixels[loc];      

      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX/(float)width) * brightness(img.pixels[loc])- 100.0;

      
     float constrain = ((float) mouseX/width) / 50.0; 
     c*= constrain;


      pushMatrix();
      translate(x,y,z); 
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();

    }
  }
}

