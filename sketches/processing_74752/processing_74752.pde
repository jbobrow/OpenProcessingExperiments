



PImage img;
PImage img_2;
PImage img_3;
PImage img_4;
PImage img_5;
PImage img_6;
PImage img_7;

void setup (){
size (400, 400);
img = loadImage ("02_taja_luxa_flipbook 25.png");
img_2 = loadImage ("02_taja_luxa_flipbook 31.png");
img_3 = loadImage ("02_taja_luxa_flipbook 27.png");
img_4 = loadImage ("02_taja_luxa_flipbook 12.png");
img_5 = loadImage ("02_taja_luxa_flipbook 15.png");
img_6 = loadImage ("02_taja_luxa_flipbook 31 copy.png");
img_7 = loadImage ("black 15.png");
}

void draw () {
  
  
  
if (mouseX < 100 && mouseY < 100) {
image (img_2,0,0,200,200);
image (img_2,200,0,200,200);
image (img_2,0,200,200,200);
image (img_2,200,200,200,200);
} else {
image (img, 0, 0, 200, 200);
  image (img, 200, 0, 200, 200);
image (img, 0, 200, 200, 200);
    image (img, 200, 200, 200, 200);
}


if (mouseX < 100 && mouseY < 100) {
image (img_2,0,0,200,200);
image (img_2,200,0,200,200);
image (img_2,0,200,200,200);
image (img_2,200,200,200,200);
} else if (mouseX > 300 && mouseY < 100){
image (img_5,0,0,200,200);
image (img_5,200,0,200,200);
image (img_5,0,200,200,200);
image (img_5,200,200,200,200);}

else if (mouseX < 100 && mouseY > 300)
{ image (img_6,0,0,200,200);
image (img_6,200,0,200,200);
image (img_6,0,200,200,200);
image (img_6,200,200,200,200);}

else if (mouseX> 300 && mouseY > 300)
{ image (img_3,0,0,200,200);
image (img_3,200,0,200,200);
image (img_3,0,200,200,200);
image (img_3,200,200,200,200);}

else if (mousePressed) {
tint (255, 0,0);
image (img_7,0,0,200,200);
image (img_7,200,0,200,200);
image (img_7,0,200,200,200);
image (img_7,200,200,200,200);

}

else {
  noTint ();
image (img, 0, 0, 200, 200);
  image (img, 200, 0, 200, 200);
image (img, 0, 200, 200, 200);
    image (img, 200, 200, 200, 200);
}








}

