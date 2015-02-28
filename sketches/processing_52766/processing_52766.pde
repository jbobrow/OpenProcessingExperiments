
import hypermedia.video.*;
import java.awt.*;


OpenCV opencv;

int w = 864 ;
int h = 486;
int threshold = 80;

boolean find=true;

PFont font;

void setup() {
  smooth();
  size( w, h );

  // computer vision
  opencv = new OpenCV( this );
  opencv.capture(w, h);

  font = loadFont( "AndaleMono.vlw" );
  textFont( font );

  println( "Drag mouse inside sketch window to change threshold" );
  println( "Press space bar to record background image" );
}



void draw() {

  //background(0);
  fill(20,70);
  rect(0,0,w,h);
  noFill();
  opencv.read();
  //opencv.flip( OpenCV.FLIP_HORIZONTAL );

  //image( opencv.image(), 10, 10 );	            // RGB image
  //image( opencv.image(OpenCV.GRAY), 20+w, 10 );   // GRAY image
  //image( opencv.image(OpenCV.MEMORY), 10, 20+h ); // image in memory

  opencv.absDiff();
  opencv.threshold(threshold);
  //image( opencv.image(OpenCV.GRAY), 0, 0 ); // absolute difference image


  // working with blobs
  Blob[] blobs = opencv.blobs( 100, w*h/3, 20, true );

  noFill();

  pushMatrix();
  translate(0, 0);

  for ( int i=0; i<blobs.length; i++ ) {

    Rectangle bounding_rect	= blobs[i].rectangle;
    float area = blobs[i].area;
    float circumference = blobs[i].length;
    Point centroid = blobs[i].centroid;
    Point[] points = blobs[i].points;

    // rectangle
    /*
        noFill();
     strokeWeight(2);
     stroke( blobs[i].isHole ? 128 : 64 );
     rect( bounding_rect.x, bounding_rect.y, bounding_rect.width, bounding_rect.height );
     */

    // centroid
    stroke(0, 0, 255);
    line( centroid.x-5, centroid.y, centroid.x+5, centroid.y );
    line( centroid.x, centroid.y-5, centroid.x, centroid.y+5 );
    noStroke();
    fill(0, 0, 255);
    text( area, centroid.x+5, centroid.y+5 );


    fill(#429DD8, 30);
    strokeWeight(2);
    stroke(#006CBC);
    if ( points.length>0 ) {
      beginShape();
      for ( int j=0; j<points.length; j++ ) {
        vertex( points[j].x, points[j].y );
      }
      endShape(CLOSE);


      stroke(#FF0548, 100);
      strokeWeight(10);
      line(blobs[i/3].centroid.x, blobs[i/4].centroid.y, blobs[i].centroid.x, blobs[i/2].centroid.y);
      noStroke();
    }

    noStroke();
    fill(255, 0, 255);
    text( circumference, centroid.x+5, centroid.y+15 );
  }
  popMatrix();
}

void keyPressed() {
  if ( key==' ' ) opencv.remember();
}

void mouseDragged() {
  threshold = int( map(mouseX, 0, width, 0, 255) );
}

public void stop() {
  opencv.stop();
  super.stop();
}


