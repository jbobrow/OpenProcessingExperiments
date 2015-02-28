
/**
 * PMilkScanner
 * 
 * apancik at gmail dot com
 * Simple 3D scanner inspired by http://www.instructables.com/id/Milkscanner-V1.0/
 */

import processing.video.*;

Capture cam;
PImage result;
int value;
int layerThickness = 20;
float thresholdValue = .5;
float angleX = 0;
float angleY = 0;
int state = 0;
int captureWidth = 640;
int captureHeight = 480;

void setup() {
  size(1280, 480, P3D);
  cam = new Capture(this, captureWidth, captureHeight);
  result = new PImage(cam.width, cam.height);

  //String[] devices = Capture.list();
  //println(devices);
  //cam = new Capture(this, width, height, devices[0]);
}

void mousePressed(){

  cam.loadPixels();
  for(int i=0;i<cam.width*cam.height;i++){
    cam.pixels[i]=color(red(cam.pixels[i]),green(cam.pixels[i]),blue(cam.pixels[i]),layerThickness);
  }
  cam.updatePixels();
  result.blend(cam, 0,0,result.width,result.height,0,0,result.width,result.height,ADD);
}

void keyPressed()
{
  if(state == 0) 
  {
    state = 1;
  }
  else
  {
    state = 0;
  }
}

void draw() {
  background(0);
  pushMatrix();
  angleY = -((float)(mouseX-width/2)/(float)width)*2;
  angleX = -((float)(mouseY-height/2)/(float)height)*2;

  translate(width/2, height/2, -128);
  rotateY(angleY);  
  rotateX(angleX);  
  translate(-width/2, -height/2, -128);

  result.loadPixels();
  for (int y = 0; y < result.height; y++) {
    for (int x = 0; x < result.width; x++) {
      value = int(brightness(result.get(x, y)));
      stroke(value);
      point(x, y, value);
    }
  }
  popMatrix();

  if(state==0)
  {
    cam.read();
    cam.filter(THRESHOLD,thresholdValue);
    cam.filter(INVERT);
    image(cam, 640, 0);
  }
  if(state == 1) 
  {
    image(result, 640, 0);
  }
}
