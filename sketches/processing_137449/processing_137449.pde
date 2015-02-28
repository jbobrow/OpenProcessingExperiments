
import processing.video.*;

Capture cam;

void setup() {
  size(1280, 720);
  String[] cameras = Capture.list();
    cam = new Capture(this, cameras[0]);
    cam.start();     
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  
   // Tinting using mouse location

  // A video image can also be tinted and resized just as with a PImage.
//  image(cam,mouseX-80,mouseY-80,mouseX,mouseY); 
  tint(map(mouseX,0,width,0,255),map(mouseY,0,height,0,255),255);
if (mouseX>300 && mouseX<500){
//  filter(DILATE);
filter(THRESHOLD);
}
if (mouseY>200 && mouseY<600){
filter(GRAY);
}

if (mouseX>900){
filter(INVERT);
}
//filter(THRESHOLD);
//filter(ERODE);
//filter(POSTERIZE,6);

}



