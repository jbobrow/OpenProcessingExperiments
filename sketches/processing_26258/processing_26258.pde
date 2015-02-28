
int x;
PFont PGothicFont;
PFont UIGothicFont;
PImage myImage;
PImage myImageJordan;
PImage myImageNBA;

void setup(){
  size(900,500);
  background(10,5,21);
x = 0;
PGothicFont = loadFont("MS-PGothic-84.vlw");
UIGothicFont = loadFont("MS-UIGothic-84.vlw");

myImage = loadImage("Kobe-Bryant-Fantasy-Basketball.jpg");
myImageJordan = loadImage("Michael20Jordan20dunk1.jpg");
myImageNBA = loadImage("NBA logo squarish.jpg");
}

void draw(){
  tint(232,218,94,24);
  image(myImage,10,50,260,350);
  
  tint(191,158,161,23);
  image(myImageJordan,650,120,220,300);  
  
  image(myImageNBA,300,150,300,200);
  
  fill(222,27,33);
  textFont(UIGothicFont);
  textSize(48);
  text("Michael Jordan  Air Jordan",350,100);
  
  fill(247,247,67);
  textFont(PGothicFont);
  textSize(48);
  text("Kobe Bryant the Black Mamba",10,450);
}

