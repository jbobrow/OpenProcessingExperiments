
import processing.video.*;

Capture video;

void setup(){
  size(320,240);
  video = new Capture (this, 320,240, 30);
}

void draw(){
  if (video.available()){
    video.read();
    
  }
  loadPixels();
  video.loadPixels();
  for ( int y =0; y < height; y ++){
    for (int x = 0; x < width; x ++){
      int loc = x +y * width;
      
      float r = red (video.pixels[loc]);
      float g = green (video.pixels [loc]);
      float b = blue (video.pixels [loc]);
      
      color c = color (r,g,b);
      
      pixels [loc] = c;
    }
  }updatePixels();
      
 // image(video, 0,0);
}


