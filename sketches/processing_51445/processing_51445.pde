
PImage pic;
int pointillize = 13;

void setup ()
{
  size(240,180);
  pic=loadImage("Copus1.jpg");
  background (255);
  smooth();
}

void draw ()
{
  int x = int(random(pic.width));
  int y = int(random(pic.height));
  int loc = x + y*pic.width;
  
  loadPixels();
  float r = red(pic.pixels[loc]);
  float g = green(pic.pixels[loc]);
  float b = blue(pic.pixels[loc]);
    //image(pic, 0, 0); 
  
  noStroke();
  fill(r,g,b,45);
  ellipse(x,y,pointillize,pointillize); 
}
  

