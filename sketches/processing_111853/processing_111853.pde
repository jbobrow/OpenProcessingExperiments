
import hypermedia.video.*;
import java.awt.Rectangle;
import java.awt.AWTException;
import java.awt.Robot;
  
Robot robot;
OpenCV opencv;
 
void setup() {
 
  size( displayWidth, displayHeight);
  opencv = new OpenCV( this );
  opencv.capture( width, height );                   // open video stream
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
  try {
    robot = new Robot();
  }
  catch (AWTException e) {
    e.printStackTrace();
  }
}
 
public void stop() {
  opencv.stop();
  super.stop();
}
 
void draw() {
  background(0);
 
  opencv.read();
 
  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
  image(opencv.image(), 0, 0);
 
  noFill();
  stroke(255, 0, 0);
  for ( int i=0; i<faces.length; i++ ) {
    rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
    robot.mouseMove(faces[i].x, faces[i].y);
  }
}
