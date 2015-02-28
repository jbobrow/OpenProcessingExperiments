
PImage img;

void setup() {
  size(600,600);
  img = loadImage("swamp.JPG");
  smooth();
  frameRate(100);
  image(img,0,0,600,600);
}

void draw() {
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  int s = int(random(10,100));
  fill(r,g,b,80);
  translate(-(s/2),-(s/2));
  ellipse(x,y,s,s);
  rect(x,y,s,s);
}

