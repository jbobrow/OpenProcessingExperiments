
int maxImages = 10;
int imageIndex = 0;
boolean isPlaying = false;

PImage[] images = new PImage[maxImages];
 
void setup() {
  size(1600,900);
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "Panel" + i + ".jpg" );
  frameRate(0.4);
  }
}

void draw() {
  background(0);
  image(images[imageIndex],0,0);
  if (isPlaying == true) {
    imageIndex = (imageIndex + 1) % images.length;
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    isPlaying = true;
  }
}
 
void mouseReleased() {
  if (mouseButton == RIGHT) {
    isPlaying = false;
  }
}
 
void mousePressed() {
  if (mouseButton == LEFT) {
    isPlaying = true;
  }
}



