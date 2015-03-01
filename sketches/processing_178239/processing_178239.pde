
PImage source;      
PImage destination; 

void setup() {
  size(229, 336);
  source = loadImage("bubbles.jpg");  
  
  destination = createImage(source.width, source.height, RGB);
}

void draw() {    
  
  source.loadPixels();
  destination.loadPixels();
  
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      int loc = x + y*source.width;
    
      if (brightness(source.pixels[loc]) < 150) {
        destination.pixels[loc]  = color(#D30B0B); 
      } else if (brightness(source.pixels[loc]) < 200){
        destination.pixels[loc] = color(#49A8C9);
      }  
      else {
        destination.pixels[loc]  = color(#041A86);    
      
    }
  }
}
 
  destination.updatePixels();
 
  image(destination,0,0);
}


