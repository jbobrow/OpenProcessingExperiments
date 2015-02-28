
import processing.video.*;
Capture video;

void setup(){
  size(500,700);
  video = new Capture(this,width,height,90);
  smooth();

}

void draw(){
  
  if (video.available()){
    video.read();
  }
  
   
  for (int y = 0; y < video.height; y+=5){
    // skip every 5 pixels along the x-axis
    for (int x = 0; x < video.width + 5;  x+=5) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*video.width;
      //int loc = (video.width - x-5)  + y*video.width;

      // Color according to the image
      stroke(video.pixels[loc]);
      fill(video.pixels[loc]);

float x1 = random (0, 30);
float y1 = random (0, 50);
stroke(150);

  ellipse ( x, y, x1,y1);

  video.loadPixels();
  float r = red(video.pixels[loc]);
  float g = green(video.pixels[loc]);
  float b = blue(video.pixels[loc]);
  float a = blue(video.pixels[loc]);
  noStroke();
  
  fill (r,g,b,a);
 
    
      }
      
    }
     
 }
  

void paintCircles (){
      
  for (int x = 0; x< width; x = x+ 5)
  for (int y = 0; y< height; y = y + 5) {
  noStroke();
  

  }
}


