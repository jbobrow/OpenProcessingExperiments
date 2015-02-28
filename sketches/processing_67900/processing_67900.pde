
import hypermedia.video.*;
import java.awt.Rectangle;
import processing.video.*;

MovieMaker mm; 

OpenCV opencv;
int srcX, dstX;

void setup() {
  
  size (800, 300);
  opencv = new OpenCV(this);
  opencv.capture(400, 300);
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT ); 
  srcX = opencv.width/2;
  dstX = width-1;
  mm = new MovieMaker(this, width, height, "drawing.mov",
  30, MovieMaker.H263, MovieMaker.HIGH);
}

void draw() {
  
  opencv.read();
  image(opencv.image(), 0, 0);
  Rectangle[] faces = opencv.detect();
  noFill();
  stroke(255, 0, 0);
  for ( int i=0; i<faces.length; i++ ) {
    rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height );

    copy (opencv.image(), srcX, 0, 1, opencv.height, dstX, 0, 1, height);
    if (--dstX<400) dstX = width-1;

    Blob[] blobs = opencv.blobs(10, width*height/2, 10, true);
    image(opencv.image(), 0, 0);
    for ( int k = 0; k < blobs.length; k++) {
      beginShape();
      for (int j = 0; j < blobs[k].points.length; j++) {
        vertex( blobs[k].points[j].x, blobs[k].points[j].y );
      }
      endShape(CLOSE);
      
    }
  }
  mm.addFrame();
}

void stop(){
    mm.finish();
    super.stop();
}


