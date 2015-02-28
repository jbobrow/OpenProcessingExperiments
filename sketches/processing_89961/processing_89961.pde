
// Loris Uzan
// 2/19/13
// Copyright © 2012 Sony Pictures (James Bond Skyfall movie)

PImage judi;
PImage javier;
PImage qactor;
PImage qfont;
PImage jb;
PImage skyfall; 
PImage toys;
float a = 0;
PFont font;
float b = -300;

void setup() {
  size(500, 500);
  judi = loadImage("1.jpg");
  javier = loadImage("2.jpg");
  qactor = loadImage("4.jpg");
  qfont = loadImage("3.jpg");
  jb = loadImage("5.jpg");
  skyfall = loadImage("6.jpg");
  toys = loadImage("7.gif");
  font = loadFont("FreeSans.vlw");
  textFont (font);
  background(255);
} 

void draw() {

  background(255);
  if ((mouseX>175)&&(mouseY>181)&&(mouseX<325)&&(mouseY<319)) {
    image(javier, 190, 175);
  } 
  else { 
    image(judi, 175, 181);
  }

  if ((mouseX<150) && (mouseY<150)) {
    image(qactor, 0, 0);
  } 
  else {
    image(qfont, 0, 0);
  }
  if ((mouseX<150) && (mouseY>454)) {
    image(jb, 0, 454);
    image(skyfall, b=b+5, 300);
  } 
  else {
    image(jb, 0, 454);
    b=-300;

    if (mousePressed == true) {
      image(toys, 0, -149/2);
      fill(255, 255, 255, a=a+2);
      text("Think on your sins", 200, 420);
    } 
    else {
      a=0;
    }
  }
}




