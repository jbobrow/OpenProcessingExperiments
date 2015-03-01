
// for the wdka.nl unravel the code workshop low resolution patterns
//with an image, create a grid with 10 times 10 images, some rotated

PImage img;  // Declare variable "a" of type PImage

void setup() {
  size(640, 640);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("http://contrech.home.xs4all.nl/examples/pattern.jpg");  // Load the image into the program
}

/* showing how to comment more than one lines at the same time
comment 
comment
*/

void draw() {
  
  //showing how to create 10 times 10 images with two for loops
int teller=0;

  for ( int j = 0; j <10 ; j= j + 1)
  {
    for ( int i = 0; i <10 ; i= i + 1)
    {
      teller = teller + 1;
      drawImage(i, j, 90*teller);
    }
  }
}

void drawImage(int xC, int yC, float myAngle) {
  pushMatrix();
  translate(img.width/2 + 80*xC, img.height/2 + 80*yC );
  rotate(PI/2 * myAngle/90);
  image(img, -img.width/2, -img.height/2 );
  popMatrix();
}
