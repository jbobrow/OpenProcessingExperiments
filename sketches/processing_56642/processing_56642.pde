
PImage pic;
int wid, hgt;
void setup() {
pic = loadImage("Tulips.jpg");
wid = pic.width;
hgt = pic.height;
if (pic.width > 800) {
  wid = 800;
  hgt = pic.height*800/pic.width;
}
if (pic.height > 600) {
  hgt = 600;
  wid = pic.width*600/pic.height;
}
  
size(800,600);
image(pic,0,0,wid,hgt);
colorMode(HSB,255);
//frameRate(600);
}

void draw() {
  int x;
  int y;
  int rwidth;
  int rheight;
  int xpos, ypos;
  float nscale = 10;
  
  x = int(random(pic.width));
  y = int(random(pic.height));
  rwidth = int(random(40,80));
  rheight = int(random(40,80));
  if (x+rwidth >= pic.width)
    rwidth = pic.width-x;
  if (y+rheight >= pic.height)
    rheight = pic.height-y;
  pic.loadPixels();
//  print(x); print(" ");  print(y); print(" "); print(width); print(" "); println(height);
  for (ypos = y; ypos < y+rheight; ypos++) {
    for (xpos = x; xpos < x+rwidth; xpos++) {
      int phue = int(hue(pic.pixels[ypos*pic.width+xpos]));
      int psat = int(saturation(pic.pixels[ypos*pic.width+xpos]));
      int pbri = int(brightness(pic.pixels[ypos*pic.width+xpos]));
//      print(phue);     print(" ");      println(noise(xpos,ypos));
      phue += noise(xpos, ypos)*(nscale)+nscale/2;
      pic.pixels[ypos*pic.width+xpos] = color(phue, psat, pbri);
     }
  }
  pic.updatePixels();
  image(pic,0,0,wid,hgt);
}


