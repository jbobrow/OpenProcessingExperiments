
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

PShape tat1;
PShape tat2;
PShape tat3;
PShape tat4;
int tatSel;

void setup() {
  size(640, 480);
  
  tat1 = loadShape("pussy.svg");
  tat2 = loadShape("pussy.svg");
  tat3 = loadShape("pussy.svg");
  tat4 = loadShape("pussy.svg");
  
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  
  shapeMode(CENTER);
}

void draw() {
  scale(1);
  opencv.loadImage(video);
  
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  
  Rectangle[] faces = opencv.detect();
  
  opencv.findCannyEdges(20,75);
  image(opencv.getSnapshot(), 0, 0 );

  for (int i = 0; i < faces.length; i++) {
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    if(tatSel == 1) shape(tat1, faces[i].x+faces[i].width/2, faces[i].y+faces[i].height/1.4, faces[i].width/2, faces[i].height/2.5);
    if(tatSel == 2) shape(tat2, faces[i].x+faces[i].width/2, faces[i].y+faces[i].height/1.25, faces[i].width/2, faces[i].height/2.5);
    if(tatSel == 3) shape(tat3, faces[i].x+faces[i].width/2, faces[i].y+faces[i].height/1.25, faces[i].width/2, faces[i].height/2.5);
    if(tatSel == 4) shape(tat4, faces[i].x+faces[i].width/2, faces[i].y+faces[i].height/1.25, faces[i].width/2, faces[i].height/2.5);
    
  }
  //shape(tat1, 100, 100, 160, 100);
}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {
  tatSel += 1;
  if(tatSel > 4) tatSel=1;
  println(tatSel);
}


