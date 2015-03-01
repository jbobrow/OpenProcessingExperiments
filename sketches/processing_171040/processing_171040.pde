
/* @pjs preload = "geod.JPG"' */
PImage thing;
int count;

  size (600, 225);
  smooth ();
  thing = loadImage("geod.JPG");  
  count = thing.width * thing.height;
  thing.loadPixels();
  loadPixels();
  for (int i = 0; i < count; i +=1 ) {
    pixels[i] = thing.pixels[i /2];
  }
  updatePixels();


