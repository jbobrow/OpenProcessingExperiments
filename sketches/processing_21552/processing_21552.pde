

int counter = 0;
PImage[] images = new PImage[8];  // an array holding 5 images


void setup() {
  size(600, 600);
  background(200);
  colorMode(HSB);
  images[0] = loadImage( "sign.jpg" );
  images[1] = loadImage( "scream.jpg" );
  images[2] = loadImage( "snow.JPG" );
  images[3] = loadImage( "sad.jpg" );
  images[4] = loadImage( "melt.jpg" );
  images[5] = loadImage( "flower.jpg" );  
  images[6] = loadImage( "hooray.jpg" );
  images[7] = loadImage( "yay.jpg" );
}


void draw() { 
    background(200);
    imageMode(CENTER);
    image(images[counter], 300, 300);   // make an image and place it at 300/300
  }
  
 void mousePressed() {
   if (counter < images.length - 1){
  counter++; 
 } else {
 counter = 0;
 }
 }

