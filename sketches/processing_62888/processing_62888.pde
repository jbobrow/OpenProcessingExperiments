

PImage img; // The source image
PFont f; 
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system

void setup() {
  size(500, 500, P3D);
  f = loadFont("Generika-48.vlw"); 
  img  = loadImage("IS_environment01.jpg"); // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
}

void draw() {
  background(0);
  

  loadPixels();
  // Begin loop for columns
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           
      color c = img.pixels[loc];       
      float z = (mouseX/(float)width) * brightness(img.pixels[loc]) - 100.0;
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
    }
  }
  for(int i=0; i<10; i++) {
  float r = random(100);
  stroke(r*5);tint(255, 153);
  rectMode(CENTER);
  fill(247,142,30);
  rect(width/2, width/2, mouseX+r, mouseY+r);
}
  
   image(img,0,0);
      textFont(f,16);
      fill(255);  
      translate(0,-mouseY/2);  
      text ( "INSTITTUE OF SCIENCE//SAN FRANCISCO" ,3*width/6,height/2); 
  
  
 
  
}

