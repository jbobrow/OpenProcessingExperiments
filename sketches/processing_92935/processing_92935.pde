
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/70537*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

  
int maxImages = 13; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first


PImage[] images = new PImage[maxImages]; 

void setup() {
  size (420,420);
  
  
 for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "water" + i + ".jpg" ); 
  }
  
  
 PImage img;
  img = loadImage("gold.png");
  image(img, mouseX, mouseY);
}


void draw () {
  background(0);
  image(images[imageIndex],0,0); 
  
}


void mousePressed() {
  PImage img;
  img = loadImage("gold.png");
  image(img, mouseX, mouseY);



  // A new image is picked randomly when the mouse is clicked
  // Note the index to the array must be an integer!
  
  imageIndex = int(random(images.length));
  
}





