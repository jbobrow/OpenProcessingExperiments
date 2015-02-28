
PImage pic;       
int cellsize = 2; 
int cols, rows;   

void setup() {
  size(240, 180, P3D); 
  pic  = loadImage("Copus1.jpg"); 
  cols = width/cellsize;             
  rows = height/cellsize;            
}

void draw() {
  background(0);
  loadPixels();
  
  for ( int i = 1; i < cols;i++) {
   
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; 
      int y = j*cellsize + cellsize/2; 
      int loc = x + y*width;           
      color c = pic.pixels[loc];       
      
      float z = (mouseX/(float)width) * brightness(pic.pixels[loc]) - 100.0;
     
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(6,0,cellsize,cellsize);
      popMatrix();
    }
  }
}

