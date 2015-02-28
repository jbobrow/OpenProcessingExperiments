
import processing.video.*;
Capture video;
PImage prevFrame;
float threshold = 30;

void setup() {
  size(800,600);
  video = new Capture(this, width, height, 5);
  prevFrame = createImage(video.width,video.height,RGB);
}

void draw() {
  if (video.available()) {
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height); 
    prevFrame.updatePixels();
    video.read();
  }
  
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  

  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      
      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 
      
      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);
      float diff = dist(r1,g1,b1,r2,g2,b2);
   
      if (diff > threshold) { 
        pixels[loc] = color(random(130),random(20),random(20));
      } else {
        pixels[loc] = color(random(40),random(10),random(5));    
    }
    }
  }
  updatePixels();
}




