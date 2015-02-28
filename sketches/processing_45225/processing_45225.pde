
PImage zeB;
PImage dUT;
PImage bAL;

void setup(){
  size(1000,1000);
  zeB = loadImage("zebra-pattern-background-2-small.gif");
  dUT = loadImage("dots-square-grid-04-pattern-clip-art.jpg");
  bAL = loadImage("male-baldness.gif");
}

void draw(){
  tint(mouseX,mouseY, 0, 80);
  image(zeB,0,0,500,500);
  tint(mouseY,mouseX, 0, 60);
  image(zeB,500,0,500,500);
  tint(mouseX,mouseY, 0, 10);
  image(bAL, 0,0,250,250);
   tint(mouseX,mouseY, 0, 10);
  image(bAL, 250,250,250,250);
  tint(mouseY,mouseX, 200, 80);
  image(bAL, 0,500,500,500);
  tint(mouseX, mouseY, 200, 80);
  image(bAL, 500,500,500,500);
  tint(255,mouseX, mouseY, 10);
  image(zeB, 0,500,250,250);
  tint(255,mouseX, mouseY, 10);
  image(zeB, 250,750,250,250);
  tint(mouseY,mouseX, 0, 10);
  image(bAL, 500,0,250,250);
  tint(mouseY,mouseX, 0, 10);
  image(bAL, 750,250,250,250);
  tint(255,mouseY, mouseX, 10);
  image(zeB, 500,500,250,250);
  tint(255,mouseX, mouseX, 10);
  image(zeB, 750,750,250,250);  
}



