

PImage img;

void setup() {
size (500,334);
background(0);
img=loadImage("simples.jpg");
}

void draw() {
image (img,0,0);
tint(79,160,224,30);
image (img,0,random(-20,20),1000,600);
}




