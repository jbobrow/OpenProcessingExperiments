
PImage img01;
PImage img02;
PImage img03;
PImage img04;
PImage img05;

void setup(){
size(3*250,2*250);
smooth();

img01=loadImage("Schaf.png");
img02=loadImage("Gras.png");
img03=loadImage("Hintergrund.png");
img04=loadImage("Wolken.png");
img05=loadImage("Schaf02.png");

}

void draw(){
image(img03,0,0);
image(img02,0,height-100);
img05.resize(150,0);
image(img05,mouseX,height-110);

}
