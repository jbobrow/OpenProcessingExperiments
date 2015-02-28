
/**
 * talleres CCE mariana carranza
 * Example 02: imagen-02 interactiva
 * control de threshold con mouseDragged()
 * para hacerla interactiva necesito una imagen auxiliar (screen)
 * by mariana carranza.   
 */

PImage myImage;
int numberPixels;
int threshold = 200;

//-----------------------------------------------------------------------------
void setup() {

  size (320, 320, P2D);
  smooth();
  myImage = loadImage ("frida.jpg");
  numberPixels = myImage.width* myImage.height;
  loadPixels();                      // Accedo a los pixels de mi pantalla
}

//-----------------------------------------------------------------------------
void draw() {
  for ( int i = 0; i < numberPixels; i++) {
    color myPixel =  myImage.pixels[i];
    float brigthVal = brightness (myPixel);
    if ( brigthVal > threshold) {
      pixels[i] = color (255,0,0);    //Modifico lo pixels de mi pantalla
    }
    else {
      pixels[i] = color (0,255,0);    //Modifico lo pixels de mi pantalla
    }
  }
  updatePixels();                     // Actualizo los pixels de mi pantalla
}

//-----------------------------------------------------------------------------
// Control mouse
void mouseDragged() {
  threshold = int( map(mouseX,0,width,0,255) );
}


