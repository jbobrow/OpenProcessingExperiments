
PImage Sydney;
int cellsize = 2; 
int columns, rows;   

void setup() {
  size(800, 600, P3D); 
  Sydney = loadImage("Sydney.jpg");
  columns = width/cellsize;            
  rows = height/cellsize;            
}

void draw(){
  background(255);
  loadPixels();
  for ( int i = 0; i < columns;i++) {
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/5; 
      int y = j*cellsize + cellsize/5; 
      int loc = x + y*width;          
      color c = Sydney.pixels[loc];     
      float z = (random(5)/(float)width*4) * brightness(Sydney.pixels[loc]) - 10;
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(random(5),random(5),cellsize,cellsize);
      popMatrix();
    }
  }
}


