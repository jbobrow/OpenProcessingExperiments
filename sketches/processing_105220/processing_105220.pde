
PImage smile;

void setup () {
  size (800,600);
  smile = loadImage( "smile.jpg");
}

void draw () {
  image (smile, 0, 0, 100, 100);
  image (smile, 100, 0, 100, 100);
  image (smile, 200, 0, 100, 100);
  image (smile, 300, 0, 100, 100);
  
  
  
//  image (smile, 0, 0, mouseX, mouseY);
  
}


