
PImage img;
int pointillize = 16;
 
void setup() {
  size(200,200);
  img = loadImage("14.png");
  background(0);
  smooth();
}
void reset() {
  background(0);
 
  
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
  noStroke();
   
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  //ellipse(x,y,pointillize,pointillize);
  rect(x,y,pointillize,pointillize);
  if(mousePressed){
     println("pressed");
    
    reset();
  }
}


