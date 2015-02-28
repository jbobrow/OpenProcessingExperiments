
// image 01
// loading and displaying an image
// the file "cn.jpg" must exist in a folder called "data" inside the
// sketch folder 

// "PImage" is an object, a more 
// complex data type than our usual int, float, etc.
PImage img;

void setup() {
  size(333,500);
  // here, we use the loadImage() function to create a PImage for us. 
  // the loadImage function returns the new PImage object, which gets 
  // stored into our img variable   
  img = loadImage("cn.jpg");
}

void draw() {
  image(img, 0, 0);   
}

