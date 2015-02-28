
/**
 * talleres CCE mariana carranza
 * OpenCV image + copy
 * basado en ejemplos OpenCV
 * by mariana carranza.
 * my two images: solutions.jpg (240 × 155), technicals-difficulties.jpg (240 × 155) 
 */


import hypermedia.video.*;

OpenCV opencv;
PImage img;
PFont font;

int xpos;

//_________________________________________________________________________________________________________
void setup() {

  size( 400, 300, JAVA2D);                     // JAVA2D is very nice render

  img = loadImage( "solutions.jpg" );

  opencv = new OpenCV( this );                  // initialize opencv
  opencv.allocate( img.width, img.height );     //crea el espacio para las imagenes - the size of my image

  font = loadFont("Ayuthaya-40.vlw");           // use: Tools/ Create Font to create font in sketch

  xpos = int((width-img.width)/2);              // x coordenate for position image in screen
}


//_________________________________________________________________________________________________________
void draw() {
  background(0);

  if (mouseX < width/2) {
    opencv.copy( "technical-difficulties.jpg" );     // copy the entire image in background (allocate size)

    // or copy just a part of the image - crop and resize
    //opencv.copy( "technical-difficulties.jpg", 0, 55, 240, 155, 0, 100, 240, 100);

    text("technical difficulties", xpos, 260);
  }
  else {
    opencv.copy( img );                              // copy the entire image in background

    // or copy just a part of the image - crop and resize
    //opencv.copy( img, 0, 0, img.width, img.height, img.width/2, img.height/2, img.width/2, img.height/2 );

    text("solutions", 260, 260);
  }


  image( opencv.image(), xpos, 50 );                   // show the result
}


//_________________________________________________________________________________________________________
// REMEMBER CLEAN RESOURCES !!!!!!!!!

void stop() {                                      // Clean resources
  opencv.stop();
  super.stop();
}


