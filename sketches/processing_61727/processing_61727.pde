
void setup(){
size(400,400);
}
void draw(){
int x=mouseX;
  int y=mouseY;
  int px=pmouseX;
  int py=pmouseY;
  float ix=width-mouseX;
  float iy=height-mouseY;

fill(75,100,255,150);
  ellipse(px,py,ix/2,y/2);
  fill(0,159);
  ellipse(x,y,x/2,y/2);
}


