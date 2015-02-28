
import ddf.minim.*;
Minim minim;
AudioPlayer player;

PFont myFont;

float x4 = -3500;
float y5 = -3500;

float x6 = 4700;
float y6 = 4700;

float x9 = 6000;
float y8 = 6000;

float x10 = -5900;
float y9 = -5900;

float x11 = 7000;
float y11 = 7000;

int x = 1600;
int x1 = 800;
int x2 = 3000;
int x3 = 5500;
int x5 = 8500;
int x7 = 4900;
int x8 = 11000;
int x12 = 7100;
int y1 = -1600;
int y2 = 2400;
int y3 = -2200;
int y4 = 3400;
int y7 = 5200;
int y10 = 12700;
int y12 = -7030;
int y13 = 7200;

PImage BillPhoto;

void setup () {
  size(800, 488);
  myFont = loadFont("Garamond-32.vlw");
  textFont(myFont, 200);
  BillPhoto = loadImage("8x10.jpg");

  minim = new Minim(this);
  player = minim.loadFile("BillSong.mp3");
}

void draw () {

  background(100);
  image(BillPhoto, 0, 0, width, height);
  x = x - 2;
  x1 = x1 - 1;
  x2 = x2 - 2;
  x3 = x3 - 2;
  x4 = x4 + 1;
  x5 = x5 - 2;
  x6 = x6 - 1;
  x7 = x7 - 1;
  x8 = x8 - 2;
  x9 = x9 - 1;
  x10 = x10 + 1;
  x11 = x11 - 1;
  x12 = x12 - 1;
  y1 = y1 + 1;
  y2 = y2 - 1;
  y3 = y3 + 1;
  y4 = y4 - 1;
  y5 = y5 + 1;
  y6 = y6 - 1;
  y7 = y7 - 1;
  y8 = y8 - 1;
  y9 = y9 + 1;
  y10 = y10 - 2;
  y11 = y11 - 1;
  y12 = y12 + 1;
  y13 = y13 - 1;

  fill(0);
  textFont(myFont, 80);
  text("I used to dream that I would discover", x, 400);

  fill(0);
  textFont(myFont, 130);
  text("the perfect lover someday", x1, 200);

  fill(0);
  textFont(myFont, 100);
  text("i knew i'd recognize him if ever", x2, 300);
  
  fill(0);
  textFont(myFont, 60);
  text("he came 'round my way", 10, y1);
  
  fill(0);
  textFont(myFont, 60);
  text("i always used to fancy then", 30, y2);

  fill(0);
  textFont(myFont, 40);
  text("he'd be one of the God-like kind of men", 40, y3);

  fill(0);
  textFont(myFont, 100);
  text("with a giant brain and a noble head", x3, 250);

  fill(0);
  textFont(myFont, 50);
  text("like the heroes bold in the books I've read", 8, y4);

  fill(0);
  textFont(myFont, 60);
  text("but along came Bill", x4, y5);

  fill(0);
  textFont(myFont, 40);
  text("who's not the type at all", x5, 270);

  fill(0);
  textFont(myFont, 40);
  text("you'd meet him on the street and never notice him", x6, y6);

  fill(0);
  textFont(myFont, 100);
  text("his form and face", x7, 400);

  fill(0);
  textFont(myFont, 120);
  text("his manly grace", 10, y7);

  fill(0);
  textFont(myFont, 50);
  text("are not the kind that you would find in a statue", x8, 170);

  fill(0);
  textFont(myFont, 50);
  text("oh i can't explain", x9, y8);
  
  fill(0);
  textFont(myFont, 50);
  text("it's surely not his brain", x10, y9);
  
  fill(0);
  textFont(myFont, 50);
  text("that makes me thrill", 250, y10);
  
  fill(0);
  textFont(myFont, 50);
  text("i love him because he's wonderful", x11, y11);

  fill(0);
  textFont(myFont, 50);
  text("because he's just", x12, 300);
  
  fill(0);
  textFont(myFont, 60);
  text("my", 200, y12);

  fill(0);
  textFont(myFont, 75);
  text("Bill", 275, y13);


}

void mousePressed() {
  player.play();
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}



