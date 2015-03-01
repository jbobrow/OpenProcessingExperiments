
void setup() {
 size(920,400);
}
  
void draw() {
  PImage img;
  img = loadImage("http://hdwallweb.com/wp-content/uploads/2014/05/31/skyline-pic.png");
  
  colorMode(HSB);
  float hue = map(mouseX, 0, width, 0, height) + 20;
  tint(hue,mouseX / 3);
  
  image(img, 0, 0);
}
