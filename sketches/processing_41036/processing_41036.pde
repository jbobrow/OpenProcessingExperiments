
// Assignment 4
// Faysal Itani

int maxImages = 11; // number of images for the stop motion
int imageIndex = 0; // first image

//array
PImage[] images = new PImage[maxImages]; 

void setup() {
  size(184,133); //resized to image size
  
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "horse" + i + ".jpg" ); 
  }
}

void draw() {
  image(images[imageIndex],0,0); 
}

void mousePressed() {
  imageIndex = (imageIndex + 1) % images.length; //sequence of images
}

