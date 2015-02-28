
/**
 * talleres CCE mariana carranza
 * Example 04: OpenCV_BlobsMovieCapture ::: template
 * basado en OpenCV_BlobsMovie de C.Sugrue y J. Cano TPC MedialabPrado
 * by mariana carranza.   
 */
import hypermedia.video.*;
import java.awt.*;

OpenCV opencv;

int     w = 320;
int     h = 240;

PImage  imgLiveColor;
PImage  imgLiveGray;
PImage  imgBgCapture;
PImage  imgBinary;

Blob[] blobs;

boolean bCaptureBackground = true;
boolean panels = true;

int threshold = 80;

PFont font;

//------------------------------------------
void setup() {

  size(650, 500, JAVA2D);  //( w*2+10, h*2+20, JAVA2D );

  opencv = new OpenCV( this );
  //opencv.capture(w,h);
  opencv.movie("blobs-small.mov", w, h);//capture(w,h);

  // load text font
  font = createFont("Georgia", 12);
  textFont(font, 12);

  imgLiveColor    = createImage(w, h, RGB);
  imgLiveGray     = createImage(w, h, ALPHA);
  imgBgCapture    = createImage(w, h, ALPHA);
  imgBinary       = createImage(w, h, ALPHA);
}


//------------------------------------------
void draw() {



  updateTracking();

  if (panels) { 
    background(0);
    drawCVPanel();
  }

  if (!panels) {
    noStroke();
    fill(0, 15);
    rect(0, 0, width, height);
    pushMatrix();
    scale(2);
    drawSomething();
    popMatrix();
  }
}

//------------------------------------------
void keyPressed() {
  if ( key==' ' ) bCaptureBackground = true;
  if ( key=='p' ) panels = !panels;
}

void mouseDragged() {
  threshold = int( map(mouseX, 0, width, 0, 255) );
}

//------------------------------------------
public void stop() {
  opencv.stop();
  super.stop();
}


