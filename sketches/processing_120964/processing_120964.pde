
/* @pjs preload="img.jpg";  */
PImage img;
color c;
int n,nx,ny;

void setup() {
  size(413,309);
  background(2);
  img = loadImage("img.jpg");
  //size(img.width,img.height);
  image(img,0,0);
  img.loadPixels();
}

void draw() {
  nx = int(random(0,img.width-1));
  ny=int(random(0,img.height-1));
  n = nx*ny;
  c = color(red(img.pixels[n]),green(img.pixels[n]),blue(img.pixels[n]));
  stroke(c);
  line(nx,0,nx,height);
}


