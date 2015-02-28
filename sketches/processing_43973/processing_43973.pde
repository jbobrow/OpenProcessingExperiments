
PImage img;
int pointillize= 45;
import processing.video.*;
Movie myMovie; 
void setup() {
  size(960,720);
 
  // load instance of dogTV
  img = loadImage("dogtv1.png");
  myMovie = new Movie(this, "Savage_Bees.mov");
  myMovie.loop();
  background(255);
  smooth();
}

void draw() {
  
   // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  
  // Back to shapes! Instead of setting a pixel, we use the color from a pixel to draw a circle.
 noStroke();
  fill(r,g,b,50);
  rect(x,y,pointillize,pointillize); 
  image(myMovie,359, 310);
}

void movieEvent(Movie m) {
  m.read();
}




