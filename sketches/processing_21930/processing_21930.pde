
PImage img;       
PImage destination;

void setup() {
  size(300,300);
  img = loadImage( "Taecyeon.jpg" );
  destination = createImage(img.width, img.height, RGB);
  smooth();
}
 
void draw() {
  float threshold = 200;
   
  img.loadPixels();
  destination.loadPixels();
   
  for (int x = 0; x <img.width; x++){
    for(int y = 0; y <img.height; y++){
      int loc = x + y*img.width;
      if (brightness(img.pixels[loc]) < threshold) {
        destination.pixels[loc] = color(100);
      }else{
        destination.pixels[loc] = color(mouseX,100,mouseY);
      }
    }
  }
  destination.updatePixels();
  image(destination,0,0);
}

