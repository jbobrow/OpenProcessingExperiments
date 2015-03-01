
/*
EINSTEIN FACE REPLACER
for the Innovation Space @
Australian Science and Mathematics School,
Adelaide, South Australia.

27th of August 2013


Based heaps upon face-detection with OpenCv code, from:
http://www.magicandlove.com/blog/2013/04/05/the-new-face-detection-and-processing/

Small tweaks and the cramming of Albert Einstein's face 
into the program by Tristan Miller tristan@mindcloud.org


Some nice additions would be:
detect side-on faces and display Einstein's profile
detect mouth status and use to display famous tongue-sticking-out Einstein
display POLITICIANS on the day of the royal show!
Some level of background elimination.

*/

import processing.video.*;
 
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfRect;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.core.CvType;
import org.opencv.core.Size;
import org.opencv.objdetect.CascadeClassifier;
 
import java.awt.image.BufferedImage;
import java.awt.image.WritableRaster;
import java.awt.image.Raster;
 
Capture cap;
PImage einstein;
int pixCnt;
BufferedImage bm;
 
CascadeClassifier faceDetector;
MatOfRect faceDetections;
 
void setup() {
  size(640, 480);
  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
  println(Core.VERSION);
 
  cap = new Capture(this, width, height);
  cap.start();
  bm = new BufferedImage(width, height, BufferedImage.TYPE_4BYTE_ABGR);
  pixCnt = width*height*4;
 
  einstein = loadImage("einstein.png");
  faceDetector = new CascadeClassifier(dataPath("haarcascade_frontalface_alt.xml"));
  faceDetections = new MatOfRect();
}
 
void convert(PImage _i) {
  bm.setRGB(0, 0, _i.width, _i.height, _i.pixels, 0, _i.width);
  Raster rr = bm.getRaster();
  byte [] b1 = new byte[pixCnt];
  rr.getDataElements(0, 0, _i.width, _i.height, b1);
  Mat m1 = new Mat(_i.height, _i.width, CvType.CV_8UC4);
  m1.put(0, 0, b1);
 
  Mat m2 = new Mat(_i.height, _i.width, CvType.CV_8UC1);
  Imgproc.cvtColor(m1, m2, Imgproc.COLOR_BGRA2GRAY);   
 
  faceDetector.detectMultiScale(m2, faceDetections, 2, 1, 
  Objdetect.CASCADE_DO_CANNY_PRUNING, new Size(40, 40), new Size(240, 240));
 
  bm.flush();
  m2.release();
  m1.release();
}
 
void draw() {
  if (!cap.available()) 
    return;
  background(0);
  cap.read();
  convert(cap);
  image(cap, 0, 0);
  for (Rect rect: faceDetections.toArray()) {
    noFill();
    stroke(255, 0, 0);
 //just commenting out code for drawing a rectangle...
 // rect(rect.x, rect.y, rect.width, rect.height);
    pushMatrix();
    translate(rect.x + 0.5*rect.width, rect.y + 0.5*rect.height);
    imageMode(CENTER);
    image(einstein, 0, 0, 1.7*rect.width, 1.7*rect.height);
    
    imageMode(CORNER);
    popMatrix();
  }
}


