
PImage myImage;
PImage myImage2;
PImage myImage3;
PImage myImage4;
 
void setup() {
   size(1000,700);
   myImage=loadImage("1.JPG");
   myImage2=loadImage("2.JPG");
   myImage3=loadImage("text.png");
   myImage4=loadImage("3.JPG");
}
void draw() {
  image(myImage,0,0);
  image(myImage2,0,0);
  image(myImage3,0,0);
if (mouseX > 80 && mouseX < 286 && mouseY < 400 && mouseY > 80) {
  image(myImage4, 0, 0);
}
 
}


