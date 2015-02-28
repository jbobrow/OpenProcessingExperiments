
/**
 * talleres CCE mariana carranza
 * OpenCV image + copy
 * basado en ejemplos OpenCV
 * by mariana carranza.
 * my images: Spindel.jpg (320 × 480) 
 */
 
import hypermedia.video.*;

OpenCV opencv;

//___________________________________________________________________
void setup() {

  size( 320, 480);                   

  // initialize opencv
  opencv = new OpenCV( this );                  

  //crea el espacio para las imagenes - the size of my image
  opencv.allocate( width, height );
}


//____________________________________________________________________
void draw() {


  // copy the entire image in background (allocate size)
  opencv.copy( "Spindel.jpg" );     

  // or crop and resize
  // copy just a part of the image in the allocate size 
  //opencv.copy( "Spindel.jpg", 0, 55, 240, 155, mouseX, mouseY, 240, 100);

  image( opencv.image(), 0, 0 );                   // show the result
}


//_____________________________________________________________________
// REMEMBER CLEAN RESOURCES !!!!!!!!!

void stop() {                                      // Clean resources
  opencv.stop();
  super.stop();
}


