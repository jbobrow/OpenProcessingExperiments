
PImage img;
PFont font;



void setup()
{
  size(1500, 1500);
  
  font=loadFont("Serif-48.vlw");
  img= loadImage("halloween.png");
  
}

void draw()
{
  background(0);
  textFont(font);
  text("Happy Halloween", width/5, height/15);
  fill(0,200,0,800);
  image(img, 100, 150);
  
}


