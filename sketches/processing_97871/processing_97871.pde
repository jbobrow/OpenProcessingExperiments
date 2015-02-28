
int z = 320;

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

float speed = 5.5;
float d;
float f;

void setup() {
size(640, 480);
background (255);
smooth();

img = loadImage ("background.png");
img2 = loadImage ("playerfront.png");
img3 = loadImage ("playerleft.png");
img4 = loadImage ("playerright.png");
img5 = loadImage ("Ghost2.png");
}

void draw() {
 
 image(img, 0, 0);    //background image

if (keyPressed && (key == CODED)) {    //character movement
  if (keyCode == LEFT) {
    z--;
  } else if (keyCode == RIGHT) {
    z++;
  }
}
image(img2, z, 420);
if (keyPressed && (key ==CODED)) {
  if(keyCode ==LEFT){
    image(img3, z, 420);
  } else if (keyCode == RIGHT){
    image(img4, z, 420);
    
  }
}

d += random(-1, 3);
f += random(-5, 5);

image(img5, d, f); //fatghost image upload
}



