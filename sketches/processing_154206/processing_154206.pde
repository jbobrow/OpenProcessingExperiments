
int maxImages = 12; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first
boolean isPlaying = false;
int value=0;
color c;

// Declaring an array of images.
PImage[] images = new PImage[maxImages];

void setup() {
  size(440, 498);

  // Loading the images into the array
  // Don't forget to put the JPG files in the data folder!
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "selfPortrait" + i + ".png" );
  }
  frameRate(6);
  smooth();
}

void draw() {
  
  background(0);
  tint(c);
  image(images[imageIndex], 0, 0);


  if (isPlaying == true) {
    //imageIndex = (imageIndex + 1) % images.length;
    imageIndex = int(random(images.length));
  } 
  else if (isPlaying == false) {
    imageIndex = value ;
  }
  if (mouseX>30 && mouseX<width-30 && mouseY>30 && mouseY<height-30) {
    isPlaying = false;
  } 
  else {
    isPlaying = true;
     c = color(100,random(100, 125),100 );
  }
}


void mouseMoved() {
  value = value + 1;
  if (value > 11) {
    value = 0;
  }
}



