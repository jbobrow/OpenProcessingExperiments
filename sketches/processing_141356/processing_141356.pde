
PImage img;
 
void setup() {
  size(750, 450);
  // Load the file from the data folder
  img = loadImage("bee.jpg"); 
  smooth();
}
 
void draw() {
  background(0);
  // Call loadPixels before we deal with pixels
  loadPixels(); 
  // Loop through all pixels, skip every 10 pixels along the y-axis
  for (int y = 0; y < img.height; y+=1 ) {
    // skip every 5 pixels along the x-axis
    for (int x = 0; x < img.width; x+=1) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Color according to the image
      stroke(img.pixels[loc]);
      fill(img.pixels[loc]);
      // Draw a triangle pointing up or pointing down
      if (x %5 == 0) ellipse(x,y,1,4);
       
    }
  }
}



