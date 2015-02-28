
class Meow {
  PImage meow; //variable for the image file
  float x, y; //variables for image location

 Meow(String filename, float x_, float y_) { 
    // Load image, initialize variables 
    meow = loadImage(filename);
    x = x_;
    y = y_;
  } 

  void display () {
    image (meow, x, y);
  }
  
}


