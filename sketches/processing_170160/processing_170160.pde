
/* @pjs preload = "33525833_001_b.jpg"; */
PImage img;
void setup(){
  size(300,300);
  noStroke();
  img=loadImage("33525833_001_b.jpg");
}
void draw(){
  int ix=int(random(img.width));
  int iy=int(random(img.height));
  color c=img.get(ix,iy);
  fill(c,102);
  int xgrid=int(random(-2,5))*50;
  int ygrid=int(random(-2,5))*50;
  rect(xgrid,ygrid,100,100);
}
  


