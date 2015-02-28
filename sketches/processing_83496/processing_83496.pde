
PImage img;

void setup() {
  size(700,370);
  img = loadImage("ha.png");
  background(255);
  smooth();
  noStroke();

}

void draw() {
  frameRate(1000);
  // Pick a random point
  int x =  int(random(img.width)); //mouseX; 
  int y =  int(random(img.height)); //mouseY;

  int index = x + y*img.width;

  // Look up the RGB color in the source image
  loadPixels();

  float r = red(img.pixels[index]);
  float g = green(img.pixels[index]);
  float b = blue(img.pixels[index]);

  // Draw an ellipse at that location with that color
  fill(r,g,b,random(50,150));
  //rect(x,y,random(5,30),random(5,30));
  
  ellipse(x,y,random(5,20),random(5,20));
}

