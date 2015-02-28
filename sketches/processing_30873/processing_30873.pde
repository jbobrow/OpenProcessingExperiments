
PImage image2;
class Catcher{
float xpos;
float ypos;
float width;
float height;

void show(){
  image2=loadImage("portal.jpg");
  image2.resize(100,100);
  image(image2, mouseX-50, mouseY-50);
}
}


