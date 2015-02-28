
//Italian greyhound in rain jacket


PImage online;
PImage GreyHOOND;
PImage GreyHOOND1;
PImage GreyHOOND2;
PImage GreyHOOND3;
PImage GreyHOOND4;
PImage GreyHOOND5;
PImage diamond;
PImage diamondgreen;
PImage diamondpink;

int x1 = 0;
int y1 = 25;
int spacing = 100;

void setup() {
  size (800, 800);
  smooth();
  background(#FFFFFF);

  online = loadImage("GreyHOOND.png");
  GreyHOOND = loadImage("GreyHOOND.png");
  GreyHOOND1 = loadImage("GreyHOOND1.png");
  GreyHOOND2 = loadImage("GreyHOOND2.png");
  GreyHOOND3 = loadImage("GreyHOOND3.png");
  GreyHOOND4 = loadImage("GreyHOOND4.png");
  GreyHOOND5 = loadImage("GreyHOOND5.png");
  diamond = loadImage("diamond.png");
  diamondgreen = loadImage("diamondgreen.png");
   diamondpink = loadImage("diamondpink.png");
 // for (int j = 0; j <= 800; j = j +spacing) {
  //  fill (20 +j/4);
   // for (int i = 0; i <= 800; i = i + spacing) {
    //  fill (20 + i/4);
      //for ( int k = 0; k <= 25; k = k +5){
      //image(online, j, i, 100, 100);
    }
 // }
//}

void draw() {
  if (mousePressed) {
    image( online, mouseX, mouseY, 100, 100);
  }
  if (key=='1') {
      image(GreyHOOND, mouseX, mouseY,100,100);{
    }
  }
  if (key =='2') {
    image(GreyHOOND1, mouseX, mouseY, 100, 100);
  }
  if (key=='3') {
    image(GreyHOOND2, mouseX, mouseY, 100, 100);
  }
  if (key=='4') {
    image(GreyHOOND3, mouseX, mouseY, 100, 100);
  }
  if (key=='5') {
    image(GreyHOOND4, mouseX, mouseY, 100, 100);
  }
  if (key=='6') {
    image(GreyHOOND5, mouseX, mouseY, 100, 100);
  }
  if (key=='7') {
    fill(200); // break SSSSTTTOPPP GREYHOUNDS!!!
  }
   if (key=='8') {
    image(diamond, mouseX, mouseY, 100, 100);
  }
  if (key=='9') {
    image(diamondgreen, mouseX, mouseY, 100, 100);
  }
  if (key=='0') {
    image(diamondpink, mouseX, mouseY, 100, 100);
  }
}






                
                
