
PImage[] images = new PImage[4];


int counter =0;

void setup () {
 size (800, 600);
//load images into the array 
for (int i=0; i<images.length; i++) {
 images[i] = loadImage(i+1+".png");
 
 }
 

 frameRate (10);
  
}

void draw () {
  background (100, 200, 50);
  
  imageMode(CENTER);
 image(images[counter], mouseX, mouseY);
 
 counter ++;
 
 if (counter>3) {
  counter = 0;
  
  
 } 
  
  
}

