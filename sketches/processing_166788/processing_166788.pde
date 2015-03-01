
PImage img;
boolean b = true;
int s = 0;
int g = 99;

void setup() {
  size(1024, 640);
  string url = "http://fc01.deviantart.net/fs71/i/2013/133/3/0/arc_reactor__iron_man__wallpaper_by_moon_dazzle-d656jfy.png";
  img = loadImage(url);

}

void draw() {
 
  if (s<99) b = true;
  else b = false;
 
  if (b==true) {
    s++;
    colorMode(HSB, 360, 100, 100);
    tint(191, 54, s);
    image(img, 0, 0, width, height);
  } 
  else if (b==false) {
      g--;
      tint(191, 54, g);
      image(img, 0, 0, width, height);
    }
  }
  
  
  void mouseClicked() {
    s= 0;
    g= 99;
  }
