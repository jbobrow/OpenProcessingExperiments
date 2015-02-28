
int counter = 0;
PImage[] images = new PImage[6];
 
void setup() {
  size(213, 223);
  background(0);
  images[0] = loadImage( "ny.jpg" );
  images[1] = loadImage( "ny2.jpg" );
  images[2] = loadImage( "ny3.jpg" );
  images[3] = loadImage( "ny4.jpg" );
  images[4] = loadImage( "ny3.jpg" );
  images[5] = loadImage( "ny2.jpg" );
}
 
void draw() {
    background(0);
    image(images[counter], 0, 0);
  }
   
 void mousePressed() {
  if(counter < 5) {
    counter++;
 } else {
   counter = 0;
 }
}

