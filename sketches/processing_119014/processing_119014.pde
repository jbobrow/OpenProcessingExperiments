
/* @pjs preload="kid_walk.png"; */

PImage img;
void setup(){
  size(800,400); 
  img = loadImage("kid_walk.png");
  frameRate(24);
}

int frame = 0;

int x = 0;
int sx = 12;
int seq = 2;

void draw(){
  background(150);
  x += sx;
  int framew = img.width / 13;
  int frameh = img.height / 4;
  int imgx = (frame%13)*framew;
  int lastx = width - framew;
  if(x > lastx){
    sx = -sx;
    x += sx;
    seq = 1;
  } if (x < 0){
    sx = -sx;
    x += sx;
    seq = 2;
  }
  int imgy = frameh*seq;
  blend(img,
    imgx, imgy, framew, frameh,
    x, 0, framew, frameh,
    BLEND);
  
  frame++;
}


