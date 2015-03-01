
import processing.video.*;

Capture cam;

void setup(){
  size(1280,960);
  background(0);
  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
  cam.start();
  noFill();
}
void draw(){
  if (cam.available() == true){
    cam.read();
  }
  
  int x = 20;
  while (x<width-10){
    int y = 20;
    while(y<height-10){
    stroke(brightness(cam.get(x,y)));
    ellipse(x,y,brightness(cam.get(x,y))/5,brightness(cam.get(x,y))/5);
    y = y + 20;
    }
    x = x + 20;
  }
}
