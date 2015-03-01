
/* @pjs preload = "geod.JPG"' */

void setup (){
  size (600, 225);
  smooth ();
  
}

void draw (){
PImage thing= loadImage("geod.JPG");
int count = thing.width * thing.height;
thing.loadPixels();
loadPixels();
for (int i = 0; i < count; i +=1 ) {
pixels[i] = thing.pixels[i /2];
}
updatePixels();
}



