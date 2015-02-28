
PImage ritoque;
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system

void setup() {
  size (700, 399,P3D); 
  ritoque= loadImage("ritoque.jpg");
  cols = width/cellsize;              // Calculate # of columns
  rows = height/cellsize;             // Calculate # of rows
  noStroke();
  smooth();
}


void draw() {
  background(0);
  ritoque.loadPixels();

 
  for (int i = 0; i < cols; i++ ) {
   
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; 
      int y = j*cellsize + cellsize/2; 
      int loc = x + y*width;           
      color c = ritoque.pixels[loc];       

      // separación de pixeles
      float z = (height*0.8/(float)width) * brightness(ritoque.pixels[loc])- 100.0;
      
    float s = saturation(c) ;    
      pushMatrix();
      translate(x,y,z); 
      fill(c,s*4);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();

    }
  }
}






