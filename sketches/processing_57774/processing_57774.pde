
//Emily Nicholishen Problem Set 3, Question 3
//REMIX
/*
 * 
 * Mouse horizontal location controls breaking apart of image and 
 * Maps pixels from a 2D image into 3D space. Pixel brightness controls 
 * translation along z axis. 
 */
 
PImage img;      
int cellsize = 5; // I made the dimensions of each cell larger
int columns, rows;   

void setup() {
  size(662, 566, P3D); //make program same size as source image
  img = loadImage("timeline_profile_picture2.jpg");  // Load my image
  columns = img.width / cellsize; 
  rows = img.height / cellsize;  
}

void draw() {
  background(0);
  for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2; 
      int y = j*cellsize + cellsize/2;  
      int loc = x + y*img.width; 
      color c = img.pixels[loc]; 
      float z = (mouseY / float(width)) * brightness(img.pixels[loc]) + 20.0;
      // I manipulated this so that now the mouse's Y location distorts the image
      pushMatrix();
      translate(x, y, z);
      // removing the translation, my image does not have black border anymore
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}

