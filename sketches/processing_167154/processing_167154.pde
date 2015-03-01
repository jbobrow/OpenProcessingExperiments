
PImage img;
int cellsize = 15;
int cols, rows;

void setup() {
  size(400, 400, P3D);
  img = loadImage("wafflez2.png");
  cols = width/cellsize;
  rows = height/cellsize;
}
void draw() {
  loadPixels();
  for ( int i = 0; i < cols;i++) {
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/15;
      int y = j*cellsize + cellsize/15; 
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
      
      if (mousePressed) {
        line(150, 25, mouseX, mouseY);
        fill(255);
      } else {
        fill(255, 40, 75);
      }
      ellipse(mouseX, mouseY, 80, 80);
    }
    stroke(255);
  }
    line(150, 25, mouseX, mouseY);
  }
  void mousePressed() {
    background(150,40,30);

    line(150, 25, mouseY, mouseX);
  }



