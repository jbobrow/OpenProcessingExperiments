
PImage img;

void setup(){
img = loadImage ("surprise.jpeg");
size (344, 479);
}

void draw (){
  loadPixels();
  for (int y = 0; y < height; y ++){
    for (int x = 0; x < width; x ++){
      int loc = x + y * width;
      
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      
      float distance = dist (x, y, mouseX, mouseY);
      
      float adjBrightness = (50 - distance)/ 50;
     
     r *= adjBrightness; 
     g *= adjBrightness; 
     b *= adjBrightness; 
     
     color c = color (r,g,b);
     pixels[loc] = c;
    }
  }updatePixels();
}

