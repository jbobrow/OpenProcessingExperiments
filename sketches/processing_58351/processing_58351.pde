
import hypermedia.video.*;
import processing.opengl.*;
import saito.objloader.*;

OBJModel model;

OpenCV opencv;

float x=0;
float y=0;

void setup() {
  size( 800, 600, OPENGL );

  // open video stream
  opencv = new OpenCV( this );
  opencv.capture( width, height);

  model = new OBJModel(this, "cube.obj", "relative", QUADS);
  model.scale(30);
}

void draw() {
  background(255);
  opencv.read();
  image( opencv.image(), 0, 0); 

  // grab frame from camera
  opencv.convert( GRAY );
  opencv.brightness( -50 );
  opencv.contrast(128);// set black & white threshold
  // find blobs

  BLOB ();
}

void BLOB () {
  Blob[] blobs = opencv.blobs( 10, width*height/2, 100, true, OpenCV.MAX_VERTICES*40 );
  beginShape(TRIANGLES);
  for( int i=0; i<blobs.length; i++ ) {

    if(blobs[i].isHole && (blobs[i].area>=2000)) {
      pushStyle();
      translate(0,0);
      stroke(0);
      x=(blobs[i]).centroid.x;
      y=(blobs[i]).centroid.y;
      //      vertex(x, y, 0);
      fill(255,0,0);
      strokeWeight(3);
      popStyle();
      
        CUBE();
      
    }
  }
  endShape(CLOSE);
  

}

void CUBE() {
  pushStyle(); 

  translate(x, y-100, 100);
  rotateX(-((y)/60));
  rotateY((x)/60);
  strokeWeight(1);
  model.draw();
  popStyle();
}


