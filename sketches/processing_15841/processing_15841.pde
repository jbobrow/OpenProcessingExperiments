

import peasy.*;
PeasyCam cam;

boolean isRecording = false;
int recordFrame = 0;
int MAX_FRAMES = 5;

void setup(){
 size(1000, 600, P3D);
 cam = new PeasyCam(this, 10);
 cam.setMinimumDistance(300);
 cam.setMaximumDistance(700);
}

void draw(){
 background(#ffff00);
 lights();
 noStroke();
 int shapeCount = 10;
 float stepSize = 5;




for(int i=0; i<shapeCount; i++){
  fill(#ff00ff, 100);
  translate(stepSize, 0, 0);
  rotateX(radians(20));
  
  //randomize sizes
  int sphereDia = int(random(10, 30));

  //createShapes
  pushMatrix();
  translate(100, 40, 0);
  rotateY(radians(10));
  line (0,0, 100, 100);
  sphere(sphereDia);
  sphere(sphereDia/2);
  popMatrix();
 }
}

