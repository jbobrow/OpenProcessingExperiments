


  
int maxImages = 13; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first


PImage goldfish = loadImage("goldfish.png");
PImage[] images = new PImage[maxImages]; 


void setup() {
  size (420,420);
PImage = goldfish;
image(goldfish, mouseX, mouseY);

  
 for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "water" + i + ".jpg" ); 
    
 }
}


void draw () {
  background(0);
  image(images[imageIndex],0,0); 
}

void mouseMoved() {
  PImage= goldfish;
image(goldfish, mouseX, mouseY);
}


void mousePressed() {
  imageIndex = int(random(images.length));    
}


void mouseDragged() {
  PImage= goldfish;
image(goldfish, mouseX, mouseY);
}

void mouseReleased() {
  PImage= goldfish;
image(goldfish, mouseX, mouseY);
}


