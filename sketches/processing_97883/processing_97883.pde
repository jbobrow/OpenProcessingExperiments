
PImage bxmn;
PImage bbsc;
int x=0;
int y=0;
int x1=0;
int y1=470;
void setup(){
  size(800,800);
  bxmn= loadImage("boxman.bmp");
  bbsc= loadImage("bbsc.bmp");
}
void draw(){
  background(203,199,199);
  image(bxmn,x,y);
  bxmn.loadPixels();
  image(bbsc,x1,y1);
  bbsc.loadPixels();
  x++;
  y++;
  x1++;
  y1++;
}


