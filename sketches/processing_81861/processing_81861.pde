
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/23866*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img;
int pointillize = 40;

void setup() {
  size(1024,685);
  img = loadImage("water.jpg");
  background(img);
  smooth();
}

void draw() {
   if(mousePressed) { 
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;

  // Look up the RGB color in the source image
  
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
    frameRate(200);
  ellipse(x,y,pointillize,pointillize);
   }
}


