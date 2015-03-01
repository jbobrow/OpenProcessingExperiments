

/* @pjs preload="squirrel_eating_2-800x600.jpg"; */

PImage mokus;
int pxlWeight = 10;

void setup() {
  mokus = loadImage("squirrel_eating_2-800x600.jpg");
  size(800, 600);
  
  noStroke();
  
  image(mokus, 0, 0);
  loadPixels();
}

void draw() {
  
  pxlWeight = (int) map(mouseX, 0, width, 100, 1);
  
  for(int i = 0; i < width; i+=pxlWeight) {
    for(int j = 0; j < height; j+=pxlWeight) {
      
      fill(pixels[i + width*j]);
      rect(i, j, pxlWeight, pxlWeight);
    }
  }
  
}



