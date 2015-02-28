
// Carolyn Schuetz
// March 1, 2011
// Image Manipulation Homework

// This is my roommate's dog, Pookie. Roll over the image from left or right to dye Pookie's normally
// light brown hair. She obviously loves some really colorful shades.

PImage img;
int columns;
int rows;

void setup() {
  size(400,400);
  img = loadImage("pookie.jpg");
  img.loadPixels();
  loadPixels();
  columns = img.width; 
  rows = img.height;
  colorMode(HSB,400,400,400);

}

void draw() {
  image(img, 0, 0);
  for(int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      int loc = i + j*columns;
      float h = hue(img.pixels[loc]);
      float s = saturation(img.pixels[loc]);
      float b = brightness(img.pixels[loc]);
      color newColor = color(mouseX,s,b);
      pixels[loc] = newColor;
    }
  }
  updatePixels();
}



