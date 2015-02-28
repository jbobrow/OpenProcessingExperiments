
PImage img01;
PImage img02;
PImage img03;
PImage img04;
PImage img05;

void setup(){
size(750,500);
smooth();

img01=loadImage("Schaf.png");
  img01.resize(150,0);
img02=loadImage("Gras.png");
img03=loadImage("Hintergrund.png");
img04=loadImage("Wolken.png");
img05=loadImage("Schaf02.png");
img05.resize(150,0);
}

void draw(){
image(img03,0,0);
image(img02,0,height-100);
image(img05,mouseX,height-110);

if(mousePressed){
    image(img03,0,0);
 image(img04,mouseX,mouseY);
image(img01,width/2-75,height/2-100);

}

}

