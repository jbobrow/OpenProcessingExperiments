
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
      

      float r = red (video.pixels [loc]); 
      float g = green(video.pixels[loc]);
      float b = blue(video.pixels [loc]);
      

float adjustBrightnessR = mouseX /150; //(100-distance)/100;
float adjustBrightnessG = mouseY /150;       //(100-distance)/100;
float adjustBrightnessB = mouseX + mouseY/150; //(100-distance)/100;


r *= adjustBrightnessR;
g *= adjustBrightnessG; 
b *= adjustBrightnessB;

r = constrain(r,0,255); 
g = constrain(g,0,255); 
b = constrain(b,0,255);

color c = color(r,g,b); 
video.pixels[loc] = c;
video.pixels[loc] = color (r,g,b);

      stroke(video.pixels[loc]);
      fill(video.pixels[loc]);


video.loadPixels();

float x1 = random (0, 30);
float y1 = random (0, 50);
stroke(150);

  ellipse (x,y,x1,y1);

  video.loadPixels();
  
      }
   }
}



