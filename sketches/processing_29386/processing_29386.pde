
import processing.video.*;
 
Capture cam;
 
void setup () {
  size (640, 320);
  cam = new Capture (this, width, height, 24);
  noStroke ();
}
 
void draw () {
  background (0);
  
  if (cam.available ()) {
    
    cam.read ();
  }
  
  for (int i=0; i < cam.pixels.length; i += 9) {
 
      
    if (i % cam.width == 0) {
      
      if (i%2 == 0) {
        
        i += cam.width * 7;
      }
    }
    
    int x = i % cam.width;
    int y = (int) floor (i / cam.width);
 
    
    
    fill(cam.pixels[i]);
    ellipse (x,y,random(5),random(7));
  }
}
              
