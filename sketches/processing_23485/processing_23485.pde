
PImage flower; //PImage stores images
int xpo = 0;

void setup() {
  size(450,300);
  flower = loadImage("flower.JPG");
  background(0);
  smooth();
}

void draw() {
  // Pick a random point
  int x = int(random(flower.width));
  int y = int(random(flower.height));
  int loc = x + y*flower.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(flower.pixels[loc]);
  float g = green(flower.pixels[loc]);
  float b = blue(flower.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  ellipse(x,y,random(30,30),random(10,50));
}
void mousePressed () {
  loop();
  setup();
}




