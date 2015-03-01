
PImage source; //Source image
PImage destination; //Destination image

void setup(){
  size(100,100);
  source = loadImage("yo.jpg");
  destination = createImage(source.width,source.height,RGB);
}
void draw(){
  float threshold = 127;
  source.loadPixels();
  destination.loadPixels();
  for (int x = 0; x < source.width; x++){
    for (int y = 0; y < source.height; y++){
      int loc = x + y*source.width;
      if (brightness(source.pixels[loc]) > 
      threshold){
     destination.pixels[loc] = color(255,0,0);
    } else {
      destination.pixels[loc] = color(0,0,255);
    }
  }
}

destination.updatePixels();
image(destination,0,0);
}
