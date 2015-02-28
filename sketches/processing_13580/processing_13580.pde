
// Hommage à Akakike
// PrPierre, 2008

PImage ima;

void setup(){
  ima=loadImage("Photo.jpg");
  size(ima.width,ima.height);
}

void draw(){
  copy(ima,mouseX,mouseY,30,30,mouseX,mouseY,30,30);
} 

