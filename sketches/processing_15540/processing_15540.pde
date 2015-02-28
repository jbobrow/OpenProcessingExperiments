


int maxMasks = 15; // Total # of masks
int imageIndex = 0; // Initial image to be displayed is the first "animalMask0.jpg"

// Declaring an array of masks
PImage[] masks = new PImage[maxMasks]; 

void setup() {
  size(550, 550);
  smooth();
  frameRate (10);

  // Loading the lenses into the array
  // Don't forget to put the JPG files in the data folder!

  for (int i = 0; i < masks.length; i ++ ) {
    masks[i] = loadImage( "animalMask" + i + ".png" );
  }
}


void draw() {
 // Displaying one image
 image(masks[imageIndex],25,0);
 
 // animate images (runs automatically)
 //imageIndex = (imageIndex + 1) % lenses.length;
 }

void mousePressed() {
  // new image is layered every time mouse clicked
  imageIndex = (imageIndex + 1) % masks.length;
}



