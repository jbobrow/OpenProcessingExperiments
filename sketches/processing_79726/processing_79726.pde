
/* Credit: Faysal Itani: http://www.openprocessing.org/sketch/41036 */


int maxImages = 7; // number of images for the stop motion
int imageIndex = 0; // first image

//array
PImage[] images = new PImage[maxImages]; 

void setup() {
  size(800, 533); //resized to image size
  
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "street" + i + ".jpg" ); 
  }
}

void draw() {
  image(images[imageIndex],0,0); 
}

void mousePressed() {
  imageIndex = (imageIndex + 1) % images.length; //sequence of images
}

//void keyPressed() {
 // if (key == CODED) {
   // if (keyCode == UP) {
  //imageIndex = (imageIndex + 1) % images.length; //sequence of images
    //}
 // }
//}

