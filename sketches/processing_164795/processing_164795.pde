
PImage wimImg;
void setup(){
  size(500,500);
  wimImg=loadImage("wim.png");
}
void draw(){
  int x=mouseX-wimImg.width/2;
  int y=mouseY-wimImg.height/2;
  image(wimImg,x,y);
}


