
import processing.video.*;

Capture cam;

void setup() {
  noCursor();
  frameRate(24);

  size(640, 280);

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }


    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {

  rectMode(CENTER);
  imageMode(CENTER);
  background(0, 0);
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  float r =random(2, 30); 
  int s = 30;
  for (int a = 10; a<640; a+=50) {
    for (int b = 10; b<280; b+=50) {
      noStroke();
      fill(0, 100, 100, 40);
      rect(a, b, r, r); 
      if (mousePressed==true ) {
        fill(0, r, r, 150);
        ellipse(a, b, r, r);
        image(cam, mouseX, mouseY);
      }
    }
  }
}



