
//Working with images in Processing

//Declare a PImage variable type
PImage fractal;


//Load an image file from HDD
/*Dn't forget to add the file
to your sketch 'data' folder */

void setup() {
  size(1000, 500);
  fractal = loadImage("20141013_110941.jpg");
}

//Draw the image to the screen at (0,0)
void draw() {
  image(fractal, 0, 0, 1000, 500);
}

