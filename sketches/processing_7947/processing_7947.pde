
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-3: Swapping images

int maxImages = 16; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first

// Declaring an array of images.
PImage[] images = new PImage[maxImages]; 
 	

// Move the mouse across the image
// to change its value

int value = mouseX;

void setup() {
  size(175,175);
  
  // Loading the images into the array
  // Don't forget to put the JPG files in the data folder!
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "mini" + i + ".jpg" ); 
  }
}

void draw() {
  // Displaying one image
  image(images[imageIndex],0,0); 
  
}
void mouseMoved() {
  
    imageIndex = int(random(images.length));
   
}
  
  void mousePressed() { 
  link("http://www.meul.it/index.php", "_new"); 
}

