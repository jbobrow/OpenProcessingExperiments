
PImage img;      
int cellsize = 20; 
int cols, rows;

void setup() {
  size(500,500, P3D); 
  img  = loadImage("IMG_0733.JPG");
  cols = width/cellsize;             
  rows = height/cellsize;            
}

void draw() {
  background(0);
  loadPixels();
  
  for ( int a = 0; a < cols;a++) {
    for ( int b = 0; b < rows;b++) {
      int x = a*cellsize + cellsize/2; 
      int y = b*cellsize + cellsize/2; 
      int loc = x + y*width;           
      color c = img.pixels[loc];
      float z = (width/(float)width) * brightness(img.pixels[loc]) - 100.0;
      
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      box(cellsize);
      popMatrix();
    }
  }
}


