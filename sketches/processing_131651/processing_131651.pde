
import processing.video.*;

Capture cam;
int pointillize = 45;

void setup() {
  size(1280, 720);
  background(0);
  cam = new Capture(this, 1280, 720, 30);
  smooth();
  cam.start();
}

void draw(){
  if(cam.available()){
    cam.read();
  }
 /*this is where the live feed of the camera is displayed and is commented out so that
 it will not run on top of the pointilism*/
 
  //image(cam, 0, 0);
  
  
  // Pick a random point
  int x = int(random(cam.width));
  int y = int(random(cam.height));
  int loc = x + y*cam.width;
  // Look up the RGB color in the source image
  cam.loadPixels();
  float r = red(cam.pixels[loc]);
  float g = green(cam.pixels[loc]);
  float b = blue(cam.pixels[loc]);
  noStroke();
  
  fill(r,g,b,100);
  //the pointilism shapes
  rect(x,y,pointillize,pointillize); 
 

  
}


