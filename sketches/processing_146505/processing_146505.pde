
/**
 * talleres CCE mariana carranza
 * Example 23: OpenCV_MovieCapture ::: template
 * by mariana carranza.  
 * my cam 640, 480,  my mov 320, 240 
 */
import hypermedia.video.*;

OpenCV opencv;

int     w = 320;
int     h = 240;

color[] myPixels;                     // my Array to store the CV pixels

//------------------------------------------
void setup() {
  size( 320, 240, JAVA2D);
  smooth();

  opencv = new OpenCV( this );
  //opencv.capture(w,h);                // open video stream
  opencv.movie("eye.mov", w, h);

  noStroke();
}

//------------------------------------------
void draw() {

  background(0);

  opencv.read();                     // grab frame from camera | read a new frame

  myPixels = opencv.pixels();        // (), (SOURCE), (BUFFER), (MEMORY)

  // access to pixels and do something
  // draw circles with the pix color
  for (int i = 0; i < myPixels.length; i += 25) {

    int xpos = i % w;
    int ypos = int(i / w);
    fill(myPixels[i]);
    ellipse(xpos, ypos, 2, 2);
  }
}

//------------------------------------------
public void stop() {
  opencv.stop();
  super.stop();
}


