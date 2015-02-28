
void setup(){
size(400,400);
noStroke();
smooth();}

void draw(){

background(255);
frameRate(15);
  
  float x=mouseX;
  float y=mouseY;
  float ix=width-mouseX;
  float iy=height-mouseY;
  float lix=width-(2*mouseX);
  float liy=height-(2*mouseY);
  
  fill(255,255,0,200);
  ellipse(ix,iy,x,y);
fill(0);
  ellipse(iy+30,ix-20,lix,liy);
  fill(0);
  ellipse(iy-30,ix-20,lix,liy);
 arc(x-20, y, 80, 80, 0, PI, OPEN);}
