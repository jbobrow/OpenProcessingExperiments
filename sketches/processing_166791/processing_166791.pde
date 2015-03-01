
  PImage img;
  PImage img2;
void setup(){
  size(600,400);
  img = loadImage("wine_glass_BW.jpg");
  img2 = loadImage("red-lips-and-wine_mod.gif");
}

void draw(){
  colorMode(HSB,360,100,100,225);
  float r= map(mouseX, 0,1200, 0,100);
  tint(340,100,r,220);
  image(img,0,0,width,height);
if(mousePressed){
  colorMode(HSB,360,100,100,225);
  tint(315,100,90,220);
  image(img2,0,0,width,height);
}
}
