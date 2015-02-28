
// image 03
// pixelate effect

PImage img;

void setup() {
  img = loadImage("cn.jpg");
  size(img.width, img.height);
  smooth();
}

void draw() {
  background(0);
  
  int skip = int(map(mouseX, 0, width, 2, 20));
  noStroke();
  
  // our look will "skip" some pixels by incrementing
  // the (x, y) coordinates by more than 1
  for (int x=0; x < img.width; x+=skip) {
    for (int y=0; y < img.height; y+=skip) {
      int pixelColor = img.get(x, y);

      // since we are skipping pixels, we will draw boxes
      // instead of individual dots 
      fill(pixelColor);      
      rect(x, y, skip, skip);

      // try this instead of the two lines above..
      // uses the brightness of the color to set 
      // the size of a circle! 
      
      /*
      float b = brightness(pixelColor);
      fill(255);
      float diameter = map(b, 0, 255, 1, skip);
      ellipse(x, y, diameter, diameter);
      */

    }  
  }
}

