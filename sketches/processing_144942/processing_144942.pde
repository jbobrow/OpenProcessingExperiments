
// Run this program only in the Java mode inside the IDE,
// not on Processing.js (web mode)!!

import processing.video.*;

Capture cam;
int i,j = 0;
void setup() {
  background(0);
  
  size(320, 240);
  frameRate(300);
  cam = new Capture(this, width, height, 30);
  cam.start();
 // PImage myImage = loadImage(cam);
// blendMode(ADD);
}

void draw() {
  if(cam.available()) {
    cam.read();
  }
  //image(cam, 0, 0);

//background(0);

//for (int i = 0; i < 640; i ++) {
//  for (int j = 0; j < 480; j ++) {
  
    color c = cam.get(i, j);
    color c2 = cam.get(i, j + 1);
    color c3 = cam.get(i, j + 2);
    color c4 = cam.get(i, j+ 3);
    stroke(c);
                    //point(i +random(10) -5,j+random(10) -5);
    point(i,j);
    stroke(c2);
    point(i,j+ 1);
    stroke(c3);
    point(i,j+ 2);
    stroke(c3);
    point(i,j+ 2);
     i += 3;
     if (i >= width){
      j += 3; 
      i -= width;
     }
     if(j >= height -4 )
     {
      j= 0;
      
     }
  

}




