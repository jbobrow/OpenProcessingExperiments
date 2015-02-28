
/**
 * talleres CCE mariana carranza
 * Example 02: imagen-02 interactiva
 * control de threshold con mouseDragged()
 * para hacerla interactiva necesito una imagen auxiliar (screen)
 * by mariana carranza.   
 */

import processing.video.*;

Capture video;

PImage myImage;
int numberPixels;
int threshold = 200;

//-----------------------------------------------------------------------------
void setup() {
 size (640, 480, P2D);
  // The name of the capture device is dependent those
  // plugged into the computer. To get a list of the 
  // choices, uncomment the following line 
  // println(Capture.list());
  // And to specify the camera, replace "Camera Name" 
  // in the next line with one from Capture.list()
  // myCapture = new Capture(this, width, height, "Camera Name", 30);

  // This code will try to use the last device used
  // by a QuickTime program
  video = new Capture(this, 640, 480);

 
  smooth();

  numberPixels = video.width* video.height;
  
  loadPixels();                         // Accedo a los pixels de mi pantalla
}


//-----------------------------------------------------------------------------
void captureEvent(Capture myCapture) {
  myCapture.read();
}

//-----------------------------------------------------------------------------
void draw() {
  video.loadPixels();
  for ( int i = 0; i < numberPixels; i++) {
    color myPixel =  video.pixels[i];
    float brigthVal = brightness (myPixel);
    if ( brigthVal >  threshold) {
      pixels[i] = color (255, 0, 0);    //Modifico lo pixels de mi pantalla
    }
    else {
      pixels[i] = color (0, 255, 0);    //Modifico lo pixels de mi pantalla
    }
  }
  updatePixels();                       // Actualizo los pixels de mi pantalla
  //image(video, 0, 0);
}

//-----------------------------------------------------------------------------
// Control mouse
void mouseDragged() {
  threshold = int( map(mouseX, 0, width, 0, 255) );
}


