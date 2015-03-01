
PImage img;

void setup() { 
 size(960,640); 
  img = loadImage("portal.PNG");
}

void draw() {
  image(img, 0, 0);
  textSize(32);
text("Now You're Drinking With Portals", 10, 30);
textSize(18);
text("A Night With Food and Video Games", 200, 55);
}
