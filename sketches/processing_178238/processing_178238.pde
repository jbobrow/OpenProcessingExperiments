
PImage source;
PImage destination;
void setup() {
  size(400,400);
  source = loadImage("crush.jpg");
  destination = createImage(source.width,source.height, RGB);
}
void draw() {
  float threshold1 = 63;
  float threshold2 = 126;
  float threshold3 = 189;
  
  source.loadPixels();
  destination.loadPixels();
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++) {
      int loc = x+y*source.width;
    if(brightness(source.pixels[loc]) > threshold3) {
        destination.pixels[loc] = color(#FAEA90);
      }else if(brightness(source.pixels[loc]) > threshold2 && brightness(source.pixels[loc]) < threshold3){
        destination.pixels[loc] = color(#89C5D3);
      }else if(brightness(source.pixels[loc]) > threshold1 && brightness(source.pixels[loc]) < threshold2){
        destination.pixels[loc] = color(#F04144);
      }else {
        destination.pixels[loc] = color(#073D7C);
      }
    }
  }
  destination.updatePixels();
  image(destination,0,0);
  textAlign(CENTER);
  text("DUDE", 300,0);
}


