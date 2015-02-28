
import hypermedia.video.*;

OpenCV opencv;

float s=10;
float sc;

void setup() {
  size(640,480);
  opencv=new OpenCV(this);
  opencv.capture(640,480);
}
void draw() {
  background(255);
  opencv.read();
  opencv.threshold(80);
  Blob[] blobs=opencv.blobs(10, width*height,100,true,OpenCV.MAX_VERTICES*4);
  for(int i=0; i<blobs.length;i++) {
    for(int j=0; j<blobs[i].points.length; j++) {
      fill(255);
      stroke(sc);
      rect(blobs[i].points[j].x,blobs[i].points[j].y,s,s);
      //s=map(mouseX,0,640,1,100);
      //sc=map(mouseY,0,480,0,255);
    }
  }
}



