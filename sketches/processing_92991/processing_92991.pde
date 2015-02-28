
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/70537*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

  
int maxImages = 13; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first

PImage goldfish = loadImage("gold.png");


PImage[] images = new PImage[maxImages]; 


void setup() {
  size (420,420);
  
  
 for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "water" + i + ".jpg" ); 
 }
}


void draw () {
  background(0);
  image(images[imageIndex],0,0); 
  goldfish = loadImage("gold.png");
}



void mousePressed() {
  imageIndex = int(random(images.length));  
  goldfish = loadImage("gold.png");
  image(goldfish, mouseX, mouseY);
  
}


void mouseDragged() {
  goldfish = loadImage("gold.png");
image(goldfish, mouseX, mouseY);
}



