
// Jenny Hsu
// Benjamin Bacon
// Creative Computing SB
// Midterm Experiiment 01
//
// Based on code here: http://www.openprocessing.org/sketch/60974 

// When loading image, image must be half the sketch size

PImage img;  


void setup() {
  size(600, 600);
  smooth();

  img = loadImage("Rob_color.jpg");
}


void draw() {
  //  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  background(255);

  float mouseXFactor = map(mouseX, 0, width, 5, 1);
  float mouseYFactor = map(mouseY, 0, height, 1, 1);

  for (int gridX = 0; gridX < img.width; gridX++) {
    for (int gridY = 0; gridY < img.height; gridY++) {
      // grid position + tile size
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;

      // get current color
      color c = img.pixels[gridY*img.width+gridX];
      // greyscale conversion
      int greyscale =round(blue(c)*.1+green(c)*.07+red(c)*1);

      noStroke();
      fill(greyscale, 40 * mouseXFactor, 255* mouseYFactor);
      rect(posX, posY, 3.5, 3.5);
      rect(posX+5, posY, 3.5, 3.5);
      rect(posX, posY+5, 3.5, 3.5);
      rect(posX+4, posY+4, 3.5, 3.5);
    }
  }
}




