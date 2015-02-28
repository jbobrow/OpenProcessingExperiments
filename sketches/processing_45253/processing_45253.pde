
PImage img;       
int cellsize = 5; 
int cols, rows;   

void setup() {
 
  img = loadImage( "cells.jpg" ); 
  cols = img.width/cellsize;             
  rows = img.height/cellsize;    
  
  size(500,450, P3D);  
}

void draw() {
  background(0);
  img.loadPixels();

  for(int i=img.pixels.length-1;i>500;i--){
img.pixels[i]=img.pixels[i-500];
}
  for (int i = 0; i < cols; i++ ) {
   
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/10; 
      int y = j*cellsize + cellsize/10; 
      int loc = x + y*width;           
      color c = img.pixels[loc];      

     
      float z = (mouseX/(float)width) * brightness(img.pixels[loc])+ 100.0;


      pushMatrix();
      translate(x,y,z); 
      fill(c);
      stroke(c);
      ellipseMode(CENTER);
      ellipse(0,0,cellsize,cellsize);
      popMatrix();
    
    }
    //saveFrame();
  }
  saveFrame();
}

