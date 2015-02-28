
/* 21-08-2012 assessment1c jwan3214

The more obvious the movement is, the larger the circle is.

*/

// Import the libraries
import processing.video.*;
import hypermedia.video.*;

// Declare openCV
OpenCV opencv;

// Deckare a new movie
MovieMaker mm;

// Set the threshold value
float value = 80;

// Declare the number of black pixels of last image.
int countp = 0;
// The different pixels of last image and current image
int countd = 0;

void setup() 
{
    // Set the size of the window
    size( 960, 360 );
    // Setup the movie
    mm = new MovieMaker(this, 1280, 480, "assessment1c_jwan3214.mov",30, MovieMaker.H263, MovieMaker.HIGH);
    // Set openCV
    opencv = new OpenCV( this );
    // Set the camera
    opencv.capture(width/2,height);
    // Set the background color
    background(0);
    // Draw without stroke
    noStroke();
    // Smooth the edge
    smooth();
}

void draw() 
{
    // Number of the black pixels
    int countc=0;
  
    // Clear the background
    background(0);
    
    // Declare the blob array
    Blob[] blobs;

    // Get the image
    opencv.read();
    // Flip horizontally
    opencv.flip( OpenCV.FLIP_HORIZONTAL );
    // Convert to gray image
    opencv.convert( OpenCV.GRAY );

    // Make the difference between the current image and the last
    opencv.absDiff();
    // Filtering out pixels > 80
    opencv.threshold(value);
    
    // Show the image of the camera
    image( opencv.image(), 0, 0 );
    
    // Load the data of current image
    loadPixels();
    // Count the number of black pixels
    for(int i = 0; i < pixels.length; i++ )
    {
      if(pixels[i]==color(255))
      {
        countc++;
      }
    }
    // Get the difference of the black pixels between current image and the last image
    countd = countc - countp;
    // Remember the number of black pixels 
    countp = countc;
    // Set the mode of ellipse
    ellipseMode(CENTER);
    // Fill the ellipse with white
    fill(255);
    // Map the different points with radium of the circle
    float r = map(abs(countd),0,width*height/8,0,width/4);
    // Draw the circle
    ellipse(width*3/4,height/2,r,r);
    // Record this frame
    mm.addFrame();
}

// Press the space bar to stop movie recording
void keyPressed() 
{
  if (key == ' ') 
  {
    mm.finish();
    println("recording stopped");
  }
}

// Stop the camera
public void stop() {
    opencv.stop();
    super.stop();
}

