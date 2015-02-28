
int maxImages = 10;
int imageIndex = 0;
int x = 350;
int c = 350;
// Declaring an array of images.
PImage[] images = new PImage[maxImages];

void setup() {
  size(400, 400);

  // Loading the images into the array
  // Don't forget to put the JPG files in the data folder!
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( i + ".jpg" );
  }
  frameRate(1);
}

void draw() {

  background(0);
  image(images[imageIndex], 0, 0);

  // increment image index by one each cycle
  // use modulo " % "to return to 0 once the end of the array is reached
  imageIndex = (imageIndex + 1) % images.length;



  ellipse(x, 50, 40, 40);

  if ( x>100) {
    x=x-40;
  }
  if ( x<100) {
    x=350;
  }
  if ( x<351 ) {
    fill(254, 255, 0);
  }
  if ( x<260 ) {
    fill(8,255,17);
  }
  if ( x<120 ) {
    fill(255,0,196);
  }
  
  ellipse(x,350, 40,40);
}


