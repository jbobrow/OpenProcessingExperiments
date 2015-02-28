
// Philip Grimmett
// Assignment 1C
// Screen Studio

// Adapted from:
// OpenCV face_detection.pde
// TRIANGLE_STRIP Mode by Ira Greenberg

import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

int x, y;
float px, py; 
float outerRad;
float angle;
float pts;
float rot;

void setup() {

  size(480, 360);
  opencv = new OpenCV(this);
  opencv.capture(width, height);  // open video stream
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT);  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
  px = 0;
  py = 0;
  angle = 0;
  pts = 26;
  rot = 360.0/pts;
  noStroke();
  smooth();
}

public void stop() {
  opencv.stop();
  super.stop();
}

void draw() {
  
  // grab a new frame
  opencv.read();
  // proceed detection
  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

  // display the image
  image(opencv.image(), 0, 0);

  // set face location
  for (int i=0; i<faces.length; i++) {
    x = faces[i].x + (faces[i].width/2);
    y = faces[i].y + (faces[i].height/2);
    // draw color wheel
    beginShape(TRIANGLE_STRIP); 
    for (int j = 0; j < pts; j++) {
      outerRad = faces[i].height * 0.9; // set outerRad to 90% of face height
      px = x + cos(radians(angle))*outerRad;
      py = y + sin(radians(angle))*outerRad;
      angle += rot;
      color colour = get(int(px), int(py)); // get colour of surrounding area
      fill(colour);
      vertex(px, py);
      vertex(x, y);
      angle += rot + 0.2; // animate rotation
    }
    endShape();
  }
}
