
/**
 * talleres CCE mariana carranza
 * Example 05 : OpenCV frame diff
 * by mariana carranza.   
 */

import hypermedia.video.*;        //  Imports the OpenCV library
OpenCV opencv;                    //  Creates a new OpenCV Object

int     w = 320;
int     h = 240;

void setup()
{

  size( 320, 240 );

  opencv = new OpenCV( this );    //  Initialises the OpenCV object
  opencv.capture( 320, 240 );     //  Opens a video capture stream
  // opencv.movie("eye.mov",w,h);    //  ... or movie
}

void draw()
{

  opencv.read();                  //  Grabs a frame from the camera
  opencv.absDiff();               //  Calculates the absolute difference
  opencv.convert(OpenCV.GRAY);    //  Convert to grayscale
  opencv.blur( OpenCV.BLUR, 3 );  //  Blur before taking the difference image to reduce camera noise
  opencv.threshold(50);           //  Aply threshol results binary image
  image( opencv.image(), 0, 0 );  //  Display the difference image
  opencv.remember(OpenCV.SOURCE); //  Remembers the current frame
}



void stop() {                      // Clean resources
  opencv.stop();
  super.stop();
}


