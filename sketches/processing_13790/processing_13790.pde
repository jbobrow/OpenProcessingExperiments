


int maxImages = 26; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first "animal0.jpg"

// Declaring an array of images.
PImage[] images = new PImage[maxImages]; 

void setup() {
  size(400,400);
  frameRate (10);
  
  // Loading the images into the array
  // Don't forget to put the JPG files in the data folder!
  
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "hypnotize" + i + ".jpg" ); 
  }
}

void draw() {
  // Displaying one image
  
  image(images[imageIndex],0,0);
  imageIndex = (imageIndex + 1) % images.length;
}

/*
void mousePressed() {
  // A new image is picked randomly when the mouse is clicked
  // Note the index to the array must be an integer!
  imageIndex = int(random(images.length));
}
*/

