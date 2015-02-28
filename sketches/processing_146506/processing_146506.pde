
/**
 * talleres CCE mariana carranza
 * Example 22: OpenCV_MovieCapture ::: template
 * by mariana carranza.   
 * brightness, contrast, blur, threshold, invert, convert and flip.
 */
import hypermedia.video.*;

OpenCV opencv;

// cam 640, 480
// mov 320, 240

int     w = 320;
int     h = 240;

//------------------------------------------
void setup() {

  size(1280, 480);  //( w*4, h*2 );

  opencv = new OpenCV( this );
  //opencv.capture(w, h);                // open video stream
  opencv.movie("eye.mov",w,h);
}

//------------------------------------------
void draw() {

  opencv.read();                     // grab frame from camera | read a new frame

  image(opencv.image(), 0, 0);       // display image original

  opencv.brightness( 60 );           // filters will be added
  image(opencv.image(), w, 0);       // brightness
  opencv.contrast( 90 );
  image(opencv.image(), w*2, 0);     // brightness + contrast 
  opencv.blur( OpenCV.BLUR, 16 );
  image(opencv.image(), w*3, 0);     // brightness + contrast + blur
  
  opencv.restore();                  // call the original image
  
  opencv.invert();
  image(opencv.image(), 0, h);       // invert
  opencv.convert( GRAY );
  image(opencv.image(), w, h);       // invert + b&w
  opencv.threshold(220);
  image(opencv.image(), w*2, h);     // invert + b&w + threshold
  opencv.flip(OpenCV.FLIP_HORIZONTAL);
  image(opencv.image(), w*3, h);     // invert + b&w + threshold + flip
}

//------------------------------------------
public void stop() {
  opencv.stop();
  super.stop();
}


