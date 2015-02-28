
PImage img;
PFont font;

void setup() {
  size(600,600);
  img = loadImage("swamp.JPG");
  font = loadFont("SweetLeaf-100.vlw");
  smooth();
  frameRate(80);
  image(img,0,0,600,600);
}

void draw() {
  textFont(font);
  int x = int(random(img.width));
  int y = int(random(img.height));
  int x2 = int(random(img.width));
  int y2 = int(random(img.height));
  int x3 = int(random(img.width));
  int y3 = int(random(img.height));
  int loc = x + y*img.width;
  
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  int s = int(random(10,100));
  textSize(s);
  fill(r,g,b,80);
  translate(-(s/2),-(s/2));
  text("Can", x, y);
  text("You", x2, y2);
  text("See?", x3, y3);
  ellipse(x,y,s,s);
  rect(x,y,s,s);
}

