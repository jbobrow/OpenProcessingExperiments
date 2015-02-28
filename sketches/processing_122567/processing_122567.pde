
//How to add images. Still haven't figured out how to change the size of the image.

PImage img;

void setup(){
  size(900,900);
  img=loadImage("Brownie.jpg");
}
void draw(){
  image(img,-850,-550);
}


