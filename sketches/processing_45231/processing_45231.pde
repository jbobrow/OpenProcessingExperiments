
PImage myImage;
void setup(){
  size(500,500);
  myImage = loadImage("Photo on 2011-11-07 at 11.18 #4.jpg");
}
void draw(){
  tint(mouseX,mouseY,mouseX,mouseX);
  image(myImage,0,50,250,2500);
  image(myImage,250,50,250,250);
  image(myImage,150,50,250,250);
}

