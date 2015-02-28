
PImage img;
PImage img2;
PImage img3;


void setup () {
size (1000,720);
img= loadImage ("IMG_4081-1.jpg");
img2= loadImage ("IMG_5182.jpg");
img3= loadImage ("IMG_5313.jpg");
}


void draw(){
  background (0,0,15);
image (img,mouseX,mouseY);
image (img2,200,133);
image (img3,300,308);
}

