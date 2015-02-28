
PImage img;
PGraphics layer0;

Capture cam;

import processing.video.*;
Capture video;
 
void setup() {
  //img = loadImage("image.jpg");
  layer0 = createGraphics(640, 480);
  cam = new Capture(this, 640, 480);
  cam.start();  
  
  size(cam.width, cam.height);
  //size(640, 480, P2D);
}
 
void draw() {
 layer0.beginDraw();
 if (cam.available()) { 
    // Reads the new frame
    cam.read(); 
  } 
  int x = (int)random(width);
  int y = (int)random(height);
  float alpha = random(100, 200);
  layer0.fill(cam.get(x, y), alpha);
  layer0.noStroke();
  float w = random(cam.width/64/10, cam.width/64);
  float h = random(cam.height/4/10, cam.height/4);
  layer0.rect(x, y, w, h);
  layer0.endDraw();
 
  image(cam, 0, 0);
  image(layer0, 0, 0);


}
 
void keyPressed() {
  saveFrame("image-####.jpg");
}
