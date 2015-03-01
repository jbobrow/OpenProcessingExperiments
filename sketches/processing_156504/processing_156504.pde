
PImage myImage;
float imgPosY = 0;

void setup(){
size(1000,1000);
 myImage = loadImage("football.png");
}

void draw(){
    background(255);
  imgPosY = imgPosY +1;
image(myImage, 0, imgPosY, 500, 500);
}


