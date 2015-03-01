
import processing.video.*;

Capture video;

void setup() {
  size (1280, 960); 
  // Define video dimensions as 1/4 of the canvas size
  video = new Capture (this, 640, 480);
  video.start();
}


void draw() {
  if (video.available()) {
    video.read();
  }

  // display videos on the for sides of the canvas 
  image (video, 0, 0);
  image (video, width/2, 0);
  image (video, 0, height/2);
  image (video, width/2, height/2);

  // Get pixels

  loadPixels();
  video.loadPixels();
 
  for (int x=0; x < width; x+=1.5) {
    for (int y=0; y < height; y+=1.5) {
      int loc = x + y*width;

  // DOUBT: Why there is no need to write "video.pixels" like we do with images?

      float b = brightness(pixels[loc]);    

  // Set color rules for top-left video 

      if (x < width/2 && y<height/2) {

        if (b >= 200) {
          pixels[loc] = color(255, 139, 149);
        } else if  (80 < b){
          pixels[loc] = color(255, 243, 10);
        } else if ( 20 < b) {
          pixels[loc] = color(255,13,117);
        } else {
          pixels[loc] = color(0);
        }
      }
      
      
   // Set color rules for top-right video 
  
       if (x > width/2 && y<height/2) {

        if (b >= 200) {
          // lilac
          pixels[loc] = color(212,79,255);
        } else if  (80 < b){
          //soft-green
          pixels[loc] = color(151, 208, 255);
        } else if ( 20 < b) {
          //vivid blue
          pixels[loc] = color(0,200,255);
        } else {
          pixels[loc] = color(0);
        }
      }
      
      
      
       // Set color rules for bottom-left video 
  
       if (x < width/2 && y > height/2) {

        if (b >= 200) {
          // soft green
          pixels[loc] = color(204,255,122);
        } else if  (80 < b){
          //beige
          pixels[loc] = color(255, 223, 139);
        } else if ( 20 < b) {
          //red
          pixels[loc] = color(255,0,0);
        } else {
          pixels[loc] = color(0);
        }
      }
      
      
      
      // Set color rules for bottom-right video 
  
       if (x > width/2 && y > height/2) {

        if (b >= 200) {
          // orange
          pixels[loc] = color(255,120,48);
        } else if  (80 < b){
          //Ssoft pinl
          pixels[loc] = color(255, 139, 149);
        } else if ( 20 < b) {
          //blue-green
          pixels[loc] = color(0, 255, 144);
        } else {
          pixels[loc] = color(0);
        }
      }
      
      
    }
  }          

  updatePixels();
}
