
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-14: "Pointillism"

PImage img;
int pointillize = 10;

void setup() {
  size(600,600);
  img = loadImage("pourtea.jpg");
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
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize); 
}

void keyReleased(){
  if (key  == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  }
  
  //timestamp
  String timestamp () {
    Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


