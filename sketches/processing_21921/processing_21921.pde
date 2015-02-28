
PImage source;
PImage destination;

void setup() {
  size(475,600);
  source = loadImage("Bartholot6.jpg");
  destination = createImage(source.width, source.height, RGB);
  smooth();
}

void draw() {
  float threshold = 120;
  
  source.loadPixels();
  destination.loadPixels();
  
  for (int x = 0; x <source.width; x++){
    for(int y = 0; y <source.height; y++){
      int loc = x + y*source.width;
      if (brightness(source.pixels[loc]) < threshold) {
        destination.pixels[loc] = color(0);
      }else{
        destination.pixels[loc] = color(mouseX,100,mouseY);
      }
    }
  }
  destination.updatePixels();
  image(destination,0,0);
}

