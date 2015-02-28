
//Working with Images in Processing

//Declare a PImage variable type
PImage fractal;

//Load an image file from HDD
/*Don't forget to add the file 
to your sketch 'data' folder */
void setup() {
  size(800,600);
  fractal = loadImage("fractal-wallpaper-.jpg");

}
//Draw the image to the screen at (0,0)
void draw() {
  image(fractal, 0,0, 400, 300);

}

