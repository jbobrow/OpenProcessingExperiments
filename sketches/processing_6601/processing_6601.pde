
/**
 * Mona Lisa Cube
 * by Steven Kay
**/


int cellsize = 3; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system
PImage img;       // The source image 120x120
int EVERY=3;

void setup() {
  size(640, 640, P3D); 
  columns = 120;  // Calculate # of columns
  rows = 120;  // Calculate # of rows
  img = loadImage("Mona_Lisa.png");  // Load the image
  loop();
}

int fc=0;
void draw() {

  float fov = PI/4.5;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
  
  translate(320,320,-500);
  rotateZ((float)fc/100.0);
  rotateY((float)fc/110.0);
  rotateX((float)fc/120.0);
  // Begin loop for columns
  fc++;
 
  background(0);
  noStroke();
  rectMode(CENTER);
  

  for ( int i = 0; i < columns; i+=EVERY) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j+=EVERY) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position    
      int loc = i + j*img.width;  // Pixel array location
      color c = img.pixels[loc];  // Grab the color
      
      float z=0.0f; 
      fill(c);
      
      pushMatrix();
      translate(x,y, z);
      box(4);
      popMatrix();
      pushMatrix();
      translate(x,z,y);
      box(4);
      popMatrix();
      pushMatrix();
      translate(z,x,y);
      box(4);
      popMatrix();
      
      pushMatrix();
      translate(360-x,360-y, 360-z);
      box(4);
      popMatrix();
      pushMatrix();
      translate(360-x,360-z,360-y);
      box(4);
      popMatrix();
      pushMatrix();
      translate(360-z,360-x,360-y);
      box(4);
      popMatrix();
      
      
    }
  }
  
}


