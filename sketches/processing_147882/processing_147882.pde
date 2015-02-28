
import gab.opencv.*;
import processing.video.*;
Capture video;
 
OpenCV opencv;
 
ArrayList<Contour> contours;
ArrayList<Contour> polygons;
 
void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480); 
  video.start();
}
 
void draw() {
  image(video, 0,0);
  opencv.loadImage(video);
  opencv.gray();
  opencv.threshold(90);
 
  contours = opencv.findContours();
 // image(opencv.getOutput(), 0, 0);
 
  noFill();
  strokeWeight(3);
 
  for (Contour contour : contours) {
    stroke(0, 255, 0);
    contour.draw();
 
    stroke(255, 0, 0);
    beginShape();
    for (PVector point : contour.getPolygonApproximation().getPoints()) {
      vertex(point.x, point.y);
    }
    endShape();
  }
}
void captureEvent(Capture c) {
  c.read();
}
