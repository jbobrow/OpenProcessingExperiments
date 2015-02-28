
import processing.video.*;
 
Capture cam;
PImage p;
float angle = 0.0; 
float speed = 0.05; 
float radiusX = 80.0; 
float radiusY =80.0;
float sx = 2.0;
float sy = 2.0;

 
void setup() {
  size(640, 480);
   noStroke();
  smooth();
 
  String[] cameras = Capture.list();
 
  if (cameras.length == 0) {
    println("No hay camaras disponibles");
    exit();
  } 
  else {
    println("Cámaras disponibles:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
 
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}
 
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  p = cam;
  fill(0, 4);
  rect(0, 0, width, height);
  angle += speed;
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = width/2 + (cosval * radiusX);
  float y = height/2 + (sinval * radiusY);
  color c1 = p.get((int)x,(int)y);
  fill(red(c1), green(c1), blue(c1));
  ellipse(x, y, 90, 50); 
}



void keyPressed (){
  if (key =='a'){
    save ("foto.png");
  }
}



