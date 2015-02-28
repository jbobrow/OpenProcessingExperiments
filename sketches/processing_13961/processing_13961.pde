
//Project 3, Collage, Miu Miu S/S 10 Cats by Leslie Bloomfield

PImage blackcats;
PImage bluecats;
PImage whitecats;
PShape miumiu;
PFont font;

void setup()
{
  size(640, 480);
  smooth();
  noLoop();
  
  blackcats = loadImage("blackcats.png");
  bluecats = loadImage("bluecats.png");
  whitecats = loadImage("whitecats.png");
  miumiu = loadShape("miumiu.svg");
  font = loadFont("CourierNewPSMT-12.vlw");
}
 
void draw()
{
 background(#66768f);
 
 textFont(font);
 textSize(12);
 fill(0);
 text("meow", random(width), random(height));
 text("meow", random(width), random(height));
 text("meow", random(width/2), random(height/2));
 text("meow", random(width/2), random(height/2));

 image(blackcats, random(width), random(height));
 image(blackcats, random(width), random(height));
 image(blackcats, random(width/2), random(height/2));
 image(blackcats, random(width/2), random(height/2));
 
 image(bluecats, random(width), random(height));
 image(bluecats, random(width), random(height));
 image(bluecats, random(width/2), random(height/2));
 image(bluecats, random(width/2), random(height/2));
 
 image(whitecats, random(width), random(height));
 image(whitecats, random(width), random(height));
 image(whitecats, random(width/2), random(height/2));
 image(whitecats, random(width/2), random(height/2));
 
 shape(miumiu, 550, 400, 100, 100);
}

void mousePressed()
{
  redraw ();
}

