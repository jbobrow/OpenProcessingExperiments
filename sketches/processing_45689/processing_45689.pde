
PImage img;
 
PFont typo;
 
void setup(){
size(346,720);
 
typo=loadFont("BodoniMTCondensed-Bold-48.vlw");
textFont(typo);
 
img=loadImage("Marie.jpg");
}
 
void draw(){
image(img,0,0);
textSize(36);
fill(230,67,56);
text("Marie Doranges",120,660);
fill(0,0,0);
}

