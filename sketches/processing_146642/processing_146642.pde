
/**
 * talleres CCE mariana carranza
 * Example 09: Background subtraction capture + image
 * by mariana carranza.   
 */

import hypermedia.video.*;        //  Imports the OpenCV library
OpenCV opencv;                    //  Creates a new OpenCV Object
//  allowed to use only ONE OpenCV Object
PImage img1, img2, img3;          //  1 to load my image, 2 and 3 for my new images

int w = 320;
int h = 240;

color [] cv_pixels;                // array to store OpenCV pixels[]

boolean bCaptureBackground = true; // var to capture the background to subtract
int threshold = 30;                // var to interactive chahge threshold

PFont font;

//-----------------------------------------------------------------------------
// Initialization
void setup()
{
  size(960, 520, JAVA2D);  //(w*3, h*2 + 40, JAVA2D);

  opencv = new OpenCV( this );            //  Initialises the OpenCV object
  // opencv.capture( 320, 240 );             //  Opens a video capture stream
  opencv.movie("blobs-small.mov", w, h);  //  ... or movie



  img1 = loadImage ("salvador.JPG");      // load my image using Procesing Image
  img1.loadPixels();

  img2 = createImage (w, h, RGB);         //my new images
  img2.loadPixels();

  img3 = createImage (w, h, RGB);
  img3.loadPixels();

  font = createFont("Courier", 12);        // create a text font
  textFont(font, 12);
}


//-----------------------------------------------------------------------------
// Main loop
void draw()
{
  background(0);
  opencv.read();                                 //  Grabs a frame from the camera

  image( opencv.image(), 0, 0 );                  // Draw color input image from camera
  text("Color imput image", 10, h+15);

  opencv.convert(OpenCV.GRAY);                    //  Convert to grayscale

  image( opencv.image(OpenCV.MEMORY), 320, 0);    // Draw the background image
  text("Background", 320 + 10, h+15);

  if ( bCaptureBackground )                       // capture background if needed
  {                                               // snapshot by pressing spacebar
    bCaptureBackground = false;
    opencv.remember(OpenCV.BUFFER);
  }

  opencv.absDiff();                               // Calculates the absolute difference
  opencv.threshold(threshold);                    // Apply threshold and show results
  image( opencv.image(), 640, 0 );
  text("Binary image", 640+10, h+15);             // Draw the binary image

  cv_pixels = opencv.pixels();                    // Access openCV pixels[]

  for (int i = 0; i < w*h; i++)
  {
    if ( brightness(cv_pixels[i]) > threshold ) {
      img2.pixels[i] =  img1.pixels[i];           // create my image 2
    }
    else { 
      img2.pixels[i] = color(0);  //cv_pixels[i]; // black
    }
  }

  img2.updatePixels();                           // update result
  image( img2, 0, h+20 );                        // Draw my img2

  text("My new image 1", 0 + 10, 2*h+20+15  );

  // access the input image in original state
  img3.copy(opencv.image(OpenCV.SOURCE), 0, 0, w, h, 0, 0, w, h);  
  for (int i = 0; i < w*h; i++)
  {
    if ( brightness(cv_pixels[i]) < threshold ) {

      img3.pixels[i] = img1.pixels[i];          // create my image 3
    }
  }

  img3.updatePixels();                          // update result
  image( img3, w, h+20 );                       // Draw my img2
  text("My new image 2", w + 10, 2*h+20+15  );

  text("Press space to store background", 640+10, h+50);
  text("Change threshold with key +/-", 640+10, h+65);
  text("Threshold: " + threshold, 640 + 10, h+80  );
}


//-----------------------------------------------------------------------------
void keyPressed()
{
  if (key == ' ')
  {
    bCaptureBackground = true;
  }

  if (key == '+')  threshold ++;
  if (key == '-')  threshold --;
}

//-----------------------------------------------------------------------------
// Clean resources
public void stop() {
  opencv.stop();
  super.stop();
}


