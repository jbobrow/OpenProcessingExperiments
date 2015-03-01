
//working with images 

// declare a PImage veriable type
PImage fractal;

//Load an image file from HDD
void setup() {
  size(800,600);
  fractal=loadImage("BlackPit1.jpg");
}

// Draw the image to the sxreen at (0,0)
void draw() {
  image(fractal,0,0,500,400);
}  
  
  

