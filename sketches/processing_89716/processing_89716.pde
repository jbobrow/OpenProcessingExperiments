
import processing.video.*;
PFont font;
Capture cam;
boolean clicked;

void setup() {
  size(640, 480);
  clicked = false;
  
  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
  cam.start();        
}

void draw() {  
  if (clicked && cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  font = createFont("Georgia", 32); 
  textFont(font);
  text("Professor", 50, 50);
}

void mousePressed() {
  clicked = true;
}


