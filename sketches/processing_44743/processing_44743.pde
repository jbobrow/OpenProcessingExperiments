
PImage img;
PFont font;

void setup() {
  size(600,600);
  img = loadImage("swamp.JPG");
  font = loadFont("SweetLeaf-100.vlw");
  smooth();
  frameRate(80);  //Speed of shapes covering image
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
  
  loadPixels();            //Selects red, green and blue variables from pixels
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  int s = int(random(10,100));   //Randomizes size of shapes
  textSize(s);   //Randomizes text size
  fill(r,g,b,80);   //Uses the red, green and blue variables to create RGB code fo each shape, semi-transparent
  translate(-(s/2),-(s/2));  //Centers each image over the the chosen pixel
  text("Can", x, y);
  text("You", x2, y2);
  text("See?", x3, y3);
  ellipse(x,y,s,s);
  rect(x,y,s,s);
}

