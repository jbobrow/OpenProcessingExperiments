
size(500,500);
background(random(100));
int number = 50;

PImage myImg = loadImage("dylan.jpg");
PFont f = loadFont("FranklinGothic-Condensed-100.vlw");
textFont(f);

image(myImg, random(width-325), random(height-400), 325, 400);

for (int i = 0; i < height; i++) {
  
  fill(random(255),random(255),random(255),90);
  text("BOB DYLAN", random(width), i*height/8);

}


