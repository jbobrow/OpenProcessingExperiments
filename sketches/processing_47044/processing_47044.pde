
PImage myImage1;
PImage myImage2;
PImage myImage3;
PImage myImage4;
PImage myImage5;
 
void setup(){
  size(1000,1000);
  myImage1 = loadImage("myImage1.jpg");
  myImage2 = loadImage("myImage2.jpg");
  myImage3 = loadImage("myImage3.jpg");
  myImage4 = loadImage("myImage4.jpg");
  myImage5 = loadImage("myImage5.jpg");
}

void draw(){
if (frameCount % 10 == 0) {
    fill(frameCount * 3 % 255, frameCount * 5 % 255,
      frameCount * 7 % 255);
    pushMatrix();
    translate(100, 100);
    rotate(radians(frameCount * 1  % 360));
     image(myImage1,mouseX,mouseY,500,750);
  image(myImage2,mouseX,mouseY,300,550);
  image(myImage3, mouseX, mouseY, 100,350);
  image(myImage4,mouseX,mouseY,50,150);
  image(myImage5, mouseX, mouseY, 25,75);
    popMatrix();
}}

