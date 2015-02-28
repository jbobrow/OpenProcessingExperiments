
/**
 * talleres CCE mariana carranza
 * Example 22: OpenCV_MovieCapture ::: template
 * by mariana carranza.   
 */
import hypermedia.video.*;

OpenCV opencv;

// cam 640, 480
// mov 320, 240

int     w = 320;
int     h = 240;

//------------------------------------------
void setup(){

  size( 320, 240 );

  opencv = new OpenCV( this );
  opencv.capture(w,h);                // open video stream
  //opencv.movie("eye.mov",w,h);
  
}

//------------------------------------------
void draw(){
  
  opencv.read();                     // grab frame from camera | read a new frame
  
  image(opencv.image(), 0, 0);       // display image

}

//------------------------------------------
public void stop(){
  opencv.stop();
  super.stop();
}


