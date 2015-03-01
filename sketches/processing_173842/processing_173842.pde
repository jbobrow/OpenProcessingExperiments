
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  
  colorMode(HSB);
  //background(127, 100, 150);
  background(20);
 
}

void draw() {
  scale(2);
  
  opencv.loadImage(video);
  //image(video, 0, 0 );

  fill(0);
  noStroke();
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    fill(random(0,1)*127, random(255), 200);
    ellipse(width/2 - (faces[i].x+faces[i].width/2), faces[i].y+faces[i].height/2, faces[i].width*0.4, faces[i].width*0.4);
  }

}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {
  background(20);
}



