
PImage pic;
void setup(){
  size (300,300);
  pic = loadImage("DSC_0058.JPG");
  noStroke();
  smooth();
  frameRate(30);
}

void draw(){
   int x = floor(random(0,pic.width));
  int y = floor(random(0,pic.height));
  color img =pic.get(x,y);
  float a=random(300);
 float b=random(100,200);
  fill(img,80);
  ellipse(a,b,random(25,50),random(25,50));
  a*=2;
  b*=6;
  
}
  

