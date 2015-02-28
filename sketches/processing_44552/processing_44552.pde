
int columns, rows; 
PImage img;       // declare img.
int cellsize = 5; // cellsize 

void setup() {
  size(800, 600, P3D); 
  img = loadImage("stairs.jpg");  //load the image
  columns = img.width/cellsize;  // # of columns depends on width
  rows = img.height/cellsize;  // # of columns depends on hieght
  smooth();
}



void draw() {
  background(0);
  for ( int i = 0; i < columns; i++) {//loop
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/4;  
      int y = j*cellsize + cellsize/4;  
      int loc = x + y*img.width; //loc pixels
      color c = img.pixels[loc];  //take colours
      // calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX / float(width)) * brightness(img.pixels[loc]) - 100.0;//
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();//pushmatrix-> move previous pixels to new location
      translate(x + 0, y + 0, z);//move to 0,0
      fill(c, 95);//
      noStroke();
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}


