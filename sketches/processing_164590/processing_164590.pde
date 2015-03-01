
PImage myImage;
PImage myImage2;
PImage myImage3;
PImage myImage4;

void setup() {
   size(386,500);
   myImage=loadImage("background.jpg");
   myImage2=loadImage("grad.png");
   myImage3=loadImage("text.png");
   myImage4=loadImage("explanation.png");
}
void draw() {
  image(myImage,0,0);
  image(myImage2,0,0);
  image(myImage3,0,0);
if (mouseX > 100 && mouseX < 286 && mouseY < 400 && mouseY > 100) {
  image(myImage4, 0, 0);
}

}


