
import hypermedia.video.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import processing.video.*;
// Size of each cell in the grid, ratio of window size to video size
int videoScale = 60;
// Number of columns and rows in our system
int cols, rows;
// Variable to hold onto Capture object
Capture video, myCapture;
int value=0;
Minim minim;
AudioInput in;
FFT fft;
int highest=0;
void setup()
{
  size(1280 , 720);
  // Initialize columns and rows
  frameRate(30);
  cols = width/videoScale;
  rows = height/videoScale;
  video = new Capture(this,width,height);
  video.start();
smooth ();
  minim = new Minim(this);
  minim.debugOn();

  in = minim.getLineIn(Minim.MONO, 4096, 44100);
  fft = new FFT(in.left.size(), 44100);
}

void draw()
{
// Read image from the camera
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
    // Audio gathering here
     fft.forward(in.left);
  highest=0;
  for (int n = 0; n < fft.specSize(); n++) {
    // draw the line for frequency band n, scaling it by 4 so we can see it a bit better
    //line(n/4, height, n/4, height - fft.getBand(n)*4);

    //find frequency with highest amplitude
    if (fft.getBand(n)>fft.getBand(highest))
      highest=n;
  }
  
  
  videoScale = int (-0.185 * highest + 22);
   if (videoScale < 0)
  {
    videoScale = - videoScale;
  }
  else if (videoScale == 0  )
  {
    videoScale = 2 ;
  }
  try{
  
  cols = width/videoScale;
  rows = height/videoScale;
  }
  catch(Exception e)  {
  println("Zero");
  }
      
  println(highest,videoScale);
  
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      
      // Where are we, pixel-wise?
      int x = i*videoScale;
      int y = j*videoScale;
      // Looking up the appropriate color in the pixel array
      color c = video.pixels[x + y*video.width];
      smooth();
      fill(c);
      stroke(random(10),random(01),random(01));
      rect(x,y,videoScale,videoScale);
    }
  }
}


void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}


