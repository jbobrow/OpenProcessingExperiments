
import hypermedia.video.*;

OpenCV opencv;

int selectedKey = 1;

boolean remember = false;


void setup() {
  size(640, 480);
  smooth();

  // open video stream
  opencv = new OpenCV( this );
  opencv.capture(640, 480);

  println( "Press a to take a photo" );
  println( "Press q, w, e or r to change color" );
}


void draw() {  
  opencv.read();           // grab frame from camera
  opencv.threshold(80);    // set black & white threshold 

  // find blobs
  Blob[] blobs = opencv.blobs( 10, width*height/2, 100, true, OpenCV.MAX_VERTICES*4 );

  if ( remember ) opencv.absDiff();
  image( opencv.image(), 0, 0 );

  // draw blob results
  for ( int i=0; i<blobs.length; i++ ) {
    beginShape();
    for ( int j=0; j<blobs[i].points.length; j++ ) {
      vertex( blobs[i].points[j].x, blobs[i].points[j].y );
    }
    endShape(CLOSE);
  }
  
}

void keyPressed() {
  if (key == 'a'){
    opencv.remember();
  remember = true;
 }

else if (key =='q'){
  selectedKey = 1;
   fill(100);
}
else if (key =='w'){
  selectedKey = 2;
   fill(10, 10, 225);
}
else if (key =='e'){
  selectedKey = 3;
   fill(50);
}
else if (key =='r'){
  selectedKey = 4;
   fill(100, 50, 150);
}
else if (key =='t'){
  selectedKey = 4;
   fill(50, 250, 50);
}
}

