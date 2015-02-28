
size(500,500);
background(40);
int number = 50;

PImage myImg = loadImage("dylan.jpg");
PFont f = loadFont("FranklinGothic-Condensed-100.vlw");
textFont(f);

image(myImg, number, number, 325, 400);

for (int i = 0; i < height; i++) {
  
  fill(0,250,0,90);
  text("BOB DYLAN", 0, i*height/8);

}


