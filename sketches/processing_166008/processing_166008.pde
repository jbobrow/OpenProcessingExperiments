
PImage p1;
int pointillize = 16;
void setup(){
  background(255);
  frameRate(1500);
  size(750, 750);
  p1 = loadImage("Beyandjay.jpg");
 
}

void draw(){
  fill(255);
  textSize(24);
 {
 
 if (key == 'q' || key == 'Q') {
  imageMode (CENTER);
   image(p1, width/2, height/2);



}

  
  // Pick a random point
  int x = int(random(p1.width));
  int y = int(random(p1.height));
  int loc = x + y*p1.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(p1.pixels[loc]);
  float g = green(p1.pixels[loc]);
  float b = blue(p1.pixels[loc]);
  
  // Back to shapes! Instead of setting a pixel, we use the color from a pixel to draw a circle.
  noStroke();
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize); 
}
 } 



