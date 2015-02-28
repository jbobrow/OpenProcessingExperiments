
/** Jerry Pierre-Charles..I mmade some slight changes 
 * Explode 
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls breaking apart of image and 
 * Maps pixels from a 2D image into 3D space. Pixel brightness controls 
 * translation along z axis. 
 */
 
PImage img;       
int cellsize = 2; 
int columns, rows;   

void setup() {
  size(640, 360, P3D); 
  img = loadImage("me.jpg");  
  columns = img.width / cellsize;  
  rows = img.height / cellsize;  
}

void draw() {
  background(0);
 
  for ( int i = 0; i < columns; i++) {
    
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/4;  
      int y = j*cellsize + cellsize/4;  
      int loc = x + y*img.width; 
      color c = img.pixels[loc]; 
      float z = (mouseX / float(width)) * brightness(img.pixels[loc]) - 40.0;
     
      pushMatrix();
      translate(x + 50, y + 25, z);
      fill(c, 104);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}



