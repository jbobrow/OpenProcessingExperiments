
 PImage img;       
int cellsize = 1; 
int columns, rows;   

void setup() {
  size(700, 500, P3D); 
  img = loadImage("1.png");  
  columns = img.width / cellsize;  
  rows = img.height / cellsize;  
}

void draw() {
  background(255);
  for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/5;  
      int y = j*cellsize + cellsize/5;  
      int loc = x + y*img.width;  
      color c = img.pixels[loc];  
      float z = (mouseX / float(width)) * brightness(img.pixels[loc]) - 5.0;
      pushMatrix();
      translate(x + 200, y + 100, z);
      fill(random(120));
      noStroke();
      rect(0, 0, cellsize, cellsize);
      smooth();
      popMatrix();
      
    }
  }
}

