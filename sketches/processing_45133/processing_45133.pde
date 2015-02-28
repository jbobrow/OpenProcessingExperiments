
PImage img;

PFont typo;

void setup(){
size(346,720);

typo=loadFont("Perpetua-BoldItalic-48.vlw");
textFont(typo);

img=loadImage("JULIES.jpg");
}

void draw(){
image(img,0,0);
textSize(36);
text("Julie S.",120,660);
fill(0,0,0);
}

