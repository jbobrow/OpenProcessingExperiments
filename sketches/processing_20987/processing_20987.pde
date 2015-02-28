
// image 02
// drawing an image, pixel per pixel 

PImage img;

void setup() {
  img = loadImage("cn.jpg");
  // the PImage object has some "attributes" such as width and height
  // for instance, we can use these attribute to make our window the 
  // "right" size for our image 
  size(img.width, img.height);
}

void draw() {
  background(0);
  // the first loop takes care of the columns (x)
  // the second loop goes over the rows (y)
  // (just like with the checkboard)
  for (int x=0; x < img.width; x+=1) {
    for (int y=0; y < img.height; y+=1) {
      color pixelColor = img.get(x, y);
      stroke(pixelColor);
      point(x, y);
    }  
  }
}

