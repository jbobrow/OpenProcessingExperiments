
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
colorMode(RGB,255);
//frameRate(600);
}

void draw() {
  int x;
  int y;
  int rwidth;
  int rheight;
  int xpos, ypos;
  float rtot=0, gtot=0, btot=0;
  float newr, newg, newb;
  color newcolor;
  
  x = int(random(pic.width));
  y = int(random(pic.height));
  rwidth = int(random(10,20));
  rheight = int(random(10,20));
  if (x+rwidth >= pic.width)
    rwidth = pic.width-x;
  if (y+rheight >= pic.height)
    rheight = pic.height-y;
  pic.loadPixels();
//  print(x); print(" ");  print(y); print(" "); print(width); print(" "); println(height);
  for (ypos = y; ypos < y+rheight; ypos++) {
    for (xpos = x; xpos < x+rwidth; xpos++) {
      rtot += red(pic.pixels[ypos*pic.width+xpos]);
      gtot += green(pic.pixels[ypos*pic.width+xpos]);
      btot += blue(pic.pixels[ypos*pic.width+xpos]);
    }
  }
  newr = rtot / (rheight*rwidth);
  newg = gtot / (rheight*rwidth);
  newb = btot / (rheight*rwidth);
  newcolor = color(newr, newg, newb);
  
  for (ypos = y; ypos < y+rheight; ypos++) {
    for (xpos = x; xpos < x+rwidth; xpos++) {
      pic.pixels[ypos*pic.width+xpos] = newcolor;
     }
  }
  pic.updatePixels();
  image(pic,0,0,wid,hgt);
}


